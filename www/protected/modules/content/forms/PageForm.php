<?php

return array(
    'activeForm'=> array(
        'id'                   => 'page-form',
        'class'                => 'CActiveForm',
        'htmlOptions'          => array('enctype'=> 'multipart/form-data'),
        'enableAjaxValidation' => false,
        'clientOptions'        => array(
            'validateOnSubmit' => true,
            'validateOnChange' => true
        )
    ),
    'elements'  => array(
        'title'        => array('type' => 'text'),
        'url'          => array('type' => 'text'),
        'text'         => array('type' => 'editor'),
        'back_left'    => array('type' => 'file'),
        'back_center'  => array('type' => 'file'),
        'is_published' => array('type' => 'checkbox'),
        'meta_tags'    => array('type' => 'MetaTags'),
//        'meta_tags'    => array('type' => 'MetaTags')
    ),
    'buttons'   => array(
        'submit' => array(
            'type'  => 'submit',
            'value' => 'сохранить'
        )
    )
);

