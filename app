#!/bin/bash
sub_menu() {
    while true; do
        echo "Usted está en la sección '$1', seleccione la opción que desea utilizar."
        echo "1. Agregar información"
        echo "2. Buscar"
        echo "3. Eliminar información"
        echo "4. Leer base de información"
        echo "5. Volver al menu anterior"
        echo "6. Terminar ejecución"

        read opt

        case $opt in
            1)
                echo -n "Ingrese el concepto: "
                read concepto
                echo -n "Ingrese la definición: "
                read definicion

                archivo="${1}.inf"
                echo "[$concepto] .- $definicion" >> "$archivo"
                echo "Información agregada exitosamente al archivo '$archivo'."
                ;;
            2)
		echo -n "Ingrese el concepto que desee buscar: "
    		read busqueda
    		archivo="${1}.inf"
    		if grep -E "\[$busqueda\]" "$archivo" > /dev/null; then
        	echo "Identificador encontrado en base al concepto buscado."
        	grep -E "\[$busqueda\]" "$archivo"
    		else
        	echo "El concepto '$busqueda' no existe o no se encontró."
	        fi
                ;;
            3)
                ;;
            4)
                ;;
            5)
                ;;
            6)
                ;;
            *)
                echo "Opción no válida, intente nuevamente."
            ;;


}
#Metodologías Ágiles
meto_agiles() {
    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:

    SCRUM
    XP (Programación Extrema)
    Kanban
    Crystal"
    opt="1"
    read opt

    case $opt in
        SCRUM)
            sub_menu "SCRUM"
            ;;
        XP)
            sub_menu "XP"
            ;;
        Kanban)
            sub_menu "Kanban"
            ;;
        Crystal)
            sub_menu "Crystal"
            ;;
        *)echo "Función no válida. Usa: -a (metodologías ágiles), -t (metodologías tradicionales), -x (salir)."
            ;;
    esac
}
#Metodologías Tradicionales
meto_tradi() {
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:

    Cascada
    Espiral
    Modelo_V"

    opt="1"
    read opt

    case $opt in
        Cascada)
            sub_menu "Cascada"
            ;;
        Espiral)
            sub_menu "Espiral"
            ;;
        Modelo_V)
            sub_menu "Modelo V"
            ;;
        *)echo "Función no válida. Usa: -a (metodologías ágiles), -t (metodologías tradicionales), -x (salir)."
            ;;
    esac

}
res=$1

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
            echo -e "Función no válida. \nPor favor usa: -a (metodologías ágiles), -t (metodologías tradicionales), -x (salir)."
            ;;
    esac

        echo -e "\n\n   Introduzca una opción del menú: "
    read res

done
