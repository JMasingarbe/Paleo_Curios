<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./asset/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./style/css/main.css">
    <title>Paléo Curios - Articles</title>
</head>

<body>
    <!-- Header -->
    <?php include 'component/header.php'?>

    <!-- Main -->
    <main>
        <!-- Last published article -->
        <div>
            <div>
                <h1>Titre de l'article</h1>
                <p>Auteur.ice</p>
            </div>
            <img src="https://placehold.co/400" alt="Photo illustrant l'article">
            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, quaerat. Rerum non quo earum consequatur consectetur nemo repellendus quaerat, doloribus quis sapiente soluta, ad voluptas reiciendis repellat veritatis! Impedit, eaque.</p>
            <a href="article.php" class="link_button">Lire la suite</a>
        </div>

        <div class="divider"></div>

        <!-- Next 6 articles -->
        <a href="article.php">
            <article class="large_card">
                <h2>Titre de l'article</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores accusantium sed saepe repellat laborum temporibus aperiam repellendus cupiditate, officiis consequatur autem, voluptas quae ratione eaque dolor quod fuga amet. Reprehenderit.</p>
            </article>
        </a>
        <a href="article.php">
            <article class="large_card">
                <h2>Titre de l'article</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis quis officiis nisi dolorum placeat aliquam exercitationem, quibusdam cum obcaecati libero illum error similique excepturi cupiditate, ut quam accusantium. In, ad.</p>
            </article>
        </a>
        <a href="article.php">
            <article class="large_card">
                <h2>Titre de l'article</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis quis officiis nisi dolorum placeat aliquam exercitationem, quibusdam cum obcaecati libero illum error similique excepturi cupiditate, ut quam accusantium. In, ad.</p>
            </article>
        </a>
        <a href="article.php">
            <article class="large_card">
                <h2>Titre de l'article</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis quis officiis nisi dolorum placeat aliquam exercitationem, quibusdam cum obcaecati libero illum error similique excepturi cupiditate, ut quam accusantium. In, ad.</p>
            </article>
        </a>
        <a href="article.php">
            <article class="large_card">
                <h2>Titre de l'article</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis quis officiis nisi dolorum placeat aliquam exercitationem, quibusdam cum obcaecati libero illum error similique excepturi cupiditate, ut quam accusantium. In, ad.</p>
            </article>
        </a>
        <a href="article.php">
            <article class="large_card">
                <h2>Titre de l'article</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis quis officiis nisi dolorum placeat aliquam exercitationem, quibusdam cum obcaecati libero illum error similique excepturi cupiditate, ut quam accusantium. In, ad.</p>
            </article>
        </a>

        <!-- Page nav -->
        <div class="catalogue_nav">
            <button type="button"><-</button>
            <button type="button">1</button>
            <button type="button">2</button>
            <button type="button">3</button>
            <span>...</span>
            <button type="button">-></button>
        </div>
    </main>

    <!-- Footer -->
    <?php include 'component/footer.php' ?>

    <!-- Scripts -->
    <script src="./script/main.js"></script>
</body>
</html>