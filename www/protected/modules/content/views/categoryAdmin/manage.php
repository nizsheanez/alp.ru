<?php
$this->page_title = $this->t('admin', 'manage');

$this->tabs = array(
    $this->t('admin', 'create')  => $this->url("create", array('parent_id'=>1)),
    $this->t('admin', 'sorting') => $this->url("sorting"),
);


$this->widget('content.components.TreeGridView', array(
    'id'           => 'category-grid',
    'dataProvider' => $model->search(),
    'filter'       => $model,
    'columns'      => array(
        'title',
        array(
            'class'   => 'CButtonColumn',
            'template'=> '{add_child}{update}{delete}',
            'buttons' => array(
                'add_child' => array(
                    'imageUrl' => '/images/admin/plus_16.png',
                    'url'      => '$data->addChildUrl',
                    'label'    => 'Добавить подкатегорию'
                ),
            )
        ),
    ),
));