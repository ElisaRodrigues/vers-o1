<?php
require_once __DIR__.'/../database/Conexao.php';
require_once __DIR__.'/../models/Vendedor.php';

class CrudVendedor{

    private $conexao;

    public function __construct(){
        $this->conexao = Conexao::getConexao();
    }

    public function cadastrar(Vendedor $usuario){
        $sql = "INSERT INTO usuarios (nome, email, senha, telefone) 
                VALUES ('{$usuario->getNome()}', '{$usuario->getEmail()}', '{$usuario->getSenha()}', '{$usuario->getTelefone()}')";
        $this->conexao->exec($sql);
        $id = $this->conexao->lastInsertId(); //pega o ultimo id cadastrado

        $sq = "INSERT INTO vendedor (cpf, empresa, id_usuarios) 
               VALUES ('{$usuario->cpf}', '{$usuario->empresa}', {$id})";
        $this->conexao->exec($sq);
    }

    public function getVendedores(){
        $sql = "select * from vendedor";
        $vendedores = $this->conexao->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        return $vendedores;
    }

    public function getVendedor($id_usuario){

        $sql = "SELECT usuarios.idUsuarios, usuarios.nome,email,senha,telefone, vendedor.cpf,empresa
                  FROM vendedor INNER JOIN usuarios ON vendedor.id_usuarios = usuarios.idUsuarios
                  WHERE vendedor.id_usuarios = $id_usuario";

        $vendedor = $this->conexao->query($sql)->fetch(PDO::FETCH_ASSOC);

        print_r($vendedor);

        return new Administrador($vendedor['nome'], $vendedor['email'], $vendedor['senha'], $vendedor['telefone'], $vendedor['cpf'], $vendedor['empresa'],  $vendedor['idUsuarios']);



    }

    public function excluir($id_usuario){

        $id_vendedor = $this->conexao->query("SELECT idVendedor  FROM vendedor WHERE id_usuarios = $id_usuario")->fetch();
        $id_vendedor = $id_vendedor['idVendedor'];

        $this->conexao->exec("DELETE FROM vendedor WHERE idVendedor = $id_vendedor");
        $this->conexao->exec("DELETE FROM usuarios WHERE idUsuarios = $id_usuario");
    }

    public function  editar ($id_vendedor){

    }
}

$ven = new Vendedor("João","joao@teste.com", "123", 836827638, 8263926, "Casa Sorriso");

$crud = new CrudVendedor();

//$crud->getVendedor(1); //Okay - funcionando

//$crud->cadastrar($ven); //Okay - funcionando

//$crud->getVendedores(); //Okay - funcionando

//$crud->excluir(1); //Okay - funcionando

