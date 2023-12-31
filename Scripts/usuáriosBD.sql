-- criando usuários no banco:

CREATE USER 'nomeUsuario' PASSWORD 'senhaUsuario';

-- dando todas as permissões do banco a um usuário:

GRANT ALL PRIVILEGES ON DATABASE "nomeBancoDados" TO nomeUsuario;

-- dando privilégios de uso de um schema a um usuário:

GRANT USAGE ON SCHEMA nomeSchema TO nomeUsuario;

-- dando todos os privilégios de todas as tabelas a um usuário:

DO $$ 
DECLARE 
    tabela_nome text;
BEGIN 
    FOR tabela_nome IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') 
    LOOP
        EXECUTE 'GRANT ALL PRIVILEGES ON TABLE ' || tabela_nome || ' TO nomeUsuario';
    END LOOP;
END
$$;

-- mudando a senha de um usuário

ALTER USER nomeUsuario WITH PASSWORD 'novaSenha';

-- removendo todos os privilégios de todas as tabelas de um usuário:

DO $$ 
DECLARE 
    tabela_nome text;
BEGIN 
    FOR tabela_nome IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') 
    LOOP
        EXECUTE 'REVOKE ALL PRIVILEGES ON TABLE ' || tabela_nome || ' FROM nomeUsuario';
    END LOOP;
END
$$;

-- removendo privilégios de um usuário:

REVOKE ALL PRIVILEGES ON DATABASE "nomeBancoDados" FROM nomeUsuario;

-- removendo um usuário:

DROP ROLE nomeUsuario;

-- conferindo quais privilégios o usuário tem em cada tabela:
SELECT grantee, table_name, privilege_type FROM information_schema.role_table_grants WHERE grantee = 'nomeUsuario';

/*
daqui pra baixo, comandos a serem passados no terminal psql:

listando todos os bancos de dados no servidor:

\l

listando todos os usuários e seus privilégios em um banco de dados:

\du
*/