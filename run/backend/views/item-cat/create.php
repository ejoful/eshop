<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\ItemCat */

$this->title = Yii::t('app', 'Create Item Cat');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Cats'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-cat-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
