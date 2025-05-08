#!/bin/bash

#Sub menú general
sub_menu() {
    while true; do
        echo -e "\nUsted está en la sección '$1', seleccione la opción que desea utilizar."
        echo "1. Agregar información"
        echo "2. Buscar Concepto"
        echo "3. Eliminar información"
        echo "4. Leer base de información"
        echo "5. Volver al menu anterior"
        echo -e "6. Terminar ejecución\n\t"
        read opt

        case $opt in
            1)
                echo -e "\n---   AGREGAR INFORMACIÓN   ---\n"
                echo -n "Ingrese el concepto: "
                read concepto
                echo -n "Ingrese la definición: "
                read definicion

                archivo="${1}.inf"
                echo "[$concepto] .- $definicion" >> "./$2/$archivo"
                echo "Información agregada exitosamente al archivo '$archivo' dentro de '$2'."
                ;;
            2)
                echo -e "\n---   BUSCAR CONCEPTO   ---\n"
		        echo -n "Ingrese el concepto que desee buscar: "
    		    read busqueda
    		    archivo="${1}.inf"
    		    if grep -E "\[$busqueda\]" "./$2/$archivo" > /dev/null; then
        	        echo -e "\nIdentificador encontrado en base al concepto buscado.\n"
        	        grep -E "\[$busqueda\]" "./$2/$archivo"
    		    else
        	        echo "El concepto '$busqueda' no existe o no se encontró."
	            fi
                ;;
            3)       
                echo -e "\n---   ELIMINAR INFORMACIÓN   ---\n"   
                echo -n "Ingrese el concepto que desee eliminar: "
                read conceptoAeliminar

                archivo="${1}.inf"

                if grep -q "\[$conceptoAeliminar\]" "./$2/$archivo"; then
                grep -v "\[$conceptoAeliminar\]" "./$2/$archivo" > archtemp.inf && mv archtemp.inf "./$2/$archivo"
                echo "El concepto '$conceptoAeliminar' se elimino de manera correcta."
                else
                echo "El concepto '$conceptoAeliminar' no existe. Intente de nuevo."
                fi
               ;;
            4)
                archivo="${1}.inf"
                if [[ -f "./$2/$archivo" ]]; then
                    if [[ -s "./$2/$archivo" ]]; then
                        echo -e "\n---   INFORMACIÓN DETALLADA DE $archivo   ---\n"
                        cat "./$2/$archivo"
                    else
                        echo "El archivo '$archivo' existe, pero no contiene información."
                    fi
                else
                    echo "No hay información para la metodologia '$1'."
                fi
                ;;
            5)
                echo -e "\n\t Regresando al menú anterior..."
                break
                ;;
            6)
                echo -e "\n\t Saliendo del programa..."
                exit
                ;;
            *)
                echo "\nOpción no válida, intente nuevamente.\n"
            ;;
        esac
        echo ""
    done
}

#Metodologías Ágiles
meto_agiles() {
    while true; do
        echo -e "\nBienvenido a la guía rápida de Agile, para continuar seleccione una opcion:

        SCRUM
        XP (Programación Extrema)
        Kanban
        Crystal
        Regresar
        Salir\n\t"
        read opt

        case $opt in
            SCRUM)
                sub_menu "SCRUM" "Metodologías Ágiles"
                ;;
            XP)
                sub_menu "XP" "Metodologías Ágiles"
                ;;
            Kanban)
                sub_menu "Kanban" "Metodologías Ágiles"
                ;;
            Crystal)
                sub_menu "Crystal" "Metodologías Ágiles"
                ;;
            Regresar)
                echo -e "\n\t Regresando al menú anterior...\n"
                break
                ;;
            Salir)
                echo -e "\n\t Saliendo del programa...\n"
                exit
                ;;
            *)echo -e "\nFunción no válida. Usa: SCRUM, XP, Kanban, Crystal, Regresar, Salir.\n"
                ;;
        esac
    done
}

#Metodologías Tradicionales
meto_tradi() {
    while true; do
        echo -e "\nBienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione una opcion:

        Cascada
        Espiral
        Modelo_V
        Regresar
        Salir\n\t"

        read opt

        case $opt in
            Cascada)
                sub_menu "Cascada" "Metodologías Tradicionales"
                ;;
            Espiral)
                sub_menu "Espiral" "Metodologías Tradicionales"
                ;;
            Modelo_V)
                sub_menu "Modelo V" "Metodologías Tradicionales"
                ;;
            Regresar)
                echo -e "\n\t Regresando al menú anterior...\n"
                break
                ;;
            Salir)
                echo -e "\n\t Saliendo del programa...\n"
                exit
                ;;
            *)echo -e "\nFunción no válida. Usa: Cascada, Espiral, Modelo_V, Regresar, Salir.\n"
                ;;
        esac
    done
}

#Atrapa el valor dado desde la terminal
res=$1

#Menú Principal Para Elegir Metodologías
while [ $res != "-x" ]; do
    case $res in
        -a)
            meto_agiles
            ;;
        -t)
            meto_tradi
            ;;
        -x)
            echo "Saliendo del programa, hasta pronto!"
            ;;
        *)
            echo -e "\n\tFunción no válida. Por favor usa las opciones disponibles.\n"
            ;;
    esac

        echo -e "\n\n   Introduzca una opción del menú:\n   -a. Metodologías Ágiles\n   -t. Metodologías Tradicionales\n   -x. salir\n\t"
    read res

done
