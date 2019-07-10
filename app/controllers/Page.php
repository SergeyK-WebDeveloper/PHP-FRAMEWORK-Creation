<?php

namespace app\controllers;

/**
 * Description of Page
 *
 */
class Page extends \vendor\core\base\Controller{
    
    public function viewAction(){
        debug($this->route);
        debug($_GET);
        echo $_GET['page'];
        echo 'Page::view';
    }
    
}
