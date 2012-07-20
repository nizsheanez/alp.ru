<?php
$this->page_title = $this->t('admin', 'manage');

$this->tabs = array(
    $this->t('admin', 'create') => $this->createUrl("create")
);

$this->widget('AdminGrid', array(
	'id'=>'news-grid',
	'sortable'=>true,
	'dataProvider' => $model->search(),
	'filter' => $model,
	'columns'=>array(
		'title',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); 
?>
