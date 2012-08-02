<?php
class YearPagination extends CPagination
{

    public function getPageCount()
    {
        return (int)News::model()->active()->group('YEAR(date)')->count();
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