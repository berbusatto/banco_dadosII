echo 'Criando arquivo importante'
cp -r /home/www/ensino/administracao_banco_de_dados/sample/ /home/www/ensino/administracao_banco_de_dados/db/db

echo 'buildando imagem conforme dockerfile'
docker build -t classdb .;


echo 'start do processo'
docker run -p 3305:3306 -v /home/www/ensino/administracao_banco_de_dados/db/db:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=root classdb;