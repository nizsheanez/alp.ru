<?php
if ($model->depth > 2)
{
    $children = $model->parent->published()->children()->findAll();
}
else
{
    $children = $model->published()->children()->findAll();
}
foreach ($children as $item)
{
    $class = $item->id == $model->id ? ' active' : '';
    echo CHtml::link($item->title, $item->href, array('class' => 'subcategory' . $class));
}
?>