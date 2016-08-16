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
                            ['label' => 'Usuarios', 'icon' => '', 'url' => ['/user/manager']],
                            ['label' => 'Roles', 'icon' => '', 'url' => ['/rbac/role']],
                            ['label' => 'Permisos', 'icon' => '', 'url' => ['/rbac/permission']],
                            ['label' => 'Asignacion', 'icon' => '', 'url' => ['/rbac/assignment']],
                            ['label' => 'Reglas', 'icon' => '', 'url' => ['/rbac/rule']],
                        ],
                    ],        
                    [
                        'label' => 'Catálogos',
                        'icon' => 'fa fa-navicon',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Universidades', 'icon' => '', 'url' => ['/catalogs/universidad']],
                            ['label' => 'Facultades', 'icon' => '', 'url' => ['/catalogs/facultad']],
                            ['label' => 'Carreras', 'icon' => '', 'url' => ['/catalogs/carrera']],
                            ['label' => 'Instituciones', 'icon' => '', 'url' => ['/catalogs/institucion']],
                            ['label' => 'Proyecto', 'icon' => '', 'url' => ['/catalogs/proyecto']],
                            ['label' => 'Estado Proyecto', 'icon' => '', 'url' => ['/catalogs/estados-proyecto']],
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