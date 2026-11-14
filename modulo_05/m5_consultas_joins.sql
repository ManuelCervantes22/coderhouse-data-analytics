
USE Ventas_Tech_DB;
GO

-- ==========================================================
-- CONSULTA 1: VISTA BASE DEL PROYECTO (INNER JOIN)
-- Proposito: integrar ventas, clientes, productos y categorias
-- para obtener una vista enriquecida del negocio.
-- ==========================================================

SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad AS ciudad_cliente,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria_producto,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta, v.id_venta;

-- Hallazgo: Las 10 ventas registradas en marzo de 2024
-- generaron $6,444.00. La categoria Computacion
-- concentra $4,950.00 de la facturacion total.


-- ==========================================================
-- CONSULTA 2: CLIENTES SIN VENTAS (LEFT JOIN)
-- Proposito: identificar clientes sin compras para que
-- el area de CRM pueda realizar acciones de seguimiento.
-- ==========================================================

SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.fecha_registro;


-- Hallazgo: Se encontraron 0 clientes sin ventas.
-- Los 5 clientes registrados realizaron al menos una compra,
-- por lo que CRM no tiene clientes pendientes de su primera compra.

-- ==========================================================
-- CONSULTA 3: PRODUCTOS SIN VENTAS (LEFT JOIN)
-- Proposito: identificar productos sin movimiento comercial.
-- ==========================================================

SELECT
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
LEFT JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL
ORDER BY p.nombre_producto;

-- Hallazgo: Se encontraron 0 productos sin ventas.
-- Los 6 productos del catalogo registraron al menos una venta,
-- por lo que el area de producto no identifica articulos
-- sin movimiento en el periodo analizado.


-- ==========================================================
-- CONSULTA 4: CONSOLIDADO POR PERIODO (UNION ALL)
-- Proposito: comparar la facturacion de dos periodos
-- de marzo de 2024 utilizando UNION ALL.
-- ==========================================================

SELECT
    origen,
    SUM(total) AS total_origen
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Primera quincena' AS origen
    FROM ventas
    WHERE fecha_venta >= '2024-03-01'
      AND fecha_venta < '2024-03-16'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Segunda quincena' AS origen
    FROM ventas
    WHERE fecha_venta >= '2024-03-16'
      AND fecha_venta < '2024-04-01'
) AS consolidado
GROUP BY origen
ORDER BY origen;

-- Hallazgo: La primera quincena de marzo de 2024
-- concentro los 10 pedidos y $6,444.00 de facturacion.
-- La segunda quincena no registro ventas en los datos.
