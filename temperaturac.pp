#include <iostream>
#include <stdlib.h>
using namespace std;


// Definiendo un tipo de dato para el registro de temperatura
struct RegistroTemperatura {
    char fecha [MAX_FECHA];
    float manana;
    float tarde;
    float noche;
    struct RegistroTemperatura *sig;
};

struct RegistroTemperatura *cab, *aux, *aux2;

// Función para registrar la temperatura de un día
void registrar() {
    aux = (struct RegistroTemperatura *)malloc(sizeof(struct RegistroTemperatura));
    cout << "Ingrese la fecha (DD/MM/AAAA): ";
    cin >> aux->fecha;
    cout << "Ingrese la temperatura de la mañana: ";
    cin >> aux->manana;
    cout << "Ingrese la temperatura de la tarde: ";
    cin >> aux->tarde;
    cout << "Ingrese la temperatura de la noche: ";
    cin >> aux->noche;
    aux->sig = NULL;
    if (cab == NULL) {
        cab = aux;
        aux->sig = NULL;
        aux = NULL;
        free(aux);
    } else {
        aux2 = cab;
        while (aux2->sig != NULL) {
            aux2 = aux2->sig;
        }
        aux2->sig = aux;
        aux2 = aux = NULL;
        free(aux);
        free(aux2);
    }
}

// Función para mostrar los registros de temperatura
void mostrar() {
    for (aux = cab; aux != NULL; aux = aux->sig) {
        cout << "Fecha: " << aux->fecha << endl;
        cout << "Mañana: " << aux->manana << " grados" << endl;
        cout << "Tarde: " << aux->tarde << " grados" << endl;
        cout << "Noche: " << aux->noche << " grados" << endl << endl;
    }
}

int main() {
    cab = NULL; // Inicializar la lista vacía
    int opc = 0;
    do {
        cout << "1. Registrar temperatura del día" << endl;
        cout << "2. Ver registros de temperatura" << endl;
        cout << "Ingrese su opción: ";
        cin >> opc;
        switch (opc) {
            case 1:
                registrar();
                break;
            case 2:
                mostrar();
                break;
            default:
                cout << "Opción inválida. Intente de nuevo." << endl;
        }
    } while (opc != 3);
    return 0;
}
