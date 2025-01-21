<?php
$host = 'localhost'; 
$usuario = 'root'; 
$senha = ''; 
$banco = 'ecommerce'; 

$conexao = new mysqli($host, $usuario, $senha, $banco);

if ($conexao->connect_error) {
    die("Conexão falhou: " . $conexao->connect_error);
}
?>
