<?php
class YearPagination extends CPagination
{
    public $model;

    public function getPageCount()
    {
        $model = $this->model->model()->group('YEAR(date)');
        $model->getDbCriteria()->addCondition('date!="0000-00-00"');
        return (int)$model->count();
    }

    public function applyLimit($criteria)
    {
        $criteria->addCondition('YEAR(date) = '.$this->getYear());
    }

    public function getYear()
    {
        return date('Y', time()) - $this->getCurrentPage();
    }

}