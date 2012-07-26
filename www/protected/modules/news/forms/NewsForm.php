<?php

return array(
    'activeForm' => array(
        'id'         => 'news-form',
        'class'      => 'CActiveForm',
        'htmlOptions'=> array('enctype'=> 'multipart/form-data'),
    ),
    'elements'   => array(
        'title' => array(
            'type'  => 'text',
            'class' => 'big'
        ),
        'text'  => array('type' => 'editor'),
        'state' => array(
            'type'  => 'dropdownlist',
            'items' => News::$states
        ),
        'date'  => array('type' => 'date'),
                'meta_tags'    => array('type' => 'MetaTags'),
    ),
    'buttons'    => array(
        'submit' => array(
            'type'  => 'submit',
            'value' => $this->model->isNewRecord ? 'Создать' : 'Сохранить'
        )
    )
);
