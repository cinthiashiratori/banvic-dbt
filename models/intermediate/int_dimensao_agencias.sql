with 
    agencias as (
        select * from {{ ref('stg_erp__agencias') }}
    )
    , localidades as (
        select * from {{ ref('stg_erp__localidades') }}
    )
    , agencias_enriquecida as (
        select
            agencias.pk_agencia
            , agencias.nome_agencia
            , agencias.tipo_agencia
            , agencias.data_abertura_agencia
            , agencias.endereco_agencia
            , localidades.cidade as cidade_agencia
            , localidades.uf as uf_agencia
        from agencias
        left join localidades on agencias.fk_localidade = localidades.pk_localidade
    )

select * from agencias_enriquecida