<?php
$elements = array(
    'is_published'       => array('type' => 'checkbox'),
    'title'              => array('type' => 'text'),
    'alias'              => array(
        'type'   => 'alias',
        'source' => 'title'
    ),
    'icon'               => array('type' => 'file'),
    'text'               => array('type' => 'editor'),
    'for_price'          => array('type' => 'editor'),
    'sidebar_top_title'  => array('type' => 'text'),
    'sidebar_top'        => array('type' => 'editor'),
    'meta_tags'          => array('type' => 'MetaTags'),
);
if ($this->model->is_system)
{
    unset($elements['alias']);
}
return array(
    'activeForm' => array(
        'id'                     => 'category-form',
        'htmlOptions'            => array('enctype'=> 'multipart/form-data'),
        'class'                  => 'CActiveForm',
        'enableAjaxValidation'   => true,
        'enableClientValidation' => true,
        'clientOptions'          => array(
            'validateOnSubmit' => true,
            'validateOnChange' => false
        )
    ),
    'elements'   => $elements,
    'buttons'    => array(
        'submit' => array(
            'type'  => 'submit',
            'value' => Yii::t('main', 'Отправить'),
            'id'    => 'feedback_button'
        )
    )
);
