# Diagrama Estructural (Basado en Capas / C4 Model)

## Definición
 Representa la organización estática del sistema. No muestra el tiempo ni el movimiento, sino cómo están agrupadas las responsabilidades y quién depende de quién.

## Representación de Artefactos:

* **Cajas Grandes (Subgrafos/Contenedores):** Representan las Capas (Presentación, Dominio, Datos). Actúan como fronteras lógicas.

* **Cajas Pequeñas:** Representan los Componentes o clases (ej. GameViewModel, StorageService).

* **Flechas Continuas:** Representan una Dependencia de Código. Si la flecha va de A hacia B, significa que "A conoce a B" o "A necesita de B para compilar".

* **Líneas Punteadas:** Suelen representar Flujo de Datos o suscripciones (como el watch de Provider), donde no hay una dependencia de instanciación directa pero sí de información.

## Consideraciones Clave:

* **Regla de Dependencia:** En arquitecturas limpias, las flechas siempre deben ir hacia "adentro" (hacia el Dominio). La lógica de negocio no debe conocer los detalles de la interfaz ni de la base de datos.

* **Nivel de Abstracción:** No intentes poner todas las clases del proyecto. Enfócate en las que definen la estructura.