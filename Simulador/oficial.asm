
.data
objeto_valores: .word 50, 20, 30, 10  # Define valores de ejemplo para objetos
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

# Seccion de datos: Inicializacion de los Pokemon
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

_main:

beq zero, zero, _start

_print_number:            # a0: numero para imprimir en consola
    addi a7, zero, 1
    ecall
    jalr zero, 0(ra)

_print_string:            # a0: direccion del string para imprimir en consola
    addi a7, zero, 4
    ecall
    jalr zero, 0(ra)

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


_rand_number:            # a0: rango del numero random.  El numero estara en el rango [0, a0[. Se devuelve el valor en a0.
    addi sp, sp, -4
    sw a1, 0(sp)
    addi a7, zero, 42
    add a1, zero, a0
    addi a0, zero, 0
    ecall
    lw a1, 0(sp)
    addi sp, sp, 4
    jalr zero, 0(ra)

_contest:
    # Imprimir inicio del concurso

    addi sp, sp, -8    
    sw ra, 0(sp)      
    sw a0, 4(sp)

    la a0, concurso_text
    jal ra, _print_string

    # Imprimir mensaje de presentación por turnos
    la a0, turn_presentation_text
    jal ra, _print_string
    lw a0, 4(sp)
    jal ra, presentation_turn    # Llamar a la subrutina para hacer la presentacion por turnos

    # Imprimir mensaje de intervención de la jueza
    la a0, judge_text
    jal ra, _print_string
    lw a0, 4(sp)
    jal ra, judge               # Llamar a la subrutina de la jueza para premiar o castigar

    # Imprimir mensaje estrella dorada
    la a0, dorada_text
    jal ra, _print_string
    lw a0, 4(sp)
    jal ra, _check_gold               # Llamar a la subrutina de estrella dorada

    # Imprimir mensaje liston
    la a0, ribbon_text
    jal ra, _print_string
    lw a0, 4(sp)
    jal ra, _check_ribbon               # Llamar a la subrutina de liston

    # Imprimir mensaje de verificación del ganador
    la a0, check_winner_text
    jal ra, _print_string
    lw a0, 4(sp)
    jal ra, _check_winner       # Llamar a la subrutina para verificar si hay un ganador
    lw ra, 0(sp)   

    # Repetir el ciclo del concurso si no hay ganador
    beq a0, zero, _repeat_contest  

    # Término del programa.
    addi sp, sp, 8
    jalr zero, 0(ra)         # Retornar
    

    _repeat_contest:
      lw a0, 4(sp)
      addi sp, sp, 8
      beq zero, zero, _contest

_check_ribbon:
    addi sp, sp, -12          # Reservar espacio en el stack
    sw ra, 0(sp)             # Respaldar ra
    sw a0, 4(sp)             # Respaldar a0
    sw a1, 8(sp)             # Respaldar a1

    lw t1, 16(a0)             # Cargar estrellas doradas poke 0
    lw t2, 16(a1)             # Cargar estrellas doradas poke 1
    addi t3, zero, 5

    bgt t3, t1, _check_other
    beq t1, t2, _check_id
    beq zero, zero, _add_ribbon_p1

    _check_other:
      bgt t3,t2, _finish_check_ribbon
      beq t1, t2, _check_id
      bgt t1, t2, _add_ribbon_p1
      beq zero, zero, _add_ribbon_p2

    _check_id:
    lw t4, 0(a0)
    lw t5, 0(a1)
    bgt t5, t4, _add_ribbon_p2

    _add_ribbon_p1:
        la a0, ribbon_p1_text        # Mensaje "P1 gana un liston"
        jal ra, _print_string        # Imprimir mensaje
        lw a0, 4(sp)                # Recuperar la dirección de P1 (Bulbasaur)
        
        jal ra, _print_pokemon_name  # Imprimir el nombre del Pokémon ganador
        la a0, _text_ID              # Imprimir "ID: "
        jal ra, _print_string
        lw a0, 0(a0)                 # Cargar el ID del Pokémon
        jal ra, _print_number        # Imprimir el ID

        lw t6, 8(a0)                # Cargar el número de listones
        addi t6, t6, 1              # Incrementar el número de listones
        sw t6, 8(a0)                # Guardar el nuevo número de listones
        lw t6, 16(a0)               # Resetear estrellas doradas
        add t6, zero, zero
        sw t6, 16(a0)
        beq zero, zero, _finish_check_ribbon


    _add_ribbon_p2:
        la a0, ribbon_p2_text        # Mensaje "P2 gana un liston"
        jal ra, _print_string        # Imprimir mensaje
        lw a1, 8(sp)                # Recuperar la dirección de P2 (Charmander)

        jal ra, _print_pokemon_name  # Imprimir el nombre del Pokémon ganador
        la a0, _text_ID              # Imprimir "ID: "
        jal ra, _print_string
        lw a0, 0(a1)                 # Cargar el ID del Pokémon
        jal ra, _print_number        # Imprimir el ID

        lw t6, 8(a1)                # Cargar el número de listones
        addi t6, t6, 1              # Incrementar el número de listones
        sw t6, 8(a1)                # Guardar el nuevo número de listones
        lw t6, 16(a1)               # Resetear estrellas doradas
        add t6, zero, zero
        sw t6, 16(a1)
        beq zero, zero, _finish_check_ribbon



    _finish_check_ribbon:
        lw a0, 4(sp)
        lw a1, 8(sp)
        lw ra, 0(sp)
        addi sp, sp, 12          # Liberar espacio en el stack
        addi a7, zero, 10        # Llamada de sistema para salir del programa
        ecall                    # Terminar ejecución



