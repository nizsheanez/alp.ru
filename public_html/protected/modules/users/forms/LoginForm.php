<?php

$form = include "UserForm.php";

$form['elements'] = array(
    'email'    => $form['elements']['email'],
    'password' => $form['elements']['password']
);

$form['action'] = Yii::app()->controller->url('/users/user/login');

return $form;