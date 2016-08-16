<?php

use yii\widgets\DetailView;
use app\helpers\CrudHelper;
/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Institucion */
?>
<div class="institucion-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'IdInstitucion',
            'Nombre',
            'Siglas',
            'SitioWeb',
            [
                'value' => CrudHelper::getEstadosRegistroLabel($model->EstadoRegistro),
                'label'=> 'EstadoRegistro',
            ],  
        ],
    ]) ?>

</div>
