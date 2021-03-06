<?php if ($data->files)
{
    $files = $data->files;
    $file = $files[0];
    unset($files[0]);
    ?>
<div class="review_item <?php echo $index % 3 == 0 ? 'clr' : '' ?>">
    <a rel="group_<?php echo $data->id ?>" href="/<?php echo FileManager::UPLOAD_PATH . '/' . $file->name ?>">
        <?php
        echo ImageHelper::thumb(FileManager::UPLOAD_PATH, $file->name, 150, 220, true, 'width="150" height="220" class="news_preview_image" target="_blank"');
        ?>
        <br/>
        <div class="img_title"><?php echo $data->title; ?> (<?php echo count($data->files) ?>)</div>
    </a>
    <?php
    foreach ($files as $file)
    {
        ?>
        <a rel="group_<?php echo $data->id ?>" class="hide" href="/<?php echo
            FileManager::UPLOAD_PATH . '/' . $file->name ?>"></a>
    <?php } ?>
</div>
<?php } ?>

