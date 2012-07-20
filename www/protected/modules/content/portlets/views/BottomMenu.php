<div class="bottom-menu">
    <?php
    $i = 0;
    foreach ($sections as $section)
    {
        if ($i++ != 0)
        {
            echo '::';
        }
        ?>
        <a href="<?php echo $this->url($section->href); ?>"><?php echo $section->title; ?></a>
    <?php } ?>
</div>

