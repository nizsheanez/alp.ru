<?php
class YearPager extends CLinkPager
{
    public $cssFile = false;
    public $header = false;
    public $htmlOptions=array(
        'class' => 'year-pager'
    );

    protected function createPageButtons()
    {
        if(($pageCount=$this->getPageCount())<=1)
            return array();

        $currentPage=$this->getCurrentPage(false); // currentPage is calculated in getPageRange()
        $buttons=array();

        // internal pages
        $currentYear = $this->pages->getYear();
        $now = date('Y', time());
        for($i=0;$i<=$pageCount-1;++$i)
        {
            $year = $now - $i;
            if ($currentYear != $year)
            {
                $buttons[]=$this->createPageButton($year,$i,self::CSS_INTERNAL_PAGE,false,$i==$currentPage);
            }
        }

        return array_reverse($buttons);
    }

    protected function createPageButton($label,$page,$class,$hidden,$selected)
    {
        if($hidden || $selected)
            $class.=' '.($hidden ? self::CSS_HIDDEN_PAGE : self::CSS_SELECTED_PAGE);
        if ($this->pages->model instanceof News)
        {
            $label = 'Новости за '.$label.' год';
        }
        elseif($this->pages->model instanceof Gallery)
        {
            $label = 'Фотографии за '.$label.' год';
        }
        return '<li class="'.$class.'">'.CHtml::link($label,$this->createPageUrl($page)).'</li>';
    }
}