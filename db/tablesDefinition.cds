
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

@cds.persistence.exists
@cds.persistence.calcview
entity![CV_CALCULO_ITENS]{
    key![PEDIDO_ID]      : Integer    @title : 'PEDIDO_ID: PEDIDO_ID';
    key![ITEM_ID]        : Integer    @title : 'ITEM_ID: ITEM_ID';
       ![PRODUTO_ID]     : Integer    @title : 'PRODUTO_ID: PRODUTO_ID';
       ![DESCRICAO]      : String(255)@title : 'DESCRICAO: DESCRICAO';
       ![QUANTIDADE]     : Integer    @title : 'QUANTIDADE: QUANTIDADE';
       ![PRECO_UNITARIO] : Double     @title : 'PRECO_UNITARIO: PRECO_UNITARIO';
       ![CUSTO_UNITARIO] : Double     @title : 'CUSTO_UNITARIO: CUSTO_UNITARIO';
       ![PESO_UNITARIO]  : Double     @title : 'PESO_UNITARIO: PESO_UNITARIO';
       ![PESO_ITEM]      : Double     @title : 'PESO_ITEM: PESO_ITEM';
       ![PRECO_ITEM]     : Double     @title : 'PRECO_ITEM: PRECO_ITEM';
       ![CUSTO_ITEM]     : Double     @title : 'CUSTO_ITEM: CUSTO_ITEM';
}

@cds.persistence.exists
@cds.persistence.calcview
entity![CV_CALCULO_PEDIDOS]{
    key![PEDIDO_ID]               : Integer    @title : 'PEDIDO_ID: PEDIDO_ID';
    key![CLIENTE_ID]              : Integer    @title : 'CLIENTE_ID: CLIENTE_ID';
       ![DATA_PEDIDO]             : Date       @title : 'DATA_PEDIDO: DATA_PEDIDO';
       ![ENDERECO_ID]             : Integer    @title : 'ENDERECO_ID: ENDERECO_ID';
       ![LOGRADOURO]              : String(255)@title : 'LOGRADOURO: LOGRADOURO';
       ![COMPLEMENTO]             : String(255)@title : 'COMPLEMENTO: COMPLEMENTO';
       ![NUMERO]                  : Integer    @title : 'NUMERO: NUMERO';
       ![CEP]                     : String(9)  @title : 'CEP: CEP';
       ![FRETE_UNIDADE_PESO]      : Double     @title : 'FRETE_UNIDADE_PESO: FRETE_UNIDADE_PESO';
       ![QUANTIDADE_PEDIDO]       : Integer    @title : 'QUANTIDADE_PEDIDO: QUANTIDADE_PEDIDO';
       ![PESO_PEDIDO]             : Double     @title : 'PESO_PEDIDO: PESO_PEDIDO';
       ![SUBTOTAL_PEDIDO]         : Double     @title : 'SUBTOTAL_PEDIDO: PRECO_PEDIDO';
       ![CUSTO_PEDIDO]            : Double     @title : 'CUSTO_PEDIDO: CUSTO_PEDIDO';
       ![PRECO_FRETE]             : Double     @title : 'PRECO_FRETE: PRECO_FRETE';
       ![VALOR_FINAL_PEDIDO]      : Double     @title : 'VALOR_FINAL_PEDIDO: VALOR_FINAL_PEDIDO';
       ![LUCRO_PEDIDO]            : Double     @title : 'LUCRO_PEDIDO: LUCRO_PEDIDO';
       ![LUCRO_PEDIDO_PERCENTUAL] : Double     @title : 'LUCRO_PEDIDO_PERCENTUAL: LUCRO_PEDIDO_PERCENTUAL';
}