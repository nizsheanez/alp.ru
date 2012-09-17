<?php

return array(
	'activeForm' => array(
		'id'         => 'article-form',
		'class'      => 'CActiveForm',
		'htmlOptions'=>array('enctype'=>'multipart/form-data'),
	),
	'elements' => array(
        'section_id' => array(
            'type'  => 'dropdownlist',
            'items' => CHtml::listData(ArticleSection::model()->findAll(), 'id', 'name')
        ),
		'title' => array('type' => 'text', 'hint' => 'Подсказка'),
		'text'  => array('type' => 'application.extensions.tiny_mce.TinyMCE'),
		'date'  => array('type' => 'date'),
        'files' => array('type' => 'file_manager')
	),
	'buttons' => array(
		'submit' => array('type' => 'submit', 'value' => $this->model->isNewRecord ? 'Создать' : 'Сохранить'),
	)
);
