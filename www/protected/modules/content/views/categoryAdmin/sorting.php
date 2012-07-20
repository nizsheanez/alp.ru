<?php
$this->page_title = $this->t('admin', 'update');

$this->tabs = array(
    $this->t('admin', 'manage')  => $this->url("manage"),
    $this->t('admin', 'sorting') => $this->url("sorting"),
    $this->t('admin', 'create')  => $this->url("create", array('parent_id'=>1)),
);

$this->widget('products.portlets.NestedTree', array(
    'model'    => Category::model(),
    'sortable' => true,
    'id'       => 'category_sorting'
));