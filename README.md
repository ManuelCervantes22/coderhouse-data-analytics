
# RetailPro | Proyecto de Data Analytics

## Descripción del proyecto

RetailPro es un proyecto desarrollado durante el curso de Data Analytics de Coderhouse.

Su objetivo es transformar datos de ventas, clientes, productos y categorías en información útil para la toma de decisiones comerciales.

## Herramientas utilizadas

- SQL Server y SQL Server Management Studio
- SQL: consultas, agregaciones, JOIN y análisis comercial
- Power BI: modelado de datos y visualización
- Power Query: limpieza y transformación de datos
- DAX: creación de indicadores y medidas
- GitHub: control de versiones y documentación

## Estructura del repositorio

### Módulo 3 — Base de datos
Carpeta: `modulo_03/`

Contiene los archivos de creación y preparación de la base de datos del proyecto.

### Módulo 4 — Consultas de negocio
Archivo: `modulo_04/m4_consultas_negocio.sql`

Incluye consultas para:
- Calcular la facturación mensual y el ticket promedio.
- Identificar los cinco productos con mayor facturación.
- Analizar clientes recurrentes.
- Comparar la facturación de productos con el promedio.

### Módulo 5 — Consultas con JOIN
Archivo: `modulo_05/m5_consultas_joins.sql`

Integra información de ventas, clientes, productos y categorías mediante relaciones SQL.

## Cómo ejecutar los scripts

1. Abrir SQL Server Management Studio.
2. Conectarse a SQL Server.
3. Ejecutar los scripts del Módulo 3 para preparar la base de datos.
4. Seleccionar la base de datos `Ventas_Tech_DB`.
5. Abrir y ejecutar `m4_consultas_negocio.sql`.
6. Abrir y ejecutar `m5_consultas_joins.sql`.
7. Revisar los resultados obtenidos.

Los scripts deben ejecutarse en el orden correspondiente, ya que las consultas dependen de las tablas creadas previamente.

## Resultados del análisis

En marzo de 2024, RetailPro registró:

- Facturación total: $6,444.00
- Cantidad de pedidos: 10
- Ticket promedio: $644.40
- Producto ID 1: $3,600.00 facturados
- Producto ID 3: $1,350.00 facturados

Los productos 1 y 3 concentraron el 76.82% de la facturación.

Estos indicadores corresponden únicamente al período analizado y no permiten establecer tendencias históricas ni determinar rentabilidad sin información adicional de costos.

## Modelado y análisis en Power BI

El proyecto también incluye un modelo analítico con una tabla de ventas y dimensiones de clientes, productos, categorías y fechas.

Se desarrollaron medidas DAX para calcular:
- Total Ventas
- Ventas Online
- Ventas YTD
- Ventas LY
- Porcentaje de Crecimiento Anual

## Validación y buenas prácticas

Las consultas y los indicadores deben validarse contra los datos originales.

El uso de inteligencia artificial como apoyo técnico no sustituye la revisión de resultados ni la responsabilidad del analista.

## Autor

Manuel Cervantes  
Curso de Data Analytics — Coderhouse
