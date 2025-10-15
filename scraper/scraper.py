import csv
from playwright.sync_api import sync_playwright, TimeoutError

def scrape_site(url, site_name, product_selector, name_selector, price_selector):
    """
    A more generic function to scrape a website using Playwright.
    """
    products = []
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        print(f"--- Attempting to scrape {site_name} ---")
        try:
            page.goto(url, wait_until="networkidle", timeout=90000)
        except TimeoutError:
            print(f"Timeout while loading {url}. The site may be slow or have anti-scraping measures.")
            page.screenshot(path=f"scraper/{site_name}_error.png")
            browser.close()
            return []
        except Exception as e:
            print(f"An unexpected error occurred while loading {url}: {e}")
            browser.close()
            return []

        try:
            page.wait_for_selector(product_selector, timeout=30000)
            product_elements = page.locator(product_selector).all()

            if not product_elements:
                print(f"No products found on {site_name} with selector '{product_selector}'.")
                browser.close()
                return []

            print(f"Found {len(product_elements)} product elements on {site_name}.")

            for element in product_elements:
                try:
                    name = element.locator(name_selector).first.inner_text()
                    price = element.locator(price_selector).first.inner_text()
                    products.append({"name": name.strip(), "price": price.strip()})
                except Exception:
                    # It's common for some elements not to match, so we can ignore them
                    pass

        except TimeoutError:
            print(f"Timed out waiting for selector '{product_selector}' on {site_name}.")
            page.screenshot(path=f"scraper/{site_name}_error.png")
        except Exception as e:
            print(f"An error occurred while scraping {site_name}: {e}")

        browser.close()

    return products

def save_to_csv(products, filename):
    """
    Saves a list of products to a CSV file.
    """
    if not products:
        return

    # Correct the file path to be inside the scraper directory
    filepath = f"scraper/{filename}"

    with open(filepath, "w", newline="", encoding="utf-8") as csvfile:
        fieldnames = ["name", "price"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(products)
    print(f"Data successfully saved to {filepath}")

if __name__ == "__main__":
    print("Starting the web scraping process...")

    # --- Scrape Jumbo ---
    jumbo_url = "https://www.jumbo.cl/lacteos-y-quesos"
    jumbo_products = scrape_site(
        url=jumbo_url,
        site_name="Jumbo",
        product_selector="div.product-card",
        name_selector="h3",
        price_selector="span.price-format"
    )
    if jumbo_products:
        save_to_csv(jumbo_products, "jumbo_products.csv")
    else:
        print("Could not scrape any products from Jumbo.cl.")

    # --- Scrape Santa Isabel ---
    santaisabel_url = "https://www.santaisabel.cl/frutas-y-verduras"
    santaisabel_products = scrape_site(
        url=santaisabel_url,
        site_name="Santa Isabel",
        product_selector="div.product-card",
        name_selector="a.product-card-name",
        price_selector="span.price-format"
    )
    if santaisabel_products:
        save_to_csv(santaisabel_products, "santaisabel_products.csv")
    else:
        print("Could not scrape any products from Santa Isabel.")

    print("\n--- Scraping process finished. ---")
    print("Note: Lider.cl was not scraped as it is protected by a CAPTCHA.")