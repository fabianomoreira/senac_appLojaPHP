<?php
    if(!isset($_SESSION)){
        session_start();
    }

    $imagem = 'imagens\carrinho-0.png';

    if(isset($_SESSION['carrinho'])){
        if(count($_SESSION['carrinho']) > 0){
            $imagem = 'imagens\carrinho-1.png';
        } else {
            $imagem = 'imagens\carrinho-0.png';
        }
    }    

?>
<header>
    <div class="container">
        <a href="?pagina=home"><img src="imagens/logo.png" title="Logo" alt="Logo"></a>
        <div id="menu">
            <?php if(isset($_SESSION['tipo'])){ ?>
                <?php if($_SESSION['tipo'] == '1'){ ?>
                    <a href="index.php?pagina=produtos">Produtos</a>
                    <a href="index.php?pagina=tipos_usuario">Tipos</a>
                    <a href="index.php?pagina=usuarios">Usuários</a>
                <?php } ?>
            <?php } ?>

            <?php if(isset($_SESSION['nome'])){ ?>
                <a href="scripts/processar_logout.php">Logout</a>
            <?php } else { ?>
                <a href="index.php?pagina=login">Login</a>
            <?php } ?>

            <a href="?pagina=carrinho"><img src="<?=$imagem?>" width=35px></a>
        </div>
    </div>
</header>