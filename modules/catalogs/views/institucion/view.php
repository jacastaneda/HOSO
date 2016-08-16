<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Institucion */
?>
<div class="institucion-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdInstitucion',
            'Nombre',
            'Siglas',
            'SitioWeb',
            'EstadoRegistro',
        ],
    ]) ?>

</div>
