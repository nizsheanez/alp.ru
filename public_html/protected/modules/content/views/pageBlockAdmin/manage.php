<?php
$this->page_title = 'Управление блоками страниц';

$this->tabs = array(
    "добавить" => $this->createUrl("create"),
);

$this->widget('AdminGrid', array(
	'id'=>'page-part-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'title',
		'name',
		array('name' => 'text', 'type' => 'raw'),
		'date_create',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); 
?>