_check_gold:
    addi sp, sp, -12          # Reservar espacio en el stack
    sw ra, 0(sp)             # Respaldar ra
    sw a0, 4(sp)             # Respaldar a0
    sw a1, 8(sp)             # Respaldar a1

    lw t1, 48(a0)             # Cargar estrellas plateadas poke 0
    lw t2, 48(a1)             # Cargar estrellas plateadas poke 1

    beq t1, t2, _finish_check

    bgt t1, t2, _add_gold_p1

    beq zero, zero, _add_gold_p2

    _add_gold_p1:
    la a0, dorada_p1_text
    jal ra, _print_string
    lw a0, 4(sp)
    
    lw t6, 16(a0)
    addi t6, t6, 1
    sw t3, 16(a0)
    beq zero,zero, _finish_check

    _add_gold_p2:
    la a0, dorada_p2_text
    jal ra, _print_string
    lw a0, 4(sp)
    
    lw t6, 16(a1)
    addi t6, t6, 1
    sw t3, 16(a1)

    _finish_check:

    lw a0, 4(sp)
	lw a1, 8(sp)
	lw ra, 0(sp)
    addi sp, sp, 12           # Liberar espacio en el stack
    jalr zero, 0(ra)         # Retornar

# Subrutina _check_winner: Verificar si alguno de los Pokémon ha ganado
_check_winner:
    addi sp, sp, -8          # Reservar espacio en el stack
    sw ra, 0(sp)             # Respaldar ra
    sw a0, 4(sp)             # Respaldar a0

    # Imprimir mensaje de verificación de ganador
    la a0, check_winner_text
    jal ra, _print_string

    lw a0, 4(sp)
    addi t2, zero, 10                # Listones necesarios para ganar
    lw t0, 8(a0)             # Cargar listones del primer Pokémon
    bge t0, t2, _print_winner

    lw t1, 8(a1)             # Cargar listones del segundo Pokémon
    bge t1, t2, _print_winner
    # Valor de retorno a0 = 0 si ninguno gana.
    addi a0, zero, 0
 _check_winner_continue:  
     lw ra, 0(sp)             # Restaurar ra
     addi sp, sp, 8           # Liberar espacio en el stack
     jalr zero, 0(ra)         # Retornar

_print_winner:
    addi sp, sp, -4
    sw ra, 0(sp)
    # Print mensaje indicando el ganador
    la a0, finish_text
    jal ra, _print_string
    # Valor de retorno a0 = 1.
    addi a0, zero, 1
    # Restaurar ra y retornar
    lw ra, 0(sp)
    addi sp, sp, 4
    beq zero, zero, _check_winner_continue

# Subrutina _check_status: Revisar el estado y manejar probabilidades (optimización)
_check_status:
    addi sp, sp, -12          # Reservar espacio en el stack
    sw ra, 0(sp)             # Respaldar ra
    sw a0, 4(sp)             # Respaldar a0
    sw a1, 8(sp)             # Respaldar a1

    # Llamar subrutina para verificar cada Pokémon
    jal ra, _check_individual_status
    addi a0, a1, 0              # Cambiar al segundo Pokémon
    jal ra, _check_individual_status

    lw a1, 8(sp)             # Restaurar ra
    lw a0, 4(sp)             # Restaurar ra
    lw ra, 0(sp)             # Restaurar ra
    addi sp, sp, 12           # Liberar espacio en el stack
    jalr zero, 0(ra)         # Retornar

_check_individual_status:
    lw t0, 12(a0)            # Cargar estado del Pokémon
    addi t3, zero, 30                # Probabilidad de curar
    bnez t0, _handle_status   # Si el estado es diferente de saludable
    jalr zero, 0(ra)         # Retornar si está saludable

