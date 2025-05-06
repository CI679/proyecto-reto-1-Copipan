#!/bin/bash
sub_menu() {
    echo "Usted está en la sección '$1', seleccione la opción que desea utilizar."


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
res="e"

while [ $res != "-x" ]; do
    echo "Menú:
            Introduzca una opción del menú: "
    read res

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
            echo "Función no válida. Usa: -a (metodologías ágiles), -t (metodologías tradicionales), -x (salir)."
            ;;
    esac
done