<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./asset/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./style/css/main.css">
    <link rel="stylesheet" href="./style/css/home.css">
    <title><?= $title ?? "" ?></title>
</head>

<body>
    <!-- Header -->
    <?php include 'component/header.php'?>

    <!-- Main -->
    <main>
        <!-- Last published article -->
        <section id="last_article" aria-label="Dernier article publié">
            <h2>Titre de l'article</h2>
            <p id="article_author">Auteur.ice</p>
            <img src="https://placehold.co/400" alt="Photo de l'article">
            <p>Introduction.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente odit harum similique corporis commodi ad aliquam nulla fugiat nemo atque veniam esse saepe, vitae enim deleniti, dolores iste explicabo praesentium maxime? Nobis aliquid facere autem quam, asperiores aliquam cupiditate eligendi suscipit accusamus debitis fugit, consequatur voluptatem, quidem cumque qui iure sit velit itaque adipisci quisquam magnam architecto magni alias. Iusto, assumenda. Aliquam deserunt autem earum ad nobis natus eligendi laudantium animi molestias, qui dolorum deleniti nostrum quibusdam temporibus nisi? Labore totam dolor quo nihil officia! Ullam fuga optio rerum! Corporis exercitationem doloremque, consequatur laudantium veniam quisquam amet! Natus, facere sunt!</p>
            <a href="article" class="sec_link_button">Lire la suite</a>
        </section>

        <div class="divider"></div>

        <!-- Trend fossils -->
        <section id="trend_fossils">
            <h2>Nos fossiles tendances</h2>
            <div>
                <a href="fossil">
                    <article>
                        <img src="https://placehold.co/200" alt="Photo du fossile">
                        <h3>Nom du fossile</h3>
                        <p>Datation</p>
                    </article>
                </a>
    
                <a href="fossil">
                    <article>
                        <img src="https://placehold.co/200" alt="Photo du fossile">
                        <h3>Nom du fossile</h3>
                        <p>Datation</p>
                    </article>
                </a>
    
                <a href="fossil">
                    <article>
                        <img src="https://placehold.co/200" alt="Photo du fossile">
                        <h3>Nom du fossile</h3>
                        <p>Datation</p>
                    </article>
                </a>
            </div>
        </section>

        <div class="divider"></div>

        <!-- Random fossil -->
        <section id="random_fossil">
            <h2>Fossile au hasard</h2>
            <a href="">
                <article id="random_fossil_card" class="large_card">
                    <div>
                        <h3>Nom du fossile</h3>
                        <p>Nom de l'espèce</p>
                        <img src="https://placehold.co/200" alt="Photo du fossile">
                    </div>
                    <p id="random_fossil_description">Description du fossile Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquid, pariatur nobis. Odio, non deleniti illo nihil nemo error recusandae quae facere adipisci facilis quidem? Perferendis pariatur deleniti qui fuga neque.</p>
                </article>
            </a>
        </section>
    </main>

    <!-- Footer -->
    <?php include 'component/footer.php' ?>

    <!-- Scripts -->
    <script src="./script/main.js"></script>
</body>
</html>