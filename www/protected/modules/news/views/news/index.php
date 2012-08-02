<?php
$this->page_title = Yii::t('NewsModule.main', 'Новости');

$this->widget('zii.widgets.CListView', array(
    'dataProvider'     => $data_provider,
    'itemView'         => '_view',
    'emptyText'        => $this->msg(Yii::t('main', 'ничего не найдено'), 'info'),
    'enablePagination' => true,
    'summaryText'      => false,
    'htmlOptions'      => array(
        'class' => 'news-list'
    ),
    'ajaxUpdate'       => false,
    'pager'            => array(
        'class'   => 'YearPager',
    )
));
?>
