<?php

$this->page_title = $model->title;

$this->tabs = array(
    "список страниц"    => $this->createUrl('manage'),
	"добавить страницу" => $this->createUrl('create'),
    "редактировать"     => $this->createUrl('update', array('id' => $model->id))
);

$this->widget('DetailView', array(
	'data'=>$model,
	'attributes'=>array(
        'title',
		'url',
		array(
            'name'  => 'is_published',
            'value' => $model->is_published ? "да" : "нет"
        ),
		'date_create',
        array(
            'name'  => 'text',
            'type'  => 'raw',
            'value' => $model->text
        ),
	),
));
?>
