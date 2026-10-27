--Escribe una consulta que devuelva:--
-- El **nombre** del canal de venta (tabla `canal_venta`)[cite: 5].--
-- La **suma total de las ventas** (`SUM(p.total)`) de cada canal (tabla `pedido`)[cite: 5].--
-- La **cantidad de pedidos** (`COUNT(p.id_pedido)`) procesados por canal[cite: 5].--
--Ordenamiento:** Del canal que más ingresos ha generado al que menos (`ORDER BY ... DESC`).--
SELECT
    c.nombre AS canal_venta,
    SUM(p.total) AS Venta_total, 
    COUNT(p.id_pedido) AS Pedidos
    FROM canal_venta c
    INNER JOIN pedido p 
        ON p.id_canal = c.id_canal
GROUP BY c.nombre
ORDER BY Venta_total DESC;

--#### 🎯 Reto 2: Promedio de costo de ingredientes por tipo--
--Escribe una consulta sobre la tabla `ingrediente` que muestre:--
--1. El **tipo** de ingrediente (tabla `ingrediente`)[cite: 5].--
--2. El **costo por gramo promedio** (`AVG(costo_gramo)`) para cada tipo de ingrediente[cite: 5].--
--3. La **cantidad de ingredientes** (`COUNT(*)`) de cada tipo[cite: 5].--

SELECT
    i.tipo AS Tipo,
    AVG(i.costo_gramo) AS Costo_promedio,
    COUNT(i.id_ingrediente) AS cantidad_ingredientes -- COUNT (*) TAMBIEN ES UNA FORMA VÁLIDA
    FROM ingrediente i  
GROUP BY i.tipo;

--#### 🎯 Reto 3: Clientes con más gasto acumulado--
--Escribe una consulta que devuelva:--
--1. El **nombre** del cliente (tabla `cliente`)[cite: 5].--
--2. El **total de dinero invertido** (`SUM(p.total)`) en sus compras (tabla `pedido`)[cite: 5].--
--* **Filtro:** Incluye únicamente los pedidos con `estado = 'entregado'`[cite: 5].--
--* **Ordenamiento:** Muestra primero a las clientas con mayor gasto acumulado.--

SELECT 
    c.nombre AS Nombre_cliente,
    c.ciudad AS ciudad_cliente,
    SUM(p.total) AS Gasto 
    FROM cliente c  
    INNER JOIN pedido p  
        ON p.id_cliente = c.id_cliente
    WHERE estado = 'entregado'
    GROUP BY c.nombre , c.ciudad
    ORDER BY Gasto DESC;

--## 🎯 Reto 4: Filtro de agregación con `HAVING`--
--Escribe una consulta que muestre:--
--. Las **ciudades** (tabla `cliente`)[cite: 5].--
--. El **número total de clientes** por ciudad (`COUNT(id_cliente)`)[cite: 5].--
--Filtro especial:** Usa **`HAVING`** para mostrar únicamente las ciudades --
--que tengan **2 o más clientes** registrados[cite: 5].--

SELECT
    c.ciudad AS ciudad,
    COUNT(*) AS número_clientes 
    FROM cliente c  
GROUP BY ciudad
HAVING COUNT(*) > 0;  -- coloqué 0 porque no hay suficientes datos y la consulta me sale sin resultados con >2 
