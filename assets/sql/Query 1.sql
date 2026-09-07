USE final_prueba_importacion;
Select pedido.Nro_remision, cliente.Nom_cliente, productos.Nom_producto, productos_pedido.Cantidad
FROM pedido
JOIN cliente
ON pedido.Idcliente = cliente.idCLIENTE
JOIN productos_pedido
ON pedido.Nro_remision = productos_pedido.Nro_remision
JOIN productos
ON productos_pedido.Id_producto = productos.Id_producto
ORDER BY pedido.Nro_remision, productos.Nom_producto;