_handle_status:
    # Imprimir mensaje de manejo del estado
    la a0, handle_status_text
    jal ra, _print_string

    # Revisar probabilidad de curar
    jal ra, _rand_number     # Obtener número aleatorio
    blt a0, t3, _set_healthy
    jalr zero, 0(ra)         # Retornar

_set_healthy:
    # Imprimir mensaje de cambio a saludable
    la a0, set_healthy_text
    jal ra, _print_string

    sw zero, 12(a0)          # Cambiar estado a saludable
    jalr zero, 0(ra)         # Retornar


# Subrutina presentation: Computar los puntos de belleza y las estrellas de plata
presentation:    # a0: dirección del pokemon atacante, a1: dirección del pokemon defensor
    addi sp, sp, -8           # Reserva espacio en el stack
    sw ra, 0(sp)              # Respaldar ra
    sw s0, 4(sp)              # Respaldar s0
    add s0, zero, a0          # Copia la dirección del atacante en s0

    # Obtener objeto del atacante y contrincante
    lw t0, 40(s0)             # Objeto del atacante
    lw t1, 40(a1)             # Objeto del contrincante

    # Calcular puntos de belleza del atacante
    la t2, objeto_valores
    slli t0, t0, 2            # Multiplica por 4 (desplazamiento)
    add t2, t2, t0            # Apunta al valor de ataque correspondiente en objeto_valores
    lw t3, 0(t2)              # t3 obtiene el offset del atributo a cargar
    lw t4, 0(s0)              # Carga el valor real del atributo (Ataque, Defensa, etc.)
    add t5, t4, zero          # Almacena puntos de belleza en t5

    # Calcular puntos de belleza del defensor
    la t2, objeto_valores
    slli t1, t1, 2            # Multiplica por 4 (desplazamiento)
    add t2, t2, t1            # Apunta al valor de defensa correspondiente en objeto_valores
    lw t3, 0(t2)
    lw t4, 0(a1)
    add t6, t4, zero          # Puntos de belleza del defensor en t6

    # Calcular el ponderador rol
    lw t0, 44(s0)             # Rol del atacante
    lw t1, 44(a1)             # Rol del defensor
    # Implementar las condiciones de comparación y calcular ponderador

    # Calcular y actualizar estrellas plateadas
    sub t2, t5, t6            # Resta puntos de belleza
    add t2, t2, t3            # Sumar ponderador (asumiendo que t3 es el ponderador calculado)
    # Asegurar que estrellas plateadas no sean negativas

    lw ra, 0(sp)              # Restaurar ra
    lw s0, 4(sp)              # Restaurar s0
    addi sp, sp, 8            # Liberar espacio en el stack
    jalr zero, 0(ra)


    # Subrutina presentation_turn: Maneja la presentación por turnos de los Pokémon
    presentation_turn:
        addi sp, sp, -20          # Reservar espacio en el stack
        sw ra, 0(sp)              # Respaldar ra
        sw s0, 4(sp)              # Respaldar s0
        sw s1, 8(sp)              # Respaldar s1
        sw s2, 12(sp)             # Respaldar s2
        sw s3, 16(sp)             # Respaldar s3

        add s0, a0, zero          # s0 = dirección del primer Pokémon
        add s1, a1, zero          # s1 = dirección del segundo Pokémon

        # Calcular velocidades efectivas
        jal ra, _calculate_effective_speed
        add s2, a0, zero          # s2 = velocidad efectiva del primer Pokémon
        add a0, s1, zero
        jal ra, _calculate_effective_speed
        add s3, a0, zero          # s3 = velocidad efectiva del segundo Pokémon

        # Comparar velocidades y decidir orden
        blt s2, s3, _second_first
        blt s3, s2, _first_first
        # En caso de empate, comparar IDs
        lw t0, 0(s0)
        lw t1, 0(s1)
        blt t0, t1, _second_first

    _first_first:
        add a0, s0, zero
        add a1, s1, zero
        jal ra, presentation
        add a0, s1, zero
        add a1, s0, zero
        jal ra, presentation
        beq zero, zero, _end_presentation_turn

    _second_first:
        add a0, s1, zero
        add a1, s0, zero
        jal ra, presentation
        add a0, s0, zero
        add a1, s1, zero
        jal ra, presentation

    _end_presentation_turn:
        lw ra, 0(sp)              # Restaurar ra
        lw s0, 4(sp)              # Restaurar s0
        lw s1, 8(sp)              # Restaurar s1
        lw s2, 12(sp)             # Restaurar s2
        lw s3, 16(sp)             # Restaurar s3
        addi sp, sp, 20           # Liberar espacio en el stack
        jalr zero, 0(ra)          # Retornar

    # Subrutina auxiliar para calcular la velocidad efectiva
    _calculate_effective_speed:
        lw t0, 36(a0)             # Cargar velocidad base
        lw t1, 12(a0)             # Cargar estado
        addi t2, zero, 2
        bne t1, t2, _return_speed # Si no está paralizado, retornar velocidad base
        # Si está paralizado, dividir velocidad por 4
        srli t0, t0, 2            # Dividir por 4 (shift right logical immediate)
    _return_speed:
        add a0, t0, zero          # Retornar velocidad efectiva en a0
        jalr zero, 0(ra)

    # Subrutina judge: Jueza premia o castiga a los Pokémon
    judge:
        addi sp, sp, -16          # Reservar espacio en el stack
        sw ra, 0(sp)              # Respaldar ra
        sw s0, 4(sp)              # Respaldar s0
        sw s1, 8(sp)              # Respaldar s1
        sw s2, 12(sp)             # Respaldar s2

        add s0, a0, zero          # s0 = dirección del primer Pokémon
        add s1, a1, zero          # s1 = dirección del segundo Pokémon

        # Calcular total de listones
        lw t0, 8(s0)              # Listones del primer Pokémon
        lw t1, 8(s1)              # Listones del segundo Pokémon
        add s2, t0, t1            # s2 = total de listones

        # Decidir acción basada en total de listones
        beq s2, zero, _give_silver_stars
        addi t2, zero, 3
        ble s2, t2, _poison_pokemon
        addi t2, zero, 7
        ble s2, t2, _burn_pokemon
        beq zero, zero, _paralyze_pokemon

    _give_silver_stars:
        lw t0, 48(s0)             # Estrellas plateadas del primer Pokémon
        lw t1, 48(s1)             # Estrellas plateadas del segundo Pokémon
        blt t0, t1, _give_stars_to_first
        blt t1, t0, _give_stars_to_second
        # En caso de empate, comparar IDs
        lw t0, 0(s0)
        lw t1, 0(s1)
        bgt t0, t1, _give_stars_to_second
        beq zero, zero, _give_stars_to_first

    _give_stars_to_first:
        lw t0, 48(s0)
        addi t0, t0, 5
        sw t0, 48(s0)
        beq zero, zero, _end_judge

    _give_stars_to_second:
        lw t0, 48(s1)
        addi t0, t0, 5
        sw t0, 48(s1)
        beq zero, zero, _end_judge

    _poison_pokemon:
        jal ra, _get_pokemon_with_more_ribbons
        addi t1, zero, 1          # Estado: Envenenado
        beq zero, zero, _apply_status

    _burn_pokemon:
        jal ra, _get_pokemon_with_more_ribbons
        addi t1, zero, 3          # Estado: Quemado
        beq zero, zero, _apply_status

    _paralyze_pokemon:
        jal ra, _get_pokemon_with_more_ribbons
        addi t1, zero, 2          # Estado: Paralizado

    _apply_status:
        lw t2, 12(a0)             # Cargar estado actual
        blt t2, t1, _update_status
        beq zero, zero, _end_judge

    _update_status:
        sw t1, 12(a0)             # Actualizar estado

    _end_judge:
        lw ra, 0(sp)              # Restaurar ra
        lw s0, 4(sp)              # Restaurar s0
        lw s1, 8(sp)              # Restaurar s1
        lw s2, 12(sp)             # Restaurar s2
        addi sp, sp, 16           # Liberar espacio en el stack
        jalr zero, 0(ra)          # Retornar

    # Subrutina auxiliar para obtener el Pokémon con más listones
    _get_pokemon_with_more_ribbons:
        lw t0, 8(s0)              # Listones del primer Pokémon
        lw t1, 8(s1)              # Listones del segundo Pokémon
        blt t0, t1, _second_has_more
        blt t1, t0, _first_has_more
        # En caso de empate, comparar IDs
        lw t0, 0(s0)
        lw t1, 0(s1)
        blt t0, t1, _second_has_more

    _first_has_more:
        add a0, s0, zero
        jalr zero, 0(ra)

    _second_has_more:
        add a0, s1, zero
        jalr zero, 0(ra)
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


    #####################################################
    ## Concurso Bulbasaur vs Charmander
    #####################################################

    la a0, bulbasaur
    la a1, charmander
    jal ra, presentation_turn
    la a0, bulbasaur
    jal ra, _print_pokemon
    la a0, charmander
    jal ra, _print_pokemon
    la a0, bulbasaur
    la a1, charmander
    jal ra, presentation_turn
    la a0, bulbasaur
    jal ra, _print_pokemon
    la a0, charmander
    jal ra, _print_pokemon
    addi a7, zero, 10
    ecall
   
_end:
