with
    fonte_colaboradores as (
        select * 
        from {{ source('erp', 'colaboradores') }}
    )

    , renomeado as (
        select
            cod_colaborador as pk_colaborador
            , cod_localidade as fk_localidade
            , cod_gerente
            , primeiro_nome || ' ' || ultimo_nome as nome_colaborador
            , email as email_colaborador
            , cpf as cpf_colaborador
            , cast(data_nascimento as date) as data_nascimento
            , endereco as endereco_colaborador
            , cep as cep_colaborador
        from fonte_colaboradores
    )

select * from renomeado