<div class="news_item">
    <h3><a href="<?php echo $data->url; ?>"><?php echo $data->title . ' | ' . date('d.m.Y', strtotime($data->date)); ?></a></h3>

    <?php if ($data->photo): ?>
        <?php echo ImageHelper::thumb(
            News::PHOTOS_DIR,
            $data->photo,
            News::PHOTO_SMALL_WIDTH,
            News::PHOTO_SMALL_HEIGHT,
            true,
            'class="news_preview_image"'
        );
        ?>

        <?php echo Yii::app()->text->cut($data->text, 400, '.', '...'); ?>

        <a href="<?php echo $data->url; ?>">фото &raquo;</a>

    <?php endif ?>
</div>
<div class="dashed-divider"></div>