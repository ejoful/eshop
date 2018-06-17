<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemPropValue */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-prop-value-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'vid')->textInput() ?>

    <?= $form->field($model, 'cid')->textInput() ?>

    <?= $form->field($model, 'pid')->textInput() ?>

    <?= $form->field($model, 'sid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'prop_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_alias')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'spell')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_parent')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'sort_order')->textInput() ?>

    <?= $form->field($model, 'features')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'modified_type')->dropDownList([ 'modify' => 'Modify', 'add' => 'Add', 'delete' => 'Delete', '' => '', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'last_modified')->textInput() ?>

    <?= $form->field($model, 'leaf')->textInput() ?>

    <?= $form->field($model, 'spuid')->textInput() ?>

    <?= $form->field($model, 'child_pid')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
