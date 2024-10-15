.data
#####################################################
# Mensajes y Constantes
#####################################################
concurso: .word 0
concurso_text: .string "\n\nConcurso Inicia\n"
compare_speed_text: .string "Comparando velocidades...\n"
turn_presentation_text: .string "Realizando presentacion por turnos...\n"
judge_text: .string "Jueza premiando o castigando...\n"
check_winner_text: .string "Verificando si hay un ganador...\n"
turno: .word 0
turno_text: .string "\nTurno "
finish_text: .string "Termino el concurso!"
compare_ids_text: .string "Comparando IDs..."
set_order_text: .string "Estableciendo el orden..."
handle_status_text: .string "Manejando el estado del Pokemon..."
set_healthy_text: .string "Cambiando estado a saludable..."
speed_result_text: .string "Velocidades de los Pokemon:\n"
equal_speed_text: .string "Velocidades iguales, comparando IDs...\n"
dorada_text: .string "Verificando si hay estrella dorada...\n" 
dorada_p1_text: .string "P1 gana una estrella dorada\n" 
dorada_p2_text: .string "P2 gana una estrella dorada\n" 
ribbon_p1_text: .string "P1 gana un liston \n" 
ribbon_p2_text: .string "P2 gana un liston \n" 
ribbon_text: .string "Verificando liston...\n" 
names: .string   "\nBulbasaur:  "
     "\nIvysaur:    "
     "\nVenusaur:   "
     "\nCharmander: "
     "\nCharmeleon: "
     "\nCharizard:  "
     "\nSquirtle:   "
     "\nWartortle:  "
     "\nBlastoise:  "
_text_ID:   .string "\nID: "
_text_Tipo:     .string "\nTipo: "
_text_Listones: .string "\nListones: "
_text_Estado:  .string "\nEstado: "
_text_EstDor: .string "\nEstrellas Doradas: "
_text_Atk:   .string "\nAtaque: "
_text_Def:   .string "\nDefensa: "
_text_Atk_S:  .string "\nAtaque Especial: "
_text_Def_S:  .string "\nDefensa Especial: "
_text_Vel:   .string "\nVelocidad: "
_text_Obj:   .string "\nObjeto: "
_text_Rol:   .string "\nRol Batalla: "
_text_EstPlt:   .string "\nEstrellas Plateadas: "

#####################################################
# Datos de Pokémon
#####################################################
bulbasaur: .word 1  # ID del Pokemon 1
        .word 0  # Tipo: Planta
        .word 0  # Listones
        .word 0  # Estado: Saludable
        .word 0  # Estrellas doradas
        .word 50 # Ataque
        .word 30 # Defensa
        .word 40 # Ataque Especial
        .word 35 # Defensa Especial
        .word 60 # Velocidad
        .word 0  # Objeto: Piedra
        .word 0  # Rol Batalla: Fisico
        .word 0  # Estrellas plateadas

charmander: .word 4  # ID del Pokémon 2
        .word 1  # Tipo: Fuego
        .word 0  # Listones
        .word 0  # Estado: Saludable
        .word 0  # Estrellas doradas
        .word 45 # Ataque
        .word 20 # Defensa
        .word 50 # Ataque Especial
        .word 25 # Defensa Especial
        .word 55 # Velocidad
        .word 1  # Objeto: Pañuelo
        .word 1  # Rol Batalla: Especial
        .word 0  # Estrellas plateadas

squirtle: .word 7  # ID del Pokémon 3
        .word 2  # Tipo: Agua
        .word 0  # Listones
        .word 0  # Estado: Saludable
        .word 0  # Estrellas doradas
        .word 40 # Ataque
        .word 35 # Defensa
        .word 30 # Ataque Especial
        .word 45 # Defensa Especial
        .word 65 # Velocidad
        .word 2  # Objeto: Huevo
        .word 2  # Rol Batalla: Mixto
        .word 0  # Estrellas plateadas

.text

