<?php
$only_on_new_record = array('alias');
if (!$form->model->isNewRecord && in_array($element->type, $only_on_new_record))
{
    return '';
}


$arr      = array('file_manager');
$no_label = array('MetaTags');
if (!in_array($element->type, $arr) && !in_array($element->type, $no_label))
{
    echo $element->renderHint();
    echo $form->getActiveFormWidget()->labelEx($form->model, $element->name);
}

//input widgets
switch ($element->type)
{
    case 'checkbox':
        $element->type = 'main.components.IphoneCheckbox';
        break;
    case 'multi_autocomplete':
        $element->type = 'products.portlets.MultiAutocomplete';
        break;
    case 'alias':
        $element->type = 'main.components.AliasField';
        $element->class = 'text';
        break;
}

//widgets
switch ($element->type)
{
    case 'date':
        $model_class = get_class($form->model);
        echo $form->getActiveFormWidget()->textField($form->model, $element->name, $element->attributes);
        $this->widget('application.extensions.calendar.SCalendar', array(
            'inputField' => "{$model_class}_{$element->name}",
            'ifFormat'   => '%d.%m.%Y',
            'language'   => 'ru-UTF'
        ));
        break;
    case 'editor':
        $this->widget('application.extensions.tiny_mce.TinyMCE', array(
            //                'editorTemplate' => 'full',
            'model'     => $form->model,
            'attribute' => $element->name,
        ));
        break;
    case 'multi_select':
        $this->widget('application.extensions.emultiselect.EMultiSelect');

        echo $form->getActiveFormWidget()->dropdownlist($form->model, $element->name, $element->items, array(
            'multiple' => 'multiple',
            'key'      => isset($element->key) ? $element->key : 'id',
            'class'    => 'multiselect'
        ));

        break;
    case 'autocomplete':
        $this->widget('CAutoComplete', array(
            'name'       => $element->name,
            'attribute'  => $element->name,
            'model'      => $form->model,
            'url'        => array($element->url),
            'minChars'   => 2,
            'delay'      => 500,
            'matchCase'  => false,
            'htmlOptions'=> array(
                'size'  => '40',
                'class' => 'text'
            )
        ));
        break;
    case 'file_manager':
        $id    = isset($element->id) ? $element->id : 'uploader' . $element->attributes['tag'];
        $title = isset($element->attributes['title']) ? $element->attributes['title'] : 'Файлы';
        Yii::app()->clientScript->registerScript("{$id}_checker", '
            $("#' . $id . '_checker").click(function(){$(this).siblings(".uploader").slideToggle(); return false;});
        ');
        echo CHtml::link($title, "#", array(
            'id'    => $id . '_checker',
            'class' => 'fieldset-checker'
        ));
        $this->widget('fileManager.portlets.Uploader', array(
            'model'       => $form->model,
            'id'          => $id,
            'data_type'   => $element->attributes['data_type'],
            'maxFileSize' => 10 * 1000 * 1000,
            'tag'         => $element->attributes['tag'],
            'title'       => $title
        ));
        break;

    default:
        echo $element->renderInput();
        break;
}

$arr = array();
if (in_array($element->type, $arr) && !in_array($element->type, $no_label))
{
    echo $element->renderHint();
    echo $form->getActiveFormWidget()->labelEx($form->model, $element->name);
}
echo $form->getActiveFormWidget()->error($form->model, $element->name);
?>


