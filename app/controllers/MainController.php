<?php

namespace app\controllers;

use app\models\Main;
use fw\core\App;
use fw\core\base\View;
use Monolog\Handler\StreamHandler;
use Monolog\Logger;

/**
 * Description of Main
 *
 */
class MainController extends AppController{
    
//    public $layout = 'main';
    
    public function indexAction(){

        // create a log channel
        $log = new Logger('name');
        $log->pushHandler(new StreamHandler(ROOT . '/tmp/your.log', Logger::WARNING));

// add records to the log
        $log->warning('Foo');
        $log->error('Bar');

        $mailer = new \PHPMailer();
        var_dump($mailer);


//        \R::fancyDebug(true);
        $model = new Main;
//        echo $test;
//        trigger_error("E_USER_ERROR", E_USER_ERROR);
        $posts = \R::findAll('posts');
        $post = \R::findOne('posts', 'id = 1');
        $menu = $this->menu;
        $title = 'PAGE TITLE';
//        $this->setMeta('Главная страница', 'Описание страницы', 'Ключевые слова');
//        $meta = $this->meta;
        View::setMeta('Главная страница', 'Описание страницы', 'Ключевые слова');
        $this->set(compact('title', 'posts', 'menu', 'meta'));
    }
    
    public function testAction(){
        if($this->isAjax()){
            $model = new Main();
//            $data = ['answer' => 'Ответ с сервера', 'code' => 200];
//            echo json_encode($data);
            $post = \R::findOne('posts', "id = {$_POST['id']}");
            $this->loadView('_test', compact('post'));
            die;
        }
        echo 222;
    }
    
}
