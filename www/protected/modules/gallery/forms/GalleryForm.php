<?php

return array(
    'activeForm' => array(
        'id'         => 'news-form',
        'class'      => 'CActiveForm',
        'htmlOptions'=> array('enctype'=> 'multipart/form-data'),
    ),
    'elements'   => array(
        'is_published' => array('type' => 'checkbox'),
        'title'        => array(
            'type'  => 'text',
            'class' => 'big'
        ),
        'date' => array('type' => 'date'),
        'files'        => array(
            'type'      => 'file_manager',
            'data_type' => 'any',
            'title'     => 'Фотографии',
            'tag'       => 'files'
        ),
//        'meta'  => array(
//            'type'   => 'widget',
//            'widget' => 'MetaTagSubForm'
//        ),
    ),
    'buttons'    => array(
        'submit' => array(
            'type'  => 'submit',
            'value' => $this->model->isNewRecord ? 'Создать' : 'Сохранить'
        )
    )
);
