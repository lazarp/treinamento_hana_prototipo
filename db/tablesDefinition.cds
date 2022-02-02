entity T_CLIENTES{
    key CLIENTE_ID: Integer;
        NOME: String(255);
        EMAIL: String(255);
        FONE: String(50);
        DESDE: Date;
        IDIOMA_PREFERENCIAL: String(2);
};

entity T_ENDERECOS{
    key CLIENTE_ID: Integer;
    key ENDERECO_ID: Integer;
        LOGRADOURO: String(255);
        NUMERO: Integer;
        COMPLEMENTO: String(255);
        CEP: String(9);
}

entity T_PRODUTOS {
    key PRODUTO_ID : Integer;
        VALOR      : Double;
        CUSTO      : Double;
        PESO       : Double;
};

entity T_PRODUTOS_NOMES {
    key PRODUTO_ID : Integer;
    key  IDIOMA     : String(2);
        NOME       : String(255);
};

entity T_IDIOMAS {
    key IDIOMA : String(2);
        NOME   : String(255);
};

entity T_TAXAS {
    key TIPO_PAGAMENTO : String(50);
        TAXA           : Double;
};

entity T_PEDIDOS_COMPRA {
    key PEDIDO_ID      : Integer;
    key CLIENTE_ID     : Integer;
        DATA           : Date;
        TIPO_PAGAMENTO : String(50);
        ENDERECO_ID    : Integer;
};

entity T_ITENS_COMPRA {
    key PEDIDO_ID  : Integer;
    key ITEM_ID    : Integer;
        PRODUTO_ID : Integer;
        QUANTIDADE : Integer;
};

entity T_FRETES {
    key CEP                   : String(9);
        CUSTO_FRETE_POR_QUILO : Double;
};