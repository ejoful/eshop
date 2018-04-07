<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemSku */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-sku-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'itemid')->textInput() ?>

    <?= $form->field($model, 'colorid')->textInput() ?>

    <?= $form->field($model, 'packageid')->textInput() ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'num')->textInput() ?>

    <?= $form->field($model, 'business_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_barcode')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
