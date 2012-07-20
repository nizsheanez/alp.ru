<h2><?php echo $model->title ?></h2>
<div id="reviews">
    <?php
    foreach ($model->files as $file)
    {
        ?>
        <a rel="group_<?php echo $model->id ?>" href="/<?php echo
            FileManager::UPLOAD_PATH . '/' . $file->name ?>">
            <?php
            echo ImageHelper::thumb(FileManager::UPLOAD_PATH, $file->name, 150, 220, true, 'class="review_img"  width="150" height="220"');
            ?>
        </a>
        <?php
    }
    ?>

</div>
