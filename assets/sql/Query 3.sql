USE final;
SELECT pedido.Nro_remision, pedido.Valor_remision, SUM(envio.Costo_envio) AS Costo_total_envios,
    ROUND(
        (SUM(envio.Costo_envio) / pedido.Valor_remision) * 100, 2) AS Porcentaje_envio
FROM pedido
JOIN envio ON pedido.Nro_remision = envio.Nro_remision
GROUP BY
    pedido.Nro_remision,
    pedido.Valor_remision
ORDER BY Porcentaje_envio DESC;