<?php

return array(
    'activeForm' => array(
        'id'         => 'news-form',
        'class'      => 'CActiveForm',
        'htmlOptions'=> array('enctype'=> 'multipart/form-data'),
    ),
    'elements'   => array(
        'title'        => array(
            'type'  => 'text',
            'class' => 'big'
        ),
        'is_published' => array('type' => 'checkbox'),
        'photo' => array('type' => 'file'),
        'date' => array('type' => 'date'),
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
