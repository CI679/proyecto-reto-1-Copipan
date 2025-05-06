#!/bin/bash

#Metodologías Ágiles
meto_agiles() {
    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:

    SCRUM
    XP (Programación Extrema)
    Kanban
    Crystal"
}
#Metodologías Tradicionales
meto_tradi() {
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:

    Cascada
    Espiral
    Modelo V"
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