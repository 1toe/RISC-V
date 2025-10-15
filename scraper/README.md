# Web Scraper Project

This repository contains a Python script developed to scrape product information from three Chilean e-commerce websites.

## Objective

The goal was to extract product data (names and prices) from the following URLs:
-   Lider.cl: `https://super.lider.cl/browse/frescos-y-lacteos/huevos-y-mantequillas/huevos/45669105_83514807_48569905`
-   Jumbo.cl: `https://www.jumbo.cl/lacteos-y-quesos/queseria`
-   Santaisabel.cl: `https://www.santaisabel.cl/frutas-y-verduras/frutas-y-verduras-organicas`

## Setup Instructions

1.  **Install Python libraries:**
    The script uses Playwright for browser automation.
    ```bash
    pip install playwright
    ```

2.  **Install browser dependencies:**
    Playwright requires browser binaries to be installed.
    ```bash
    python3 -m playwright install
    ```

## How to Run the Scraper

To execute the script, run the following command from the root directory:
```bash
python3 scraper/scraper.py
```
The script will attempt to scrape the sites and will print the results to the console. If a site cannot be scraped, it will save a screenshot of the error page to the `scraper/` directory.

## Final Conclusion and Limitations

After multiple attempts using different strategies (including basic requests and advanced browser automation with Playwright), it has been determined that **scraping these websites is not feasible with the current tools and methods.**

The reasons for this are as follows:

1.  **Lider.cl**: This website is protected by a sophisticated **CAPTCHA** ("Robot or human?"). This security measure is specifically designed to block automated access, and the script cannot bypass it.

2.  **Jumbo.cl and Santaisabel.cl**: These websites employ advanced **anti-scraping techniques**. When accessed by an automated browser, the pages either fail to load content (getting stuck on a "skeleton" loading screen) or return error pages. Despite trying various URLs (specific categories and broader ones) and adjusting scraper settings (e.g., timeouts, selectors), the product content is never rendered in a way that can be accessed by the script.

This project serves as a demonstration of the challenges involved in web scraping modern, protected e-commerce sites. The final script is a robust attempt that handles these failures gracefully.