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
