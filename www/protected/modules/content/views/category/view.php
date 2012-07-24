<?php $this->page_title = 'Наши <span>Услуги</span>'; ?>
<div class="category">
    <div class="details">
        <div class="text">
            <div class="decoration">
                <div class="children">
                    <?php echo $this->renderPartial('_children', array('model'=> $model)) ?>
                </div>
                    <?php
                    if ($model->icon)
                    {
                        echo ImageHelper::thumb(Category::UPLOAD_PATH, $model->icon, 153, 104, false, 'class="icon" align="left"');
                    } ?>
            </div>
            <p class="small-title">
                <?php echo $model->title ?>
            </p>
            <?php echo $model->text ?>
        </div>
    </div>

</div>

