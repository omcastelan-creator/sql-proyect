SELECT 
    c.nombre AS Nombre_cliente,
    p.fecha  AS Fecha_pedido,
    p.total  AS Total_pedido 
FROM cliente c   
INNER JOIN pedido p ON p.id_cliente = c.id_cliente
WHERE p.estado = 'entregado';

SELECT
    p.nombre AS Nombre_producto, 
    p.precio AS Precio_producto,
    p.costo AS Costo_producto,
    p.precio - p.costo AS Margen
FROM producto p
WHERE linea = 'capilar'
ORDER BY Margen ASC

SELECT
    p.fecha AS Fecha_pedido,
    p.total AS Totatal_pedido,
    c.nombre AS Canal_Ventas
    FROM canal_venta c 
    INNER JOIN pedido p ON c.id_canal = p.id_canal
    WHERE fecha BETWEEN '2026-05-01' AND '2026-05-31'


--Escribe una consulta combinando las tablas pedido, pedido_producto y producto que devuelva:
--El id_pedido.
--La fecha del pedido (tabla pedido).
--El nombre del producto (tabla producto).
--La cantidad de unidades compradas de ese producto (tabla pedido_producto).
--Filtro: Muestra únicamente las filas de los pedidos cuyo estado sea 'enviado'.--

SELECT
    p.id_pedido AS ID,
    p.fecha AS Fecha,
    pr.Nombre AS Nombre_producto,
    pp.cantidad AS unidades
    FROM pedido p
    INNER JOIN pedido_producto pp
        ON p.id_pedido = pp.id_pedido
    INNER JOIN producto pr  
        ON pp.id_producto = pr.id_producto
    WHERE p.estado = 'enviado';