<?php
if ($model->depth > 2)
{
    $cur_main_model = $model->parent;
}
else
{
    $cur_main_model = $model;
}
Yii::app()->controller->cur_chapter = $cur_main_model->alias;
$children = $cur_main_model->published()->children()->findAll();
?>
<ul>
<?php
$i = 0;
foreach ($children as $item)
{
    $class = $item->id == $model->id ? ' active' : '';
    $link = CHtml::link($item->title, $item->href, array('class' => 'subcategory' . $class));
    echo CHtml::tag('li', array(), $link);
    if (++$i % 4 == 0)
    {
        echo '</ul><ul>';
    }
}
?>
</ul>
<div class="clr"></div>
<br/>