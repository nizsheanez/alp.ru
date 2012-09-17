<?php
class AliasField extends InputWidget
{
    public $source = 'checkbox';


    public function init()
    {
        parent::init();
        $attrs = array();
        CHtml::resolveNameID($this->model, $this->source, $attrs);

        $options = CJavaScript::encode(array(
            'destination'   => $this->id,
        ));
        $id = $attrs['id'];
        Yii::app()->clientScript->registerScriptFile('/js/plugins/adminForm/alias/jquery.synctranslit.js')
            ->registerScript($this->id . '_iphone_checkbox', "
                $('#{$id}').syncTranslit($options);
                $('#{$this->id}').siblings('.change_alias').click(function(){
                    $(this).hide();
                    $('#{$this->id}').removeAttr('disabled');
                    return false;
                });
            ");
    }


    public function run()
    {
        echo CHtml::activeTextField($this->model, $this->attribute, array('class' => $this->class, 'disabled'=>'disabled'));
        echo CHtml::link(CHtml::image('/images/admin/editable.gif','',array('height'=>16)), '#', array('class'=>'change_alias'));
    }
}