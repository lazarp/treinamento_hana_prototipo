using {T_CLIENTES, T_ENDERECOS, T_PRODUTOS} from '../db/tablesDefinition';
using {CV_CALCULO_ITENS, CV_CALCULO_PEDIDOS} from '../db/tablesDefinition';

service CatalogService @(path : '/catalog'){
    entity Clientes as projection on T_CLIENTES;
    entity Enderecos as projection on T_ENDERECOS;
    entity Produtos as projection on T_PRODUTOS;
    @readonly entity calculo_itens as projection on CV_CALCULO_ITENS;
    @readonly entity calculo_pedidos as projection on CV_CALCULO_PEDIDOS;
}