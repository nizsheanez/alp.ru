<?php
$this->page_title = $this->t('admin', 'view');

$this->tabs = array(
    $this->t('admin', 'manage') => $this->createUrl('manage'),
    $this->t('admin', 'update') => $this->createUrl('update', array('id' => $model->id))
);

$this->widget('DetailView', array(
	'data' => $model,
	'attributes' => array(
		array('name' => 'title'),
	),
)); 
?>
