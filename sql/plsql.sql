CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    p_nome_projeto IN VARCHAR2,
    p_responsavel IN VARCHAR2
) IS
BEGIN
    INSERT INTO brh.projeto (id_projeto, nome_projeto, responsavel)
    VALUES (brh.seq_projeto.NEXTVAL, p_nome_projeto, p_responsavel);

    -- Não faça commit aqui. A transação deve ser gerenciada por quem chama a procedure.
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;


-- Criar função calcula_idade
CREATE OR REPLACE FUNCTION brh.calcula_idade (
    p_data_nascimento IN DATE
) RETURN NUMBER IS
    v_idade NUMBER;
BEGIN
    -- Calculate the age in years using MONTHS_BETWEEN
    v_idade := FLOOR(MONTHS_BETWEEN(SYSDATE, p_data_nascimento) / 12);
    RETURN v_idade;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/
