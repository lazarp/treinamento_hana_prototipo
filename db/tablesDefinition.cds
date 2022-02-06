entity T_CLIENTES {
    key CLIENTE_ID : Integer;
        NOME       : String(255);
        EMAIL      : String(255);
        FONE       : String(50);
        DESDE      : Date;
        ENDERECOS  : Composition of many T_ENDERECOS
                         on ENDERECOS.CLIENTE_ID = CLIENTE_ID;
};

entity T_ENDERECOS {
    key CLIENTE_ID  : Integer;
    key ENDERECO_ID : Integer;
        LOGRADOURO  : String(255);
        COMPLEMENTO : String(255);
        NUMERO      : Integer;
        CEP         : String(9);
        CLIENTE     : Association to T_CLIENTES
                          on CLIENTE.CLIENTE_ID = CLIENTE_ID;
}

entity T_PRODUTOS {
    key PRODUTO_ID     : Integer;
        DESCRICAO      : String(255);
        PRECO_UNITARIO : Double;
        CUSTO_UNITARIO : Double;
        PESO_UNITARIO  : Double;
};

entity T_PEDIDOS_COMPRA {
    key PEDIDO_ID   : Integer;
    key CLIENTE_ID  : Integer;
        DATA_PEDIDO : Date;
        ENDERECO_ID : Integer;
        ITENS       : Composition of many T_ITENS_COMPRA
                          on ITENS.PEDIDO_ID = PEDIDO_ID;
};

entity T_ITENS_COMPRA {
    key PEDIDO_ID  : Integer;
    key ITEM_ID    : Integer;
        PRODUTO_ID : Integer;
        QUANTIDADE : Integer;
        PEDIDO     : Association to T_PEDIDOS_COMPRA
                         on PEDIDO.PEDIDO_ID = PEDIDO_ID;
};

entity T_FRETES {
    key CEP                : String(9);
        FRETE_UNIDADE_PESO : Double;
};
