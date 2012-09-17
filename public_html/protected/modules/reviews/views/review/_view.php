<?php if ($data->photo)
{
    ?>
<div class="review_item <?php echo $index % 3 == 0 ? 'clr' : '' ?>">
    <a href="/<?php echo Review::PHOTOS_DIR.'/'. $data->photo ?>">
        <?php
        echo ImageHelper::thumb(Review::PHOTOS_DIR, $data->photo, 150, 220, true, 'width="150" height="220" class="news_preview_image" target="_blank"');
        ?>
        <div class="img_title"><?php echo $data->title; ?></div>
    </a>
</div>
<?php } ?>

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