REPORT z_process_table_z.

* Declaração da estrutura da tabela Z
TYPES: BEGIN OF ty_ztable,
         exercicio    TYPE n LENGTH 4, " Ano
         periodo      TYPE n LENGTH 2, " Mês
         belnr        TYPE n LENGTH 10, " Número do documento (BELNR)
         bldat        TYPE d,           " Data de lançamento (BLDAT)
         valor        TYPE p LENGTH 10 DECIMALS 2, " Valor
       END OF ty_ztable.

* Declaração da tabela interna
DATA: lt_ztable TYPE TABLE OF ty_ztable,
      ls_ztable TYPE ty_ztable.

* Simulação de dados (ou você pode fazer um SELECT na tabela real)
lt_ztable = VALUE #( 
    ( exercicio = '2024' periodo = '09' belnr = '1000000001' bldat = '20240901' valor = '1500.00' )
    ( exercicio = '2024' periodo = '08' belnr = '1000000002' bldat = '20240815' valor = '2000.00' )
    ( exercicio = '2023' periodo = '07' belnr = '1000000003' bldat = '20230710' valor = '1750.50' )
).

* Loop para processar cada registro da tabela Z
LOOP AT lt_ztable INTO ls_ztable.
  WRITE: / 'Exercício:', ls_ztable-exercicio,
         'Período:', ls_ztable-periodo,
         'Número Doc:', ls_ztable-belnr,
         'Data Lançamento:', ls_ztable-bldat,
         'Valor:', ls_ztable-valor.
ENDLOOP.
