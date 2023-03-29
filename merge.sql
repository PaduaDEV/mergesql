SELECT 
    b.nome AS banco,
    c.verba,
    MIN(co.data_inclusao) AS data_inclusao_mais_antiga,
    MAX(co.data_inclusao) AS data_inclusao_mais_nova,
    SUM(co.valor) AS soma_valor_contratos
FROM 
    Tb_contrato co
    INNER JOIN Tb_convenio_servico cs ON co.convenio_servico = cs.codigo
    INNER JOIN Tb_convenio c ON cs.convenio = c.codigo
    INNER JOIN Tb_banco b ON c.banco = b.codigo
GROUP BY 
    b.nome, c.verba
