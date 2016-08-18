<?php
use yii\helpers\Html;
?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left ">
                <?= Html::img('@web/img/logo.png', ['alt'=>'some', 'class'=>'img img-responsive']);?> 
            </div>
<!--            <div class="pull-left info">
                <p><?=Yii::$app->user->identity->username;?></p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>-->
        </div>

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu'],
                'items' => [
//                    ['label' => 'Menu', 'options' => ['class' => 'text-info']],
//                    ['label' => 'Gii', 'icon' => 'fa fa-file-code-o', 'url' => ['/gii']],
//                    ['label' => 'Debug', 'icon' => 'fa fa-dashboard', 'url' => ['/debug']],
                    ['label' => 'Login', 'url' => ['site/login'], 'visible' => Yii::$app->user->isGuest],
                    [
                        'label' => 'Usuarios y permisos',
                        'icon' => 'fa fa-user',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Usuarios', 'icon' => '', 'url' => ['/user/manager'], 'visible'=>\Yii::$app->user->can('MantoUsuarios')],
                            ['label' => 'Roles', 'icon' => '', 'url' => ['/rbac/role'], 'visible'=>\Yii::$app->user->can('MantoRoles')],
                            ['label' => 'Permisos', 'icon' => '', 'url' => ['/rbac/permission'], 'visible'=>\Yii::$app->user->can('MantoPermisos')],
                            ['label' => 'Asignacion', 'icon' => '', 'url' => ['/rbac/assignment'], 'visible'=>\Yii::$app->user->can('MantoAsignaciones')],
//                            ['label' => 'Reglas', 'icon' => '', 'url' => ['/rbac/rule'], 'visible'=>\Yii::$app->user->can('MantoReglas')],
                        ],
                    ],        
                    [
                        'label' => 'Catálogos',
                        'icon' => 'fa fa-navicon',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Universidades', 'icon' => '', 'url' => ['/catalogs/universidad'], 'visible'=>\Yii::$app->user->can('MantoUniversidades')],
                            ['label' => 'Carreras', 'icon' => '', 'url' => ['/catalogs/carrera'], 'visible'=>\Yii::$app->user->can('MantoFacultades')],
                            ['label' => 'Instituciones', 'icon' => '', 'url' => ['/catalogs/institucion'], 'visible'=>\Yii::$app->user->can('MantoInstituciones')],
                            ['label' => 'Proyecto', 'icon' => '', 'url' => ['/catalogs/proyecto'], 'visible'=>\Yii::$app->user->can('MantoProyectos')],
//                            ['label' => 'Estado Proyecto', 'icon' => '', 'url' => ['/catalogs/estados-proyecto']],
                        ],
                    ],                      
                    [
                        'label' => 'Same tools',
                        'icon' => 'fa fa-share',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Gii', 'icon' => 'fa fa-file-code-o', 'url' => ['/gii'],],
                            ['label' => 'Debug', 'icon' => 'fa fa-dashboard', 'url' => ['/debug'],],                          
                            [
                                'label' => 'Level One',
                                'icon' => 'fa fa-circle-o',
                                'url' => '#',
                                'items' => [
                                    ['label' => 'Level Two', 'icon' => 'fa fa-circle-o', 'url' => '#',],
                                    [
                                        'label' => 'Level Two',
                                        'icon' => 'fa fa-circle-o',
                                        'url' => '#',
                                        'items' => [
                                            ['label' => 'Level Three', 'icon' => 'fa fa-circle-o', 'url' => '#',],
                                            ['label' => 'Level Three', 'icon' => 'fa fa-circle-o', 'url' => '#',],
                                        ],
                                    ],
                                ],
                            ],
                        ],
                    ],
                ],
            ]
        ) ?>

    </section>

</aside>
