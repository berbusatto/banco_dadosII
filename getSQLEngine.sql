-- DESCOBRIR QUAL É A ENGINE DO BANCO DE DADOS

SELECT TABLE_NAME, ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'transaction_rollback'; 

-- OU

show table status \g;
