<?php
Yii::import("zii.widgets.CListView");
class ListView extends CListView
{
    public $pager = array(
        'class'   => 'LinkPager'
    );
    
}