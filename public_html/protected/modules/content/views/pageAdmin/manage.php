<?php
$this->page_title = 'Страницы сайта';

$this->tabs = array(
    "добавить страницу" => $this->createUrl('create')
);

$this->widget('AdminGrid', array(
	'id' => 'page-grid',
	'dataProvider' => $model->search(),
	'filter' => $model,
	'columns' => array(
		array(
			'name' => 'title',
			'type' => 'raw'
		),
		'url',
		array(
			'name'  => 'is_published',
			'value' => '$data->is_published ? "Да" : "Нет"'
		),
		array(
			'class'=>'CButtonColumn',
		),
	),
));
?>

