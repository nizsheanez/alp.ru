<?php
class ActiveDataProvider extends CActiveDataProvider
{
    const PAGE_SIZE = 10;

    public function __construct($model, $config = array())
    {
        $modelClass = is_string($model) ? $model : get_class($model);
        if (!isset($config['pagination']) || $config['pagination'] !== false)
        {
            if (isset(Yii::app()->session[$modelClass . "PerPage"]) &&
                Yii::app()->controller instanceof AdminController
            )
            {
                $page_size = Yii::app()->session[$modelClass . "PerPage"];
            }
            else
            {
                $reflection = new ReflectionClass($modelClass);

                $page_size = $reflection->getConstant('PAGE_SIZE');
                if (!$page_size)
                {
                    $page_size = self::PAGE_SIZE;
                }
            }

            $config['pagination']['pageSize'] = $page_size;
        }

        parent::__construct($model, $config);
    }

}