#####################################################
# Punto de Entrada Principal
#####################################################
_main:
    beq zero, zero, _start

#####################################################
# Subrutina: _print_number
#####################################################
_print_number:            # a0: numero para imprimir en consola
    addi a7, zero, 1
    ecall
    jalr zero, 0(ra)

#####################################################
# Subrutina: _print_string
#####################################################
_print_string:            # a0: direccion del string para imprimir en consola
    addi a7, zero, 4
    ecall
    jalr zero, 0(ra)

#####################################################
# Subrutina: _print_pokemon_name
#####################################################
_print_pokemon_name: # a0: direccion del pokemon a imprimir. Imprime el nombre del pokemon en a0.
    lw t0, 0(a0)
    addi t1, zero, 14  
    mul t0, t0, t1
    addi t0, t0, -14
    la a0, names
    add a0, t0, a0
    addi a7, zero, 4
    ecall
    jalr zero, 0(ra)

#####################################################
# Subrutina: _print_pokemon
#####################################################
_print_pokemon:   # a0: direccion del pokemon a imprimir. Imprime el nombre del pokemon + todos sus atributos.
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)
    add s0, zero, a0

    jal ra, _print_pokemon_name

    la a0, _text_ID
    jal ra, _print_string
    lw a0, 0(s0)
    jal ra, _print_number

    la a0, _text_Tipo
    jal ra, _print_string
    lw a0, 4(s0)
    jal ra, _print_number

    la a0, _text_Listones
    jal ra, _print_string
    lw a0, 8(s0)
    jal ra, _print_number

    la a0, _text_Estado
    jal ra, _print_string
    lw a0, 12(s0)
    jal ra, _print_number

    la a0, _text_EstDor
    jal ra, _print_string
    lw a0, 16(s0)
    jal ra, _print_number

    la a0, _text_Atk
    jal ra, _print_string
    lw a0, 20(s0)
    jal ra, _print_number

    la a0, _text_Def
    jal ra, _print_string
    lw a0, 24(s0)
    jal ra, _print_number

    la a0, _text_Atk_S
    jal ra, _print_string
    lw a0, 28(s0)
    jal ra, _print_number

    la a0, _text_Def_S
    jal ra, _print_string
    lw a0, 32(s0)
    jal ra, _print_number

    la a0, _text_Vel
    jal ra, _print_string
    lw a0, 36(s0)
    jal ra, _print_number

    la a0, _text_Obj
    jal ra, _print_string
    lw a0, 40(s0)
    jal ra, _print_number

    la a0, _text_Rol
    jal ra, _print_string
    lw a0, 44(s0)
    jal ra, _print_number

    la a0, _text_EstPlt
    jal ra, _print_string
    lw a0, 48(s0)
    jal ra, _print_number

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8
    jalr zero, 0(ra)

#####################################################
# Subrutina: presentation
#####################################################
presentation:
    # Implementación detallada de presentation aquí.
    jalr zero, 0(ra)

#####################################################
# Subrutina: presentation_turn
#####################################################
presentation_turn:
    # Implementación detallada de presentation_turn aquí.
    jalr zero, 0(ra)

#####################################################
# Subrutina: judge
#####################################################
judge:
    # Implementación detallada de judge aquí.
    jalr zero, 0(ra)

#####################################################
# Punto de Entrada: _start
#####################################################
_start:
    # Concurso Bulbasaur vs Charmander
    la a0, bulbasaur
    la a1, charmander
    jal ra, presentation_turn

    # Imprimir resultados de los Pokémon después de la presentación
    la a0, bulbasaur
    jal ra, _print_pokemon
    la a0, charmander
    jal ra, _print_pokemon

    # Repetir la presentación para asegurar acumulación
    la a0, bulbasaur
    la a1, charmander
    jal ra, presentation_turn

    # Verificar estados finales
    la a0, bulbasaur
    jal ra, _print_pokemon
    la a0, charmander
    jal ra, _print_pokemon

    addi a7, zero, 10
    ecall
_end:
