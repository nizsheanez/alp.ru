<?php
$this->page_title = Yii::t('NewsModule.main', 'Отзывы');
?>
<div class="title">Фото</div>
<div id="review-list">
    <?php
    $this->widget('ListView', array(
        'dataProvider'     => $data_provider,
        'itemView'         => '_view',
        'emptyText'        => $this->msg(Yii::t('main', 'ничего не найдено'), 'info'),
        'enablePagination' => true,
        'summaryText'      => false,
        'ajaxUpdate'       => false,
        'pager'            => array(
            'class'   => 'CLinkPager',
        )
    ));
    ?>
</div>
