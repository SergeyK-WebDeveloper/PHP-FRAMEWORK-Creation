<?php

/**
 * Description of Router
 *
 */
class Router {
    
    /**
     * таблица маршрутов
     * @var array
     */
    protected static $routes = [];
    
    /**
     * текущий маршрут
     * @var array
     */
    protected static $route = [];
    
    /**
     * добавляет маршрут в таблицу маршрутов
     * 
     * @param string $regexp регулярное выражение маршрута
     * @param array $route маршрут ([controller, action, params])
     */
    public static function add($regexp, $route = []) {
        self::$routes[$regexp] = $route;
    }
    
    /**
     * возвращает таблицу маршрутов
     * 
     * @return array
     */
    public static function getRoutes() {
        return self::$routes;
    }
    
    /**
     * возвращает текущий маршрут (controller, action, [params])
     * 
     * @return array
     */
    public static function getRoute() {
        return self::$route;
    }
    
    /**
     * ищет URL в таблице маршрутов
     * @param string $url входящий URL
     * @return boolean
     */
    public static function matchRoute($url) {
        foreach(self::$routes as $pattern => $route){
            if(preg_match("#$pattern#i", $url, $matches)){
                foreach($matches as $k => $v){
                    if(is_string($k)){
                        $route[$k] = $v;
                    }
                }
                if(!isset($route['action'])){
                    $route['action'] = 'index';
                }
                self::$route = $route;
                return true;
            }
        }
        return false;
    }
    
    /**
     * перенаправляет URL по корректному маршруту
     * @param string $url входящий URL
     * @return void
     */
    public static function dispatch($url){
        if(self::matchRoute($url)){
            $controller = self::upperCamelCase(self::$route['controller']);
            if(class_exists($controller)){
                $cObj = new $controller;
                $action = self::lowerCamelCase(self::$route['action']) . 'Action';
                if(method_exists($cObj, $action)){
                    $cObj->$action();
                }else{
                    echo "Метод <b>$controller::$action</b> не найден";
                }
            }else{
                echo "Контроллер <b>$controller</b> не найден";
            }
        }else{
            http_response_code(404);
            include '404.html';
        }
    }
    
    /**
     * преобразует имена к виду CamelCase
     * @param string $name строка для преобразования
     * @return string
     */
    protected static function upperCamelCase($name) {
        return str_replace(' ', '', ucwords(str_replace('-', ' ', $name)));
    }
    
    /**
     * преобразует имена к виду camelCase
     * @param string $name строка для преобразования
     * @return string
     */
    protected static function lowerCamelCase($name) {
        return lcfirst(self::upperCamelCase($name));
    }
    
}
