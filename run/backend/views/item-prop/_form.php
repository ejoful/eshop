<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemProp */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-prop-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'pid')->textInput() ?>

    <?= $form->field($model, 'child_template')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cid')->textInput() ?>

    <?= $form->field($model, 'features')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_allow_alias')->textInput() ?>

    <?= $form->field($model, 'is_color_prop')->textInput() ?>

    <?= $form->field($model, 'is_enum_prop')->textInput() ?>

    <?= $form->field($model, 'is_input_prop')->textInput() ?>

    <?= $form->field($model, 'is_item_prop')->textInput() ?>

    <?= $form->field($model, 'is_key_prop')->textInput() ?>

    <?= $form->field($model, 'is_material')->textInput() ?>

    <?= $form->field($model, 'is_sale_prop')->textInput() ?>

    <?= $form->field($model, 'is_taosir')->textInput() ?>

    <?= $form->field($model, 'material_do')->textInput() ?>

    <?= $form->field($model, 'modified_time')->textInput() ?>

    <?= $form->field($model, 'modified_type')->dropDownList([ 'modify' => 'Modify', 'add' => 'Add', 'delete' => 'Delete', '' => '', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'multi')->textInput() ?>

    <?= $form->field($model, 'must')->textInput() ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'parent_pid')->textInput() ?>

    <?= $form->field($model, 'parent_vid')->textInput() ?>

    <?= $form->field($model, 'required')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sort_order')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'taosir_do')->textInput() ?>

    <?= $form->field($model, 'child_path')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'attr_keys')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
