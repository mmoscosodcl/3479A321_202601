# Diagrama de Estados (Máquina de Estados)
## Definición
Describe el comportamiento de un sistema (o una parte de él) examinando los cambios en su estado interno ante estímulos externos.

## Representación de Artefactos:

* **Círculo Sólido (●):** El Estado Inicial. Por donde empieza el flujo.

* **Rectángulos Redondeados:** Los Estados en los que puede estar el sistema (ej. Esperando, Jugando, Pausado, Victoria).

* **Flechas (Transiciones):** El camino entre un estado y otro.

* **Etiquetas en las flechas (Eventos/Triggers):** Qué evento causó el cambio (ej. "Tocar Bomba").

* **Círculo con punto (Bullseye):** El Estado Final. Indica que el ciclo de vida de ese proceso ha terminado.

## Consideraciones Clave:

* **Exclusividad:** Un sistema solo puede estar en un estado a la vez. No puedes estar en "Victoria" y "Derrota" simultáneamente.

* **Determinismo:** Para cada evento en un estado dado, debe haber una transición clara. Si no hay flecha para un evento, el sistema simplemente lo ignora.