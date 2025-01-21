<?php
// Incluir a conexão com o banco de dados
include 'conexao.php';

// Verificar se o ID foi passado na URL
if (isset($_GET['id'])) {
    $produto_id = $_GET['id'];

    // Consultar o produto no banco de dados
    $sql = "SELECT * FROM produtos WHERE produto_id = $produto_id";
    $resultado = mysqli_query($conexao, $sql);

    if ($resultado) {
        $produto = mysqli_fetch_assoc($resultado);
    } else {
        echo "Produto não encontrado!";
        exit;
    }
} else {
    echo "Produto não especificado!";
    exit;
}

// Função para calcular o frete via API dos Correios
function calcularFrete($cep_destino, $peso) {
    $cep_origem = "01001000"; // CEP de origem (exemplo, você pode definir de acordo com sua loja)
    
    // Montar a URL da API dos Correios para cotação de frete
    $url = "https://api.linkcorreios.com.br/calcularfrete/v1/?cepDestino={$cep_destino}&cepOrigem={$cep_origem}&peso={$peso}&formato=xml&servico=04014";

    // Fazer a requisição à API
    $response = file_get_contents($url);
    
    if ($response) {
        // Converter o XML para array
        $frete_data = simplexml_load_string($response);
        return (float) $frete_data->Valor;
    } else {
        return false;
    }
}

// Verificar se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $peso = $produto['peso']; // Pega o peso do produto
    $nome_cliente = $_POST['nome_cliente'];
    $endereco = $_POST['endereco'];
    $email = $_POST['email'];
    $quantidade = $_POST['quantidade'];
    $cep_destino = $_POST['cep'];
    $cep_origem = $produto['cep_origem'];

    // Calcular o frete com a função
    $frete = calcularFrete($cep_destino, $produto['peso']);
    
    if ($frete !== false) {
        $total_com_frete = ($produto['preco'] * $quantidade) + $frete;
        echo "<p><strong>Valor do Frete:</strong> R$ " . number_format($frete, 2, ',', '.') . "</p>";
        echo "<p><strong>Total com Frete:</strong> R$ " . number_format($total_com_frete, 2, ',', '.') . "</p>";

        // Aqui você pode continuar com o processamento do pedido (ex: salvar no banco)
    } else {
        echo "<p>Erro ao calcular o frete. Tente novamente mais tarde.</p>";
    }
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - <?= htmlspecialchars($produto['nome']); ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Checkout do Produto: <?= htmlspecialchars($produto['nome']); ?></h1>
        <div class="row">
            <div class="col-md-6">
                <img src="<?= htmlspecialchars($produto['imagem_url']); ?>" alt="<?= htmlspecialchars($produto['nome']); ?>" class="img-fluid">
            </div>
            <div class="col-md-6">
                <h3>Detalhes do Produto</h3>
                <p><strong>Descrição:</strong> <?= htmlspecialchars($produto['descricao']); ?></p>
                <p><strong>Preço:</strong> R$ <?= number_format($produto['preco'], 2, ',', '.'); ?></p>
            </div>
        </div>

        <h2 class="mt-5">Informações de Compra</h2>
        <form action="comprar.php?id=<?= $produto['produto_id']; ?>" method="POST">
            <div class="mb-3">
                <label for="nome_cliente" class="form-label">Nome Completo</label>
                <input type="text" class="form-control" id="nome_cliente" name="nome_cliente" required>
            </div>
            <div class="mb-3">
                <label for="endereco" class="form-label">Endereço de Entrega</label>
                <input type="text" class="form-control" id="endereco" name="endereco" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">E-mail</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="cep" class="form-label">CEP</label>
                <input type="text" class="form-control" id="cep" name="cep" required>
            </div>
            <div class="mb-3">
                <label for="quantidade" class="form-label">Quantidade</label>
                <input type="number" class="form-control" id="quantidade" name="quantidade" value="1" min="1" required>
            </div>
            <button type="submit" class="btn btn-primary">Finalizar Compra</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
