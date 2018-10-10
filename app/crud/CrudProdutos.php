<?php
    require_once '../database/Conexao.php';
    require_once '../models/Produto.php';

    class CrudProdutos{
        
        private $conexao;
        public $produto;
        
        public function __construct(){
            $this->conexao = Conexao::getConexao();
        }

        public function cadastrar(Produto $produto){
            $sql = "INSERT INTO produtos (nome, preco, referencia, estoque, estoque_min, descricao,  idTipoProduto) 
                    VALUES ('{$produto->nome}', '{$produto->preco}', {$produto->referencia}, {$produto->estoque}, {$produto->estoqueMin}, 
                    '{$produto->descricao}', {$produto->tipoProduto})";
            $this->conexao->exec($sql);
            $id = $this->conexao->lastInsertId();

            //imagem
           $sqlImg = "INSERT INTO  imagem (imagem) values ('$produto->imagem')";
           $this->conexao->exec($sqlImg);
           $idImagem = $this->conexao->lastInsertId();

            //cor
            $sqlCor = "INSERT INTO  cor (cor) values ('$produto->cor')";
            $this->conexao->exec($sqlCor);
            $idCor = $this->conexao->lastInsertId();

            //tamanho
            $sqlTamanho = "INSERT INTO  tamanho (tamanho) values ('$produto->tamanho')";
            $this->conexao->exec($sqlTamanho);
            $idTamanho = $this->conexao->lastInsertId();


            //prod_tamanho
            $pt = "insert into prod_tamanho (tam_id_tam, prod_id_prod) values ({$produto->tamanho}, {$id})";
            @$this->conexao->exec($pt);

            //prod_imagem
             $pi = "insert into prod_imagem (img_id_img, prod_id_prod) values ({$idImagem}, {$id})";
             @$this->conexao->exec($pi);

            //prod_cor
            $pc = "insert into prod_cor (cor_id_cor, prod_id_prod) values ({$idCor}, {$id})";
            @$this->conexao->exec($pc);
        }

        public function getTiposProduto(){
            $res = $this->conexao->query("select * from tipo_produto order by tipo");
            $tipos = $res->fetchAll(PDO::FETCH_ASSOC);
            return $tipos;
        }

        public function getTamanhos(){
            $res = $this->conexao->query("select * from tamanho order by tamanho");
            $tamanhos = $res->fetchAll(PDO::FETCH_ASSOC);
            return $tamanhos;
        }

        public function getCores(){
            $res = $this->conexao->query("select * from cor order by cor");
            $cores = $res->fetchAll(PDO::FETCH_ASSOC);
            return $cores;
        }

        public function getProdutos(){
            $consulta = $this->conexao->query("SELECT * FROM produtos");
            $arrayProdutos = $consulta->fetchAll(PDO::FETCH_ASSOC);

            //print_r($arrayProdutos);

            return $arrayProdutos;
        }

        public function getImagens(){
            $consulta = $this->conexao->query("SELECT * FROM imagem");
            $imagens = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $imagens;
        }

        public function getProduto($id){
            $consulta = $this->conexao->query("SELECT * FROM produtos WHERE idProdutos = {$id}");
            $produto = $consulta->fetch(PDO::FETCH_ASSOC);

            //imagem
            $sql_img = "SELECT img_id_img FROM prod_imagem where prod_id_prod = {$produto['idProdutos']}";
            $id_img = $this->conexao->query($sql_img)->fetch();
            $imagem1 = "SELECT imagem FROM imagem where imagem = {$id_img['img_id_img']}";
            $imagem = $this->conexao->query($imagem1)->fetch();

            //cor
            $sql_cor = "SELECT cor_id_cor FROM prod_cor where prod_id_prod = {$produto['idProdutos']}";
            $id_cor = $this->conexao->query($sql_cor)->fetch();
            $cor1 = "SELECT cor FROM cor where cor = {$id_cor['cor_id_cor']}";
            $cor = $this->conexao->query($cor1)->fetch();

            //tamanho
            $sql_tam = "SELECT tam_id_tam FROM prod_tamanho where prod_id_prod = {$produto['idProdutos']}";
            $id_tam = $this->conexao->query($sql_tam)->fetch();
            $tamanho = "SELECT tamanho FROM tamanho where tamanho = {$id_tam['tam_id_tam']}";

            //print_r($produto);
            //die;

            return new Produto($produto['nome'], $produto['preco'], $produto['referencia'], $produto['estoque'], $produto['estoque_min'],
                               $produto['descricao'],$tamanho, $cor, $produto['idTipoProduto'], $imagem, $produto['idProdutos'] );
        }

        //UPDATE `produtos` SET `nome` = 'new produtinho', `preco` = '364923', `estoque` = '893649238', `estoque_min` = '837401273',
        // `descricao` = 'nacçlanc', `referencia` = '5' WHERE `produtos`.`idProdutos` = 5

        public function editar($id, Produto $produto){
            $this->conexao->exec("UPDATE Produtos SET '{$produto->nome}'                                                             
                                                                 {$produto->preco},
                                                                 {$produto->referencia},
                                                                 {$produto->estoque},
                                                                 {$produto->estoqueMin}, 
                                                                '{$produto->descricao}', 
                                                                '{$produto->tamanho}', 
                                                                '{$produto->cor}',
                                                                 {$produto->idTipoProduto}
                                                                 {$produto->imagem},
                                                                 {$produto->id}
            WHERE id_produto = {$id}");
        }
    }

//$prod = new Produto("teste domingo", 200, 344, 100, "bla", "","vermelha", "casaco","", "","" );

//$crud = new CrudProdutos();

//$crud->cadastrar($prod); //Errooooooooo

//$crud->getProduto(28); //Quase Okay   Undefined index: tamanho; cor; imagem; id_produto;

//$crud->getProdutos();  //Quase Okay - nao vem tamanho; cor; imagem;