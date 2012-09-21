<?php //check short_open_tag php.ini directive is set
if (ini_get('short_open_tag') != '1')
{
    echo 'Please set short_open_tag directive';
    die;
}
?><?
$expires = 60*60*24;
$time1 = gmdate('D, d M Y H:i:s', time() - $expires);
$time2 = gmdate('D, d M Y H:i:s', time() + $expires);
header("Pragma: public");
header("Cache-Control: maxage=".$expires);
header('Expires: ' . $time2 . ' GMT');
header('Last-Modified: '. $time1 .' GMT');

ini_set("display_errors", 1);
error_reporting(E_ALL);
ini_set('xdebug.max_nesting_level', 1000);
date_default_timezone_set('Europe/Moscow');

define('DS', DIRECTORY_SEPARATOR);

$_SERVER['DOCUMENT_ROOT'] = str_replace(array('\\', '/'), DS, $_SERVER['DOCUMENT_ROOT']);

if (substr($_SERVER['DOCUMENT_ROOT'], -1) != DS)
{
    $_SERVER['DOCUMENT_ROOT'] = $_SERVER['DOCUMENT_ROOT'] . DS;
}
require_once $_SERVER['DOCUMENT_ROOT'] . 'protected' . DS . 'config' . DS . 'constants.php';
require_once LIBRARIES_PATH . 'yii' . DS . 'yii.php';
require_once LIBRARIES_PATH . 'functions.php';
require_once LIBRARIES_PATH . 'debug.php';

$env = YII_DEBUG ? 'development' : 'production';
defined('ENV') || define('ENV', $env);

$config = $_SERVER['REMOTE_ADDR'] == '127.0.0.1' ? 'development' : 'production';
$config = APP_PATH . '/config/' . $config . '.php';

Yii::createWebApplication($config)->run();

?>



