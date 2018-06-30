<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="w1190 ks-webkit537 ks-webkit ks-chrome60 ks-chrome browser-Chromium">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
<style>
body,button,input,select,textarea {
    font:12px/1.5 tahoma,arial,"\5b8b\4f53";
    -ms-overflow-style:scrollbar
}
ul, li {
    margin:0;
    padding:0;
}
a {
    text-decoration: none;
}
.navbar-fixed-top, .navbar-fixed-bottom {
    position: fixed;
    right: 0;
    left: 0;
    z-index: 1030;
}
.container > .navbar-header, .container-fluid > .navbar-header, .container > .navbar-collapse, .container-fluid > .navbar-collapse {
    margin-right: 0;
    margin-left: 0;
}
.navbar-inverse .navbar-toggle {
    border-color: #333;
}
.navbar-toggle {
    display: none;
}
.navbar-toggle {
    position: relative;
    float: right;
    padding: 9px 10px;
    margin-top: 8px;
    margin-right: 15px;
    margin-bottom: 8px;
    background-color: transparent;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
.navbar > .container .navbar-brand, .navbar > .container-fluid .navbar-brand {
    margin-left: -15px;
}
.navbar-inverse .navbar-brand {
    color: #9d9d9d;
}
.navbar-brand {
    float: left;
/*     height: 30px; */
    padding: 15px 15px;
    font-size: 18px;
    line-height: 20px;
}



.navbar-inverse {
    background-color: #222;
    border-color: #080808;
}
.navbar-fixed-top {
    top: 0;
    border-width: 0 0 1px;
}
.navbar-fixed-top, .navbar-fixed-bottom {
    border-radius: 0;
}
.navbar-fixed-top, .navbar-fixed-bottom {
    position: fixed;
    right: 0;
    left: 0;
    z-index: 1030;
}
.navbar {
    min-height: 50px;
    margin-bottom: 0px;
    border: 1px solid transparent;
}
/* @media (min-width: 1200px) */
.container {
    width: 1170px;
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}

/* @media (min-width: 768px) */
.navbar-right {
    float: right !important;
    margin: 0 -15px 0 0;
}
/* @media (min-width: 768px) */
.navbar-nav > li {
    float: left;
}
.nav > li {
    position: relative;
    display: block;
}


.navbar-inverse .navbar-nav > li > a {
    color: #9d9d9d;
}
.navbar-nav > li > a {
    padding-top: 15px;
    padding-bottom: 15px;
}
.navbar-nav > li > a {
    font-size: 14px;
    padding-top: 10px;
    padding-bottom: 10px;
    line-height: 30px;
}
.nav > li > a {
    position: relative;
    display: block;
    padding: 10px 15px;
    text-decoration: none;
}

.wrap > #page {
    padding: 52px 15px 20px;
}
.slide {
    width: 990px;
    height: 450px;
    margin: 0 auto;
}
.carousel-inner > .item > img {
    width: 990px;
    height: 450px;
}
.carousel-control {
    background: none !important;
}
</style>
    <?php
    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    $menuItems = [
        ['label' => '首页', 'url' => ['/site/index']],
        ['label' => '所有产品', 'url' => ['/search/index']],
//         ['label' => '手卷钢琴', 'url' => ['/category/index']],
        ['label' => '关于我们', 'url' => ['/site/about']],
//         ['label' => '联系我们', 'url' => ['/site/contact']],
    ];
//     if (Yii::$app->user->isGuest) {
//         $menuItems[] = ['label' => 'Signup', 'url' => ['/site/signup']];
//         $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
//     } else {
//         $menuItems[] = '<li>'
//             . Html::beginForm(['/site/logout'], 'post')
//             . Html::submitButton(
//                 'Logout (' . Yii::$app->user->identity->username . ')',
//                 ['class' => 'btn btn-link logout']
//             )
//             . Html::endForm()
//             . '</li>';
//     }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-left'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>


    <div id="page">
<div id="content" data-cat="J_Cat" data-type="normal">
<?= $content ?>
</div>
</div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; <?= Html::encode(Yii::$app->name) ?> <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
