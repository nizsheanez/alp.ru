<?php

return array(
    'activeForm' => array(
        'id' => 'language-form'
    ),
    'elements' => array(
        'id'   => array('type' => 'text'),
        'name' => array('type' => 'text'),
    ),
    'buttons' => array(
        'submit' => array(
            'type'  => 'submit',
            'value' => $this->model->isNewRecord ? 'Добавить' : 'Сохранить'
        )
    )
);
