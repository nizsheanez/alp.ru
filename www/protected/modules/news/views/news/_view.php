<div class="hentry news_item">
    <link class="uid" href="<?php echo $data->url; ?>" />
    <h4 class="entry-title"><?php echo $data->title . ' | ' . date('d.m.Y', strtotime($data->date)); ?></h4>
    <span class="entry-content">
        <?php echo $data->text; ?>
    </span>
</div>
<div class="dashed-divider"></div>