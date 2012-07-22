<?php
$this->page_title = Yii::t('NewsModule.main', 'Наш <span>Фотоотчет</span>');
?>
<div id="review-list">
    <?php

    $this->widget('ListView', array(
        'dataProvider'     => $data_provider,
        'itemView'         => '_view',
        'emptyText'        => $this->msg(Yii::t('main', 'ничего не найдено'), 'info'),
        'enablePagination' => true,
        'summaryText'      => false,
        'ajaxUpdate'       => false,
        'pagerCssClass' => 'pager clr',
        'pager'            => false
    ));
    ?>
</div>

<?php
Yii::app()->clientScript->registerScriptFile('/js/plugins/fancybox/source/jquery.fancybox.js')
    ->registerCssFile('/js/plugins/fancybox/source/jquery.fancybox.css');
?>

<script type="text/javascript">
    $(document).ready(function()
    {
        $(".review_item a").fancybox({openSpeed:'slow',imgPreload:true, closeSpeed:'normal', openEffect:'fade', nextEffect:'fade', prevEffect:'fade'});
    });
</script>