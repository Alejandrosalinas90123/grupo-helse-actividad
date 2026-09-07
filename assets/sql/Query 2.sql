USE final;
SELECT productos_pedido.Nro_remision, productos.Nom_producto, productos_pedido.Cantidad AS Cantidad_solicitada, 
productos.Inventario AS Inventario_actual,
    CASE
        WHEN productos.Inventario >= productos_pedido.Cantidad
        THEN 'Inventario suficiente'
        ELSE 'Inventario insuficiente'
    END AS Estado_inventario
FROM productos_pedido
JOIN productos
ON productos_pedido.Id_producto = productos.Id_producto
ORDER BY productos_pedido.Nro_remision, productos.Nom_producto;