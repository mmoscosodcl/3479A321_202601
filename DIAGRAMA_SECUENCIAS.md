# Diagrama de Secuencia (UML)
## Definición

Representa la interacción dinámica entre objetos a lo largo del tiempo. Es ideal para modelar "Casos de Uso" (ej. "¿Qué pasa cuando el usuario toca una mina?").

## Representación de Artefactos:

* **Líneas Verticales (Lifelines):** Representan la existencia de un objeto a través del tiempo.

* **Rectángulos sobre las líneas (Activación):** Indican que el objeto está realizando una operación activa en ese momento.

* **Flechas de Punta Maciza (—>):** Llamadas sincrónicas (métodos). El emisor espera una respuesta.

* **Flechas de Punta Abierta (-->):** Llamadas asíncronas o disparos de eventos.

* **Flechas Discontinuas (<--):** El retorno de una función o el envío de un dato de vuelta.

* **Fragmentos (Alt / Opt / Loop):** Cajas que envuelven partes del diagrama para mostrar condicionales (Si/Sino) o bucles.

## Consideraciones Clave:

* **Orden Cronológico:** El tiempo fluye de arriba hacia abajo. Lo que está arriba ocurre primero.

* **Simplicidad:** Si el diagrama se vuelve muy ancho y complejo, considera dividirlo en dos casos de uso menores.