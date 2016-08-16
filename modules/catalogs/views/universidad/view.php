<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Universidad */
?>
<div class="universidad-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdUniversidad',
            'Nombre',
            'NombreCorto',
            'Mision',
            'Vision',
            'CorreoElectronico',
            'Telefono',
            'Direccion',
            'Url:url',
            'Logo',
            'EstadoRegistro',
        ],
    ]) ?>

</div>
