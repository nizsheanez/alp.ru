-- phpMyAdmin SQL Dump
-- version 
-- http://www.phpmyadmin.net
--
-- Хост: u326839.mysql.masterhost.ru
-- Время создания: Июл 19 2012 г., 12:12
-- Версия сервера: 5.5.24
-- Версия PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `u326839`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `name` varchar(500) NOT NULL COMMENT 'Наименование',
  `place` varchar(900) NOT NULL COMMENT 'Место проведения',
  `desc` text NOT NULL COMMENT 'Описание события ',
  `image` varchar(50) NOT NULL COMMENT 'Фото',
  `date` varchar(50) NOT NULL COMMENT 'Дата проведения',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Добавлено',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `actions`
--


-- --------------------------------------------------------

--
-- Структура таблицы `actions_files`
--

CREATE TABLE IF NOT EXISTS `actions_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` int(11) unsigned NOT NULL COMMENT 'Событие',
  `file` varchar(500) NOT NULL COMMENT 'Файл',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Добавлен',
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `actions_files`
--


-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `section_id` int(11) unsigned NOT NULL COMMENT 'Раздел',
  `title` varchar(400) NOT NULL COMMENT 'Заголовок',
  `text` longtext NOT NULL COMMENT 'Текст',
  `date` date NOT NULL COMMENT 'Дата',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Создано',
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `lang`, `section_id`, `title`, `text`, `date`, `date_create`) VALUES
(2, 'ru', 1, 'aaaad', '<p>ddddd</p>', '2011-10-07', '2011-10-07 17:50:33');

-- --------------------------------------------------------

--
-- Структура таблицы `articles_sections`
--

CREATE TABLE IF NOT EXISTS `articles_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT 'Родитель',
  `name` varchar(100) NOT NULL COMMENT 'Название',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Создан',
  `in_sidebar` int(1) NOT NULL DEFAULT '0' COMMENT 'разместить на главной странице',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `parent_id` (`parent_id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `articles_sections`
--

INSERT INTO `articles_sections` (`id`, `lang`, `parent_id`, `name`, `date_create`, `in_sidebar`) VALUES
(1, 'ru', NULL, 'www', '2011-09-14 19:08:20', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignments`
--

CREATE TABLE IF NOT EXISTS `auth_assignments` (
  `itemname` varchar(64) NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_assignments`
--

INSERT INTO `auth_assignments` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', 1, NULL, NULL),
('admin', 19, NULL, NULL),
('user', 17, NULL, NULL),
('user', 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_items`
--

CREATE TABLE IF NOT EXISTS `auth_items` (
  `name` varchar(64) NOT NULL COMMENT 'Название',
  `type` int(11) NOT NULL COMMENT 'Тип',
  `description` text COMMENT 'Описание',
  `bizrule` text COMMENT 'Бизнес-правило',
  `data` text COMMENT 'Данные',
  `allow_for_all` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Доступно всем',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_items`
--

INSERT INTO `auth_items` (`name`, `type`, `description`, `bizrule`, `data`, `allow_for_all`) VALUES
('ActionAdmin_Create', 0, 'Добавление мероприятия (админка)', NULL, 'N;', 0),
('ActionAdmin_Delete', 0, 'Удаление мероприятия (админка)', NULL, 'N;', 0),
('ActionAdmin_Manage', 0, 'Управление мероприятиями (админка)', NULL, 'N;', 0),
('ActionAdmin_Update', 0, 'Редактирование мероприятия (админка)', NULL, 'N;', 0),
('ActionAdmin_View', 0, 'Просмотр мероприятия (админка)', NULL, 'N;', 0),
('ActionFileAdmin_Create', 0, 'Добавление файла мероприятия (админка)', NULL, 'N;', 0),
('ActionFileAdmin_Delete', 0, 'Удаление файла мероприятия (админка)', NULL, 'N;', 0),
('ActionFileAdmin_Manage', 0, 'Управление файлами мероприятий (админка)', NULL, 'N;', 0),
('Actions_Admin', 1, 'Управление мероприятиями', '', 's:0:"";', 0),
('Action_Index', 0, 'Просмотр списка мероприятий', NULL, 'N;', 1),
('Action_View', 0, 'Просмотр мероприятия', NULL, 'N;', 1),
('admin', 2, 'Администратор', '', 's:0:"";', 0),
('Admin_Cities_Countries', 1, 'Управление городами и странами', NULL, 's:0:"";', 0),
('Admin_Content', 1, 'Управление контентом', '', 's:0:"";', 0),
('Admin_Documents', 1, 'Управление документами', '', 's:0:"";', 0),
('Admin_Faq', 1, 'Управление вопросами', '', 's:0:"";', 0),
('Admin_Feedback', 1, 'Управление обратной связью', '', 's:0:"";', 0),
('Admin_Languages', 1, 'Управление языками', '', 's:0:"";', 0),
('Admin_Main', 1, 'Админ панель', NULL, 's:0:"";', 0),
('Admin_News', 1, 'Управление новостями', '', 's:0:"";', 0),
('Admin_RBAC', 1, 'Управление контролем доступа', NULL, 's:0:"";', 0),
('Admin_Settings', 1, 'Управление настройками', '', 's:0:"";', 0),
('Admin_Users', 1, 'Управление пользователями', '', 's:0:"";', 0),
('ArticleAdmin_Create', 0, 'Добавление статьи (админка)', NULL, 'N;', 0),
('ArticleAdmin_Delete', 0, 'Удаление статьи (админка)', NULL, 'N;', 0),
('ArticleAdmin_Manage', 0, 'Управление статьями (админка)', NULL, 'N;', 0),
('ArticleAdmin_Update', 0, 'Редактирование статьи (админка)', NULL, 'N;', 0),
('ArticleAdmin_View', 0, 'Просмотр статьи (админка)', NULL, 'N;', 0),
('ArticleSectionAdmin_Create', 0, 'Добавление раздела статьи(админка)', '', 's:2:"N;";', 0),
('ArticleSectionAdmin_Delete', 0, 'Удаление раздела статьи(админка)', '', 's:2:"N;";', 0),
('ArticleSectionAdmin_GetSectionInSidebar', 0, 'Получить раздел статей, который в сайдбаре (админка)', '', 's:2:"N;";', 0),
('ArticleSectionAdmin_Manage', 0, 'Управление разделами статей(админка)', '', 's:2:"N;";', 0),
('ArticleSectionAdmin_Update', 0, 'Редактирование раздела статьи(админка)', '', 's:2:"N;";', 0),
('ArticleSectionAdmin_View', 0, 'Просмотр раздела статьи(админка)', '', 's:2:"N;";', 0),
('ArticleSection_GetChilds', 0, 'Получить подразделы статей', '', 's:2:"N;";', 1),
('Articles_Admin', 1, 'Управление статьями', '', 's:0:"";', 0),
('Article_Index', 0, 'Просмотр списка статей', NULL, 'N;', 1),
('Article_Search', 0, 'Поиск статей', NULL, 'N;', 1),
('Article_SectionArticles', 0, 'Просмотр статей раздела', NULL, 'N;', 1),
('Article_View', 0, 'Просмотр статьи', NULL, 'N;', 1),
('BannerAdmin_Create', 0, 'Создание баннера (админка)', NULL, 'N;', 0),
('BannerAdmin_Delete', 0, 'Удаление баннера (админка)', NULL, 'N;', 0),
('BannerAdmin_Manage', 0, 'Управление баннерами (админка)', NULL, 'N;', 0),
('BannerAdmin_Update', 0, 'Редактирование баннера (админка)', NULL, 'N;', 0),
('BannerAdmin_View', 0, 'Просмотр баннера (админка)', NULL, 'N;', 0),
('CertificateGroupAdmin_Create', 0, 'Создание группы сертификатов (админка)', NULL, 'N;', 0),
('CertificateGroupAdmin_Delete', 0, 'Удаление группы сертификатов (админка)', NULL, 'N;', 0),
('CertificateGroupAdmin_Manage', 0, 'Управление группами сертификатов (админка)', NULL, 'N;', 0),
('CertificateGroupAdmin_Update', 0, 'Редактирование группы сертификатов (админка)', NULL, 'N;', 0),
('CertificateTypeAdmin_Create', 0, 'Создание типа сертификатов (админка)', NULL, 'N;', 0),
('CertificateTypeAdmin_Delete', 0, 'Удаление типа сертификатов (админка)', NULL, 'N;', 0),
('CertificateTypeAdmin_Manage', 0, 'Управление типами сертификатов (админка)', NULL, 'N;', 0),
('CertificateTypeAdmin_Update', 0, 'Редактирование типа сертификатов (админка)', NULL, 'N;', 0),
('CityAdmin_Create', 0, 'Добавление города (админка)', NULL, 'N;', 0),
('CityAdmin_Delete', 0, 'Удаление города (админка)', NULL, 'N;', 0),
('CityAdmin_Manage', 0, 'Управление городами (админка)', NULL, 'N;', 0),
('CityAdmin_Update', 0, 'Редактирование города (админка)', NULL, 'N;', 0),
('City_AutoComplete', 0, 'Автодополнение городов', NULL, 'N;', 1),
('CountryAdmin_Create', 0, 'Добавление страны (админка)', NULL, 'N;', 0),
('CountryAdmin_Delete', 0, 'Удаление страны (админка)', NULL, 'N;', 0),
('CountryAdmin_Manage', 0, 'Управление странами (админка)', NULL, 'N;', 0),
('CountryAdmin_Update', 0, 'Редактирование страны (админка)', NULL, 'N;', 0),
('Country_AutoComplete', 0, 'Автодополнение стран', NULL, 'N;', 1),
('DocumentAdmin_Create', 0, 'Добавление документа (админка)', NULL, 'N;', 0),
('DocumentAdmin_Delete', 0, 'Удаление документа (админка)', NULL, 'N;', 0),
('DocumentAdmin_Manage', 0, 'Управление документами (админка)', NULL, 'N;', 0),
('DocumentAdmin_Update', 0, 'Редактирование документа (админка)', NULL, 'N;', 0),
('DocumentAdmin_View', 0, 'Просмотр документа (админка)', NULL, 'N;', 0),
('DocumentFileAdmin_Create', 0, 'Добавление файла документа (админка)', NULL, 'N;', 0),
('DocumentFileAdmin_Delete', 0, 'Удаление файла документа (админка)', NULL, 'N;', 0),
('DocumentFileAdmin_Manage', 0, 'Управление файлами документов (админка)', NULL, 'N;', 0),
('DocumentFileAdmin_Update', 0, 'Редактирование файла документа (админка)', NULL, 'N;', 0),
('Document_Index', 0, 'Просмотр списка документов', NULL, 'N;', 1),
('Document_View', 0, 'Просмотр документа', NULL, 'N;', 1),
('FaqAdmin_Create', 0, 'Добавление вопроса (админка)', NULL, 'N;', 0),
('FaqAdmin_Delete', 0, 'Удаление вопроса (админка)', NULL, 'N;', 0),
('FaqAdmin_Manage', 0, 'Управление вопросами (админка)', NULL, 'N;', 0),
('FaqAdmin_Update', 0, 'Редактирование вопроса (админка)', NULL, 'N;', 0),
('FaqAdmin_View', 0, 'Просмотр вопроса (админка)', NULL, 'N;', 0),
('FaqSectionAdmin_Create', 0, 'Добавление раздела вопросов (админка)', NULL, 'N;', 0),
('FaqSectionAdmin_Delete', 0, 'Удаление раздела вопросов (админка)', NULL, 'N;', 0),
('FaqSectionAdmin_Manage', 0, 'Управление разделами вопросов (админка)', NULL, 'N;', 0),
('FaqSectionAdmin_Update', 0, 'Редактирование раздела вопросов (админка)', NULL, 'N;', 0),
('FaqSectionAdmin_View', 0, 'Просмотр раздела вопросов (админка)', NULL, 'N;', 0),
('FaqSection_Index', 0, 'Просмотр разделов вопросов', NULL, 'N;', 1),
('Faq_Create', 0, 'Добавление вопроса', NULL, 'N;', 1),
('Faq_Index', 0, 'Просмотр списка вопросов', NULL, 'N;', 1),
('FeedbackAdmin_Delete', 0, 'Удаление сообщений (админка)', NULL, 'N;', 0),
('FeedbackAdmin_Manage', 0, 'Управление сообщениями (админка)', NULL, 'N;', 0),
('FeedbackAdmin_View', 0, 'Просмотр сообщений (админка)', NULL, 'N;', 0),
('Feedback_Create', 0, 'Добавление сообщения', NULL, 'N;', 1),
('FileManagerAdmin_Delete', 0, 'Файловый менеджер:Удаление файла (админка)', NULL, 'N;', 0),
('FileManagerAdmin_ExistFiles', 0, 'Файловый менеджер:Загрузка существующих файлов (админка)', NULL, 'N;', 0),
('FileManagerAdmin_Manage', 0, 'Файловый менеджер:Управление файлами (админка)', NULL, 'N;', 0),
('FileManagerAdmin_SavePriority', 0, 'Файловый менеджер:Сортировка (админка)', NULL, 'N;', 0),
('FileManagerAdmin_UpdateAttr', 0, 'Файловый менеджер:Редактирование файла (админка)', NULL, 'N;', 0),
('FileManagerAdmin_Upload', 0, 'Файловый менеджер:Загрузка файлов (админка)', NULL, 'N;', 0),
('FileManager_DownloadFile', 0, 'Файловый менеджер:Скачать файл', NULL, 'N;', 1),
('guest', 2, 'Гость', '', 's:0:"";', 0),
('LanguageAdmin_Create', 0, 'Добавление языка (админка)', NULL, 'N;', 0),
('LanguageAdmin_Delete', 0, 'Удаление языка (админка)', NULL, 'N;', 0),
('LanguageAdmin_Manage', 0, 'Управление языками (админка)', NULL, 'N;', 0),
('LanguageAdmin_Update', 0, 'Редактирование языка (админка)', NULL, 'N;', 0),
('LogAdmin_View', 0, 'Просмотр логово (админка)', NULL, 'N;', 0),
('MailerFieldAdmin_Create', 0, 'Добавление генерируемого поля (админка)', NULL, 'N;', 0),
('MailerFieldAdmin_Delete', 0, 'Удаление генерируемого поля (админка)', NULL, 'N;', 0),
('MailerFieldAdmin_Manage', 0, 'Управление генерируемыми полями (админка)', NULL, 'N;', 0),
('MailerFieldAdmin_Update', 0, 'Редактирование генерируемого поля (админка)', NULL, 'N;', 0),
('MailerLetterAdmin_Create', 0, 'Cоздание рассылки (админка)', NULL, 'N;', 0),
('MailerLetterAdmin_Delete', 0, 'Удаление рассылки (админка)', NULL, 'N;', 0),
('MailerLetterAdmin_Manage', 0, 'Отчеты о рассылках (админка)', NULL, 'N;', 0),
('MailerLetterAdmin_Update', 0, 'Редактирование рассылки (админка)', NULL, 'N;', 0),
('MailerLetterAdmin_View', 0, 'Отчет об отправке (админка)', NULL, 'N;', 0),
('MailerRecipientAdmin_Manage', 0, 'Статистика получателей рассылки (админка)', NULL, 'N;', 0),
('MailerTemplateAdmin_Create', 0, 'Добавление шаблона рассылки (админка)', NULL, 'N;', 0),
('MailerTemplateAdmin_Delete', 0, 'Удаление шаблона рассылки (админка)', NULL, 'N;', 0),
('MailerTemplateAdmin_Manage', 0, 'Управление шаблонами рассылки (админка)', NULL, 'N;', 0),
('MailerTemplateAdmin_Update', 0, 'Редактирование шаблона рассылки (админка)', NULL, 'N;', 0),
('MailerTemplateAdmin_View', 0, 'Просмотр шаблона рассылки (админка)', NULL, 'N;', 0),
('Mailer_ConfirmReceipt', 0, 'Подтверждение получения письма', NULL, 'N;', 1),
('Mailer_SendMails', 0, 'Отправить письма', NULL, 'N;', 1),
('MainAdmin_AdminLinkProcess', 0, 'Переход по ссылке в админ панель (админка)', NULL, 'N;', 0),
('MainAdmin_ChangeOrder', 0, 'Сортировка (админка)', NULL, 'N;', 0),
('MainAdmin_Index', 0, 'Просмотр главной страницы (админка)', NULL, 'N;', 0),
('MainAdmin_Modules', 0, 'Просмотр списка модулей (админка)', NULL, 'N;', 0),
('MainAdmin_SessionLanguage', 0, 'Установка языка (админка)', NULL, 'N;', 0),
('MainAdmin_SessionPerPage', 0, 'Установки кол-ва элементов на странице (админка)', NULL, 'N;', 0),
('Main_Error', 0, 'Ошибка на странице', NULL, 'N;', 1),
('Main_Search', 0, 'Поиск по сайту', NULL, 'N;', 1),
('MenuAdmin_Create', 0, 'Добавление меню (админка)', NULL, 'N;', 0),
('MenuAdmin_Delete', 0, 'Удаление меню (админка)', NULL, 'N;', 0),
('MenuAdmin_Manage', 0, 'Управление меню (админка)', NULL, 'N;', 0),
('MenuAdmin_Update', 0, 'Редактирование меню (админка)', NULL, 'N;', 0),
('MenuLinkAdmin_AjaxFillTree', 0, 'Загрузка дерева ссылок (админка)', NULL, 'N;', 0),
('MenuLinkAdmin_Create', 0, 'Добавление ссылки меню (админка)', NULL, 'N;', 0),
('MenuLinkAdmin_Delete', 0, 'Удаление ссылки меню (админка)', NULL, 'N;', 0),
('MenuLinkAdmin_Index', 0, 'Управление ссылками меню (админка)', NULL, 'N;', 0),
('MenuLinkAdmin_Update', 0, 'Редактирование ссылки меню (админка)', NULL, 'N;', 0),
('MenuLinkAdmin_View', 0, 'Просмотр ссылки меню (админка)', NULL, 'N;', 0),
('moderator', 2, 'Модератор', '', 's:0:"";', 0),
('NewsAdmin_Create', 0, 'Добавление новости (админка)', NULL, 'N;', 0),
('NewsAdmin_Delete', 0, 'Удаление новости (админка)', NULL, 'N;', 0),
('NewsAdmin_Manage', 0, 'Управление новостями (админка)', NULL, 'N;', 0),
('NewsAdmin_Update', 0, 'Редактирование новости (админка)', NULL, 'N;', 0),
('NewsAdmin_View', 0, 'Просмотр новости (админка)', NULL, 'N;', 0),
('News_Index', 0, 'Список новостей', NULL, 'N;', 1),
('News_View', 0, 'Просмотр новости', NULL, 'N;', 1),
('OperationAdmin_AddAllOperations', 0, 'Добавление всех операций модулей (админка)', NULL, 'N;', 0),
('OperationAdmin_Create', 0, 'Добавление операции (админка)', NULL, 'N;', 0),
('OperationAdmin_Delete', 0, 'Удаление операции (админка)', NULL, 'N;', 0),
('OperationAdmin_GetModuleActions', 0, 'Получение операции модуля, JSON (админка)', NULL, 'N;', 0),
('OperationAdmin_GetModules', 0, 'Получение модулей, JSON (админка)', NULL, 'N;', 0),
('OperationAdmin_Manage', 0, 'Управление операциями (админка)', NULL, 'N;', 0),
('OperationAdmin_Update', 0, 'Редактирование операции (админка)', NULL, 'N;', 0),
('OperationAdmin_View', 0, 'Просмотр операции (админка)', NULL, 'N;', 0),
('PageAdmin_Create', 0, 'Добавление страницы (админка)', NULL, 'N;', 0),
('PageAdmin_Delete', 0, 'Удаление страницы (админка)', NULL, 'N;', 0),
('PageAdmin_GetJsonData', 0, 'Получение данных страницы (JSON) (админка)', NULL, 'N;', 0),
('PageAdmin_Manage', 0, 'Управление страницами (админка)', NULL, 'N;', 0),
('PageAdmin_Update', 0, 'Редактирование страницы (админка)', NULL, 'N;', 0),
('PageAdmin_View', 0, 'Просмотр страницы (админка)', NULL, 'N;', 0),
('PageBlockAdmin_Create', 0, 'Добавление контентного блока (админка)', NULL, 'N;', 0),
('PageBlockAdmin_Delete', 0, 'Удаление контентного блока (админка)', NULL, 'N;', 0),
('PageBlockAdmin_Manage', 0, 'Управление контентными блоками (админка)', NULL, 'N;', 0),
('PageBlockAdmin_Update', 0, 'Редактирование контентного блока (админка)', NULL, 'N;', 0),
('PageBlockAdmin_View', 0, 'Просмотр контентного блока (админка)', NULL, 'N;', 0),
('Page_Main', 0, 'Главная страница', NULL, 'N;', 1),
('Page_View', 0, 'Просмотр страницы', NULL, 'N;', 1),
('RoleAdmin_Assignment', 0, 'Назначение ролей (админка)', NULL, 'N;', 0),
('RoleAdmin_Create', 0, 'Добавление роли (админка)', NULL, 'N;', 0),
('RoleAdmin_Delete', 0, 'Удаление роли (админка)', NULL, 'N;', 0),
('RoleAdmin_Manage', 0, 'Управление ролями (админка)', NULL, 'N;', 0),
('RoleAdmin_Update', 0, 'Редактирование роли (админка)', NULL, 'N;', 0),
('RoleAdmin_View', 0, 'Просмотр роли (админка)', NULL, 'N;', 0),
('SettingAdmin_Manage', 0, 'Управление настройками (админка)', NULL, 'N;', 0),
('SettingAdmin_Update', 0, 'Редактирование настройки (админка)', NULL, 'N;', 0),
('SettingAdmin_View', 0, 'Просмотр настройки (админка)', NULL, 'N;', 0),
('SiteActionAdmin_Index', 0, 'Просмотр действий сайта (админка)', NULL, 'N;', 0),
('TaskAdmin_Allow', 0, 'Разрешение задачи для роли (админка)', NULL, 'N;', 0),
('TaskAdmin_Create', 0, 'Добавление задачи (админка)', NULL, 'N;', 0),
('TaskAdmin_Delete', 0, 'Удаление задачи (админка)', NULL, 'N;', 0),
('TaskAdmin_Deny', 0, 'Запрещение задачи для роли (админка)', NULL, 'N;', 0),
('TaskAdmin_Manage', 0, 'Управление задачами (админка)', NULL, 'N;', 0),
('TaskAdmin_RolesTasks', 0, 'Назначение задач для роли (админка)', NULL, 'N;', 0),
('TaskAdmin_Update', 0, 'Редактирование задачи (админка)', NULL, 'N;', 0),
('TaskAdmin_View', 0, 'Просмотр задачи (админка)', NULL, 'N;', 0),
('user', 2, 'Пользователь', '', 's:7:"s:0:"";";', 0),
('UserAdmin_Create', 0, 'Добавление пользователя (админка)', NULL, 'N;', 0),
('UserAdmin_Delete', 0, 'Удаление пользователя (админка)', NULL, 'N;', 0),
('UserAdmin_Login', 0, 'Авторизация (админка)', NULL, 's:9:"s:2:"N;";";', 1),
('UserAdmin_Manage', 0, 'Управление пользователями (админка)', NULL, 'N;', 0),
('UserAdmin_Update', 0, 'Редактирование пользователя (админка)', NULL, 'N;', 0),
('UserAdmin_View', 0, 'Просмотр пользователя (админка)', NULL, 'N;', 0),
('Users_Account', 1, 'Авторизация, регистрация, смена пароля', NULL, 's:0:"";', 1),
('User_ActivateAccount', 0, 'Активация аккаунта', NULL, 'N;', 0),
('User_ActivateAccountRequest', 0, 'Пользователи:Запрос на активацию аккаунта', NULL, 'N;', 0),
('User_ChangePassword', 0, 'Смена пароля', NULL, 'N;', 0),
('User_ChangePasswordRequest', 0, 'Запрос на смену пароля', NULL, 'N;', 0),
('User_Login', 0, 'Авторизация', NULL, 'N;', 1),
('User_Logout', 0, 'Выход', NULL, 'N;', 1),
('User_Registration', 0, 'Регистрация', NULL, 'N;', 0),
('YmarketBrandAdmin_Manage', 0, 'Бренды (админка)', NULL, 'N;', 0),
('YmarketCronAdmin_Manage', 0, 'Фоновые задания (админка)', NULL, 'N;', 0),
('YmarketCronAdmin_Update', 0, 'Редактирование фонового задания (админка)', NULL, 'N;', 0),
('YmarketIPAdmin_Create', 0, 'Добавление IP адреса яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketIPAdmin_Delete', 0, 'Удаление IP адреса яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketIPAdmin_Manage', 0, 'IP адреса яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketIPAdmin_Update', 0, 'Редактирование IP адреса яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketProductAdmin_Delete', 0, 'Удаление продукта Яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketProductAdmin_Manage', 0, 'Продукты Яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketProductAdmin_View', 0, 'Просмотр продукта Яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketSectionAdmin_Create', 0, 'Создание раздела яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketSectionAdmin_Delete', 0, 'Удаление раздела яндекс маркета? (админка)', NULL, 'N;', 0),
('YmarketSectionAdmin_Manage', 0, 'Разделы яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketSectionAdmin_Update', 0, 'Редактирование раздела яндекс маркета (админка)', NULL, 'N;', 0),
('YmarketSectionAdmin_View', 0, 'Просмотр раздела яндекс маркета (админка)', NULL, 'N;', 0),
('Review_Index', 0, NULL, NULL, 'N;', 1),
('Review_View', 0, NULL, NULL, 'N;', 1),
('Category_View', 0, NULL, NULL, 'N;', 1),
('Gallery_Index', 0, NULL, NULL, 'N;', 1),
('Gallery_View', 0, NULL, NULL, 'N;', 1),
('Category_Service', 0, '', NULL, 'N;', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_items_childs`
--

CREATE TABLE IF NOT EXISTS `auth_items_childs` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_items_childs`
--

INSERT INTO `auth_items_childs` (`parent`, `child`) VALUES
('Actions_Admin', 'ActionAdmin_Create'),
('Actions_Admin', 'ActionAdmin_Delete'),
('Actions_Admin', 'ActionAdmin_Manage'),
('Actions_Admin', 'ActionAdmin_Update'),
('Actions_Admin', 'ActionAdmin_View'),
('Actions_Admin', 'ActionFileAdmin_Create'),
('Actions_Admin', 'ActionFileAdmin_Delete'),
('Actions_Admin', 'ActionFileAdmin_Manage'),
('Admin_Cities_Countries', 'CityAdmin_Create'),
('Admin_Cities_Countries', 'CityAdmin_Delete'),
('Admin_Cities_Countries', 'CityAdmin_Manage'),
('Admin_Cities_Countries', 'CityAdmin_Update'),
('Admin_Cities_Countries', 'CountryAdmin_Create'),
('Admin_Cities_Countries', 'CountryAdmin_Delete'),
('Admin_Cities_Countries', 'CountryAdmin_Manage'),
('Admin_Cities_Countries', 'CountryAdmin_Update'),
('Admin_Content', 'MenuAdmin_Create'),
('Admin_Content', 'MenuAdmin_Delete'),
('Admin_Content', 'MenuAdmin_Manage'),
('Admin_Content', 'MenuAdmin_Update'),
('Admin_Content', 'MenuLinkAdmin_AjaxFillTree'),
('Admin_Content', 'MenuLinkAdmin_Create'),
('Admin_Content', 'MenuLinkAdmin_Delete'),
('Admin_Content', 'MenuLinkAdmin_Index'),
('Admin_Content', 'MenuLinkAdmin_Update'),
('Admin_Content', 'MenuLinkAdmin_View'),
('Admin_Content', 'PageAdmin_Create'),
('Admin_Content', 'PageAdmin_Delete'),
('Admin_Content', 'PageAdmin_Manage'),
('Admin_Content', 'PageAdmin_Update'),
('Admin_Content', 'PageAdmin_View'),
('Admin_Content', 'PageBlockAdmin_Create'),
('Admin_Content', 'PageBlockAdmin_Delete'),
('Admin_Content', 'PageBlockAdmin_Manage'),
('Admin_Content', 'PageBlockAdmin_Update'),
('Admin_Content', 'PageBlockAdmin_View'),
('Admin_Documents', 'DocumentAdmin_Create'),
('Admin_Documents', 'DocumentAdmin_Delete'),
('Admin_Documents', 'DocumentAdmin_Manage'),
('Admin_Documents', 'DocumentAdmin_Update'),
('Admin_Documents', 'DocumentAdmin_View'),
('Admin_Documents', 'DocumentFileAdmin_Create'),
('Admin_Documents', 'DocumentFileAdmin_Delete'),
('Admin_Documents', 'DocumentFileAdmin_Manage'),
('Admin_Documents', 'DocumentFileAdmin_Update'),
('Admin_Faq', 'FaqAdmin_Create'),
('Admin_Faq', 'FaqAdmin_Delete'),
('Admin_Faq', 'FaqAdmin_Manage'),
('Admin_Faq', 'FaqAdmin_Update'),
('Admin_Faq', 'FaqAdmin_View'),
('Admin_Faq', 'FaqSectionAdmin_Create'),
('Admin_Faq', 'FaqSectionAdmin_Delete'),
('Admin_Faq', 'FaqSectionAdmin_Manage'),
('Admin_Faq', 'FaqSectionAdmin_Update'),
('Admin_Faq', 'FaqSectionAdmin_View'),
('Admin_Feedback', 'FeedbackAdmin_Delete'),
('Admin_Feedback', 'FeedbackAdmin_Manage'),
('Admin_Feedback', 'FeedbackAdmin_View'),
('Admin_Languages', 'LanguageAdmin_Create'),
('Admin_Languages', 'LanguageAdmin_Delete'),
('Admin_Languages', 'LanguageAdmin_Manage'),
('Admin_Languages', 'LanguageAdmin_Update'),
('Admin_Main', 'LogAdmin_View'),
('Admin_Main', 'MainAdmin_ChangeOrder'),
('Admin_Main', 'MainAdmin_Index'),
('Admin_Main', 'MainAdmin_Modules'),
('Admin_Main', 'MainAdmin_SessionLanguage'),
('Admin_Main', 'MainAdmin_SessionPerPage'),
('Admin_Main', 'OperationAdmin_GetModules'),
('Admin_Main', 'SiteActionAdmin_Index'),
('Admin_News', 'NewsAdmin_Create'),
('Admin_News', 'NewsAdmin_Delete'),
('Admin_News', 'NewsAdmin_Manage'),
('Admin_News', 'NewsAdmin_Update'),
('Admin_News', 'NewsAdmin_View'),
('Admin_RBAC', 'OperationAdmin_AddAllOperations'),
('Admin_RBAC', 'OperationAdmin_Create'),
('Admin_RBAC', 'OperationAdmin_Delete'),
('Admin_RBAC', 'OperationAdmin_GetModuleActions'),
('Admin_RBAC', 'OperationAdmin_Manage'),
('Admin_RBAC', 'OperationAdmin_Update'),
('Admin_RBAC', 'OperationAdmin_View'),
('Admin_RBAC', 'RoleAdmin_Create'),
('Admin_RBAC', 'RoleAdmin_Delete'),
('Admin_RBAC', 'RoleAdmin_Manage'),
('Admin_RBAC', 'RoleAdmin_Update'),
('Admin_RBAC', 'RoleAdmin_View'),
('Admin_RBAC', 'TaskAdmin_Create'),
('Admin_RBAC', 'TaskAdmin_Delete'),
('Admin_RBAC', 'TaskAdmin_Manage'),
('Admin_RBAC', 'TaskAdmin_Update'),
('Admin_RBAC', 'TaskAdmin_View'),
('Admin_Settings', 'SettingAdmin_Manage'),
('Admin_Settings', 'SettingAdmin_Update'),
('Admin_Settings', 'SettingAdmin_View'),
('Admin_Users', 'UserAdmin_Create'),
('Admin_Users', 'UserAdmin_Delete'),
('Admin_Users', 'UserAdmin_Manage'),
('Admin_Users', 'UserAdmin_Update'),
('Admin_Users', 'UserAdmin_View'),
('Articles_Admin', 'ArticleAdmin_Create'),
('Articles_Admin', 'ArticleAdmin_Delete'),
('Articles_Admin', 'ArticleAdmin_Manage'),
('Articles_Admin', 'ArticleAdmin_Update'),
('Articles_Admin', 'ArticleAdmin_View'),
('Articles_Admin', 'ArticleSectionAdmin_Create'),
('Articles_Admin', 'ArticleSectionAdmin_Delete'),
('Articles_Admin', 'ArticleSectionAdmin_GetSectionInSidebar'),
('Articles_Admin', 'ArticleSectionAdmin_Manage'),
('Articles_Admin', 'ArticleSectionAdmin_Update'),
('Articles_Admin', 'ArticleSectionAdmin_View'),
('moderator', 'Actions_Admin'),
('moderator', 'Admin_Content'),
('moderator', 'Admin_Documents'),
('moderator', 'Admin_Faq'),
('moderator', 'Admin_Feedback'),
('moderator', 'Admin_Main'),
('moderator', 'Admin_News'),
('moderator', 'Articles_Admin'),
('Users_Account', 'UserAdmin_Login'),
('Users_Account', 'User_ActivateAccount'),
('Users_Account', 'User_ChangePassword'),
('Users_Account', 'User_ChangePasswordRequest'),
('Users_Account', 'User_Login'),
('Users_Account', 'User_Registration');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_objects`
--

CREATE TABLE IF NOT EXISTS `auth_objects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL COMMENT 'Объект',
  `model_id` varchar(50) NOT NULL COMMENT 'Модель',
  `role` varchar(64) NOT NULL COMMENT 'Роль',
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `auth_objects`
--


-- --------------------------------------------------------

--
-- Структура таблицы `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned DEFAULT NULL COMMENT 'Раздел сайта',
  `name` varchar(50) NOT NULL COMMENT 'Название',
  `image` varchar(37) NOT NULL COMMENT 'Изображение',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL-адрес',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Активен',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'Приоритет',
  `date_start` date DEFAULT NULL COMMENT 'Дата начала показа',
  `date_end` date DEFAULT NULL COMMENT 'Дата окончания показа',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `banners`
--


-- --------------------------------------------------------

--
-- Структура таблицы `banners_roles`
--

CREATE TABLE IF NOT EXISTS `banners_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) unsigned NOT NULL,
  `role` varchar(64) NOT NULL COMMENT 'Роль',
  PRIMARY KEY (`id`),
  KEY `banner_id` (`banner_id`),
  KEY `role` (`role`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Дамп данных таблицы `banners_roles`
--


-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL COMMENT 'Название',
  `depth` int(11) unsigned NOT NULL COMMENT 'Уровень',
  `lft` int(11) unsigned NOT NULL COMMENT 'lft',
  `rgt` int(11) unsigned NOT NULL COMMENT 'rgt',
  `date_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_published` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Опубликованна',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `text` text COMMENT 'Текст',
  `icon` varchar(255) DEFAULT NULL COMMENT 'Иконка',
  `back_left` varchar(250) DEFAULT NULL COMMENT 'Левое фоновое изображение',
  `back_center` varchar(250) DEFAULT NULL COMMENT 'Центральное фоновое изображение',
  `alias` varchar(250) DEFAULT NULL COMMENT 'Алиас',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Категория' AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `back_left`, `back_center`, `alias`) VALUES
(1, 'root', 1, 1, 22, '2011-12-15 00:23:58', 0, 1, NULL, NULL, NULL, NULL, NULL),
(2, 'Клининг', 2, 2, 7, '2011-12-17 01:02:26', 1, 0, '<p>Текст</p>\r\n<p>&nbsp;</p>\r\n<table style="border-image: initial; width: 600px; border: 1px solid #8f8e8e;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr style="height: 40px; background-color: #c2c2c2;">\r\n<td class="xl65" width="775" height="40">НАИМЕНОВАНИЕ   РАБОТ</td>\r\n<td class="xl66" style="text-align: center;" width="89">Ед. изм.</td>\r\n<td class="xl67" style="text-align: center;" width="89">Цена, руб.</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Мойка   окон</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">от 45</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Мойка фасадов</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">от 42</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Мойка окон   после стройки (послестрой)</td>\r\n<td class="xl73" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl74" style="text-align: center;">от 85</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'dbce70ee65dfc376d99789e6ab0bf988.jpg', NULL, NULL, 'cleaning'),
(3, 'Фасадные работы', 2, 8, 9, '2011-12-17 00:55:08', 1, 0, NULL, NULL, NULL, NULL, 'fasads'),
(4, 'Кровельные работы', 2, 10, 11, '2011-12-17 00:55:10', 1, 0, NULL, NULL, NULL, NULL, 'crovel'),
(5, 'Обслуживание мостов и гидросооружений', 2, 12, 13, '2011-12-17 00:55:12', 1, 0, NULL, NULL, NULL, NULL, 'hydro'),
(6, 'Оборудование, металло-конструкций', 2, 14, 15, '2011-12-17 00:55:14', 1, 0, NULL, NULL, NULL, NULL, 'media'),
(7, 'Свет, реклама, декор', 2, 16, 19, '2011-12-17 00:55:16', 1, 0, NULL, NULL, NULL, NULL, 'light'),
(8, 'Очистка от снега', 2, 20, 21, '2011-12-17 00:55:19', 1, 0, NULL, NULL, NULL, NULL, 'shnow'),
(9, 'Кат 8', 3, 17, 18, '2011-12-15 00:23:58', 1, 0, NULL, NULL, NULL, NULL, NULL),
(10, 'Кондиционеры', 2, 22, 23, '2011-12-17 00:55:26', 1, 0, NULL, NULL, NULL, NULL, 'condition'),
(11, 'Спил деревьев', 2, 24, 25, '2011-12-17 00:55:27', 1, 0, NULL, NULL, NULL, NULL, 'wood'),
(12, 'Частным заказчикам', 2, 26, 27, '2011-12-17 00:55:29', 1, 0, NULL, NULL, NULL, NULL, 'private'),
(13, 'Мойка окон', 3, 3, 4, '2011-12-16 17:46:30', 1, 0, '<p><strong>Мойка окон и мойка фасадов </strong>поможет привести облик любого здания в надлежащий вид. Жилые дома, складские или офисные помещения со штукатурной отделкой или торговые центры со сплошной облицовкой &ndash; любые фасады и остекленные поверхности нуждаются в регулярной очистке от накапливающейся грязи, пыли и городского смога. Своевременная мойка одновременно служит для профилактики постепенного разрушения здания.</p>\r\n<p>Для выполнения такого рода работ и привлекаются промышленные альпинисты. В крупных городах ответственность за поддержание внешнего вида здания ложится на собственника, и услуги по мойке фасадов и окон являются крайне востребованными.</p>\r\n<p>Нередки ситуации, когда конструкция здания такова, что не позволяет легко добраться до отдельных поверхностей фасада в силу особенностей архитектурных решений. В зависимости от труднодоступности очищаемой поверхности может быть применено непосредственно альпинистское снаряжение, или же будут использованы автовышки, туры или телескопические погрузчики.</p>\r\n<div>\r\n<p>&nbsp;</p>\r\n</div>\r\n<p>Специалисты ПромАльпГруппы &laquo;Вертик<em>А</em>льП&raquo;, руководствуясь наработанным опытом, подберут для Вас оптимальное решение по применяемым технологиям, согласуют график работ, обсудят детали. Мы гарантируем, что результат удовлетворит все Ваши ожидания!</p>\r\n<p><strong><em>Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.</em></strong></p>\r\n<p><strong><em>Выезд специалиста на объект (М, МО) для осмотра и составления сметы - </em></strong><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></p>\r\n<p><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n<p>&nbsp;</p>', '0909a3206b13b688d35542694cac43af.jpg', NULL, NULL, NULL),
(14, 'Мойка фасадов', 3, 5, 6, '2011-12-15 00:31:06', 1, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `certificates_groups`
--

CREATE TABLE IF NOT EXISTS `certificates_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Название',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Добавлена',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `certificates_groups`
--

INSERT INTO `certificates_groups` (`id`, `name`, `date_create`) VALUES
(5, 'Низкое напряжение', '2011-09-21 01:45:52'),
(6, 'Автоматизация зданий', '2011-09-21 01:45:52'),
(7, 'Электрооборудование для промышленных установок', '2011-09-21 01:45:52'),
(8, 'Электроустановочные изделия', '2011-09-21 01:45:52'),
(9, 'Кабеленесущие системы', '2011-09-21 01:45:52'),
(10, 'Приводная техника', '2011-09-21 01:45:52'),
(11, 'Сетевые фильтры и ИБП однофазные', '2011-09-21 01:45:52'),
(12, 'Промышленная автоматизация', '2011-09-21 01:45:52'),
(13, 'ИБП трехфазные и  инженерная инфраструктура', '2011-09-21 01:45:52');

-- --------------------------------------------------------

--
-- Структура таблицы `certificates_types`
--

CREATE TABLE IF NOT EXISTS `certificates_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Тип',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Добавлен',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `certificates_types`
--

INSERT INTO `certificates_types` (`id`, `name`, `date_create`) VALUES
(1, 'ГОСТ', '2011-09-21 01:45:58'),
(2, 'ПожБ', '2011-09-21 01:45:58'),
(3, 'Метр', '2011-09-21 01:45:58'),
(4, 'РТН', '2011-09-21 01:45:58'),
(5, 'АЭС', '2011-09-21 01:45:58'),
(6, 'РМРС', '2011-09-21 01:45:58'),
(7, 'РРР', '2011-09-21 01:45:58'),
(8, 'СЭЗ', '2011-09-21 01:45:58'),
(9, 'Минсвязь', '2011-09-21 01:45:58');

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(13, 'Волгоград'),
(6, 'Екатеринбург'),
(10, 'Казань'),
(20, 'Майями'),
(3, 'Москва'),
(7, 'Нижний Новгород'),
(5, 'Новосибирск'),
(9, 'Омск'),
(12, 'Ростов-на-Дону'),
(8, 'Самара'),
(4, 'Санкт-Петербург'),
(21, 'Симферополь'),
(11, 'Челябинск'),
(17, 'Ялта');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=352 ;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(3, 'Абхазия'),
(4, 'Австралия'),
(5, 'Австрия'),
(6, 'Азербайджан'),
(7, 'Албания'),
(8, 'Алжир'),
(220, 'Англия'),
(9, 'Ангола'),
(10, 'Ангуилья'),
(11, 'Андорра'),
(12, 'Антигуа и Барбуда'),
(13, 'Антильские о-ва'),
(14, 'Аргентина'),
(349, 'Арль-Авиньон'),
(15, 'Армения'),
(16, 'Арулько'),
(17, 'Афганистан'),
(342, 'Аяччо'),
(18, 'Багамские о-ва'),
(19, 'Бангладеш'),
(20, 'Барбадос'),
(346, 'Бастия'),
(21, 'Бахрейн'),
(23, 'Белиз'),
(22, 'Белоруссия'),
(24, 'Бельгия'),
(25, 'Бенин'),
(26, 'Бермуды'),
(27, 'Болгария'),
(28, 'Боливия'),
(334, 'Бордо'),
(258, 'Босния и Герцеговина'),
(29, 'Босния/Герцеговина'),
(30, 'Ботсвана'),
(31, 'Бразилия'),
(350, 'Брест'),
(32, 'Британские Виргинские о-ва'),
(33, 'Бруней'),
(340, 'Булонь'),
(34, 'Буркина Фасо'),
(302, 'Буркина-Фасо'),
(35, 'Бурунди'),
(36, 'Бутан'),
(336, 'Валансьен'),
(37, 'Валлис и Футуна о-ва'),
(38, 'Вануату'),
(39, 'Великобритания'),
(40, 'Венгрия'),
(41, 'Венесуэла'),
(42, 'Восточный Тимор'),
(43, 'Вьетнам'),
(44, 'Габон'),
(337, 'Гавр'),
(45, 'Гаити'),
(46, 'Гайана'),
(47, 'Гамбия'),
(48, 'Гана'),
(49, 'Гваделупа'),
(50, 'Гватемала'),
(51, 'Гвинея'),
(52, 'Гвинея-Бисау'),
(348, 'Генгам'),
(53, 'Германия'),
(54, 'Гернси о-в'),
(55, 'Гибралтар'),
(133, 'Голландия'),
(56, 'Гондурас'),
(57, 'Гонконг'),
(58, 'Гренада'),
(59, 'Гренландия'),
(339, 'Гренобль'),
(60, 'Греция'),
(61, 'Грузия'),
(62, 'Дания'),
(63, 'Джерси о-в'),
(64, 'Джибути'),
(65, 'Доминиканская республика'),
(307, 'ДР Конго'),
(66, 'Египет'),
(67, 'Замбия'),
(68, 'Западная Сахара'),
(69, 'Зимбабве'),
(70, 'Израиль'),
(71, 'Индия'),
(72, 'Индонезия'),
(73, 'Иордания'),
(74, 'Ирак'),
(75, 'Иран'),
(76, 'Ирландия'),
(77, 'Исландия'),
(78, 'Испания'),
(347, 'Истр'),
(79, 'Италия'),
(80, 'Йемен'),
(81, 'Кабо-Верде'),
(82, 'Казахстан'),
(83, 'Камбоджа'),
(84, 'Камерун'),
(321, 'Кан'),
(85, 'Канада'),
(86, 'Катар'),
(87, 'Кения'),
(88, 'Кипр'),
(310, 'Киргизия'),
(89, 'Кирибати'),
(90, 'Китай'),
(303, 'КНДР'),
(91, 'Колумбия'),
(92, 'Коморские о-ва'),
(315, 'Коморы'),
(312, 'Конго'),
(93, 'Конго (Brazzaville)'),
(94, 'Конго (Kinshasa)'),
(299, 'Корея'),
(95, 'Коста-Рика'),
(300, 'Кот д-Ивуар'),
(96, 'Кот-д''Ивуар'),
(97, 'Куба'),
(98, 'Кувейт'),
(99, 'Кука о-ва'),
(100, 'Кыргызстан'),
(327, 'Ланс'),
(101, 'Лаос'),
(102, 'Латвия'),
(332, 'Ле Ман'),
(103, 'Лесото'),
(104, 'Либерия'),
(105, 'Ливан'),
(106, 'Ливия'),
(333, 'Лилль'),
(320, 'Лион'),
(107, 'Литва'),
(108, 'Лихтенштейн'),
(329, 'Лорьян'),
(109, 'Люксембург'),
(110, 'Маврикий'),
(111, 'Мавритания'),
(112, 'Мадагаскар'),
(113, 'Македония'),
(114, 'Малави'),
(115, 'Малайзия'),
(116, 'Мали'),
(117, 'Мальдивские о-ва'),
(118, 'Мальта'),
(125, 'Марокко'),
(326, 'Марсель'),
(316, 'Мартиника'),
(119, 'Мартиника о-в'),
(120, 'Мексика'),
(330, 'Мец'),
(121, 'Мозамбик'),
(295, 'Молдавия'),
(122, 'Молдова'),
(123, 'Монако'),
(124, 'Монголия'),
(341, 'Монпелье'),
(351, 'Москва'),
(309, 'Мьянма'),
(126, 'Мьянма (Бирма)'),
(127, 'Мэн о-в'),
(128, 'Намибия'),
(319, 'Нанси'),
(338, 'Нант'),
(129, 'Науру'),
(130, 'Непал'),
(131, 'Нигер'),
(132, 'Нигерия'),
(313, 'Нидерландские Антилы'),
(134, 'Никарагуа'),
(325, 'Ницца'),
(135, 'Новая Зеландия'),
(306, 'Новая Каледония'),
(136, 'Новая Каледония о-в'),
(137, 'Норвегия'),
(138, 'Норфолк о-в'),
(139, 'О.А.Э.'),
(301, 'ОАЭ'),
(140, 'Оман'),
(328, 'Осер'),
(141, 'Пакистан'),
(142, 'Панама'),
(143, 'Папуа Новая Гвинея'),
(144, 'Парагвай'),
(335, 'Пари Сен-Жермен'),
(145, 'Перу'),
(146, 'Питкэрн о-в'),
(147, 'Польша'),
(148, 'Португалия'),
(149, 'Пуэрто Рико'),
(322, 'Ренн'),
(150, 'Реюньон'),
(1, 'Россия'),
(151, 'Руанда'),
(152, 'Румыния'),
(154, 'Сальвадор'),
(155, 'Самоа'),
(156, 'Сан-Марино'),
(157, 'Сан-Томе и Принсипи'),
(158, 'Саудовская Аравия'),
(159, 'Свазиленд'),
(160, 'Святая Люсия'),
(161, 'Святой Елены о-в'),
(296, 'Северная Ирландия'),
(162, 'Северная Корея'),
(344, 'Седан'),
(163, 'Сейшеллы'),
(317, 'Сейшелы'),
(164, 'Сен-Пьер и Микелон'),
(165, 'Сенегал'),
(166, 'Сент Китс и Невис'),
(167, 'Сент-Винсент и Гренадины'),
(318, 'Сент-Этьен'),
(168, 'Сербия'),
(305, 'Сербия и Черногория'),
(169, 'Сингапур'),
(170, 'Сирия'),
(171, 'Словакия'),
(172, 'Словения'),
(173, 'Соломоновы о-ва'),
(174, 'Сомали'),
(331, 'Сошо'),
(323, 'Страсбур'),
(175, 'Судан'),
(176, 'Суринам'),
(153, 'США'),
(177, 'Сьерра-Леоне'),
(178, 'Таджикистан'),
(180, 'Таиланд'),
(179, 'Тайвань'),
(181, 'Танзания'),
(182, 'Того'),
(183, 'Токелау о-ва'),
(184, 'Тонга'),
(185, 'Тринидад и Тобаго'),
(343, 'Труа'),
(186, 'Тувалу'),
(324, 'Тулуза'),
(187, 'Тунис'),
(345, 'Тур'),
(188, 'Туркменистан'),
(308, 'Туркмения'),
(189, 'Туркс и Кейкос'),
(190, 'Турция'),
(191, 'Уганда'),
(192, 'Узбекистан'),
(2, 'Украина'),
(193, 'Уругвай'),
(298, 'Уэльс'),
(194, 'Фарерские о-ва'),
(294, 'Фарерские острова'),
(195, 'Фиджи'),
(196, 'Филиппины'),
(197, 'Финляндия'),
(198, 'Франция'),
(199, 'Французская Гвинея'),
(200, 'Французская Полинезия'),
(201, 'Хорватия'),
(314, 'Центрально-Африканская Республика'),
(202, 'Чад'),
(203, 'Черногория'),
(204, 'Чехия'),
(304, 'Чехословакия'),
(205, 'Чили'),
(206, 'Швейцария'),
(207, 'Швеция'),
(297, 'Шотландия'),
(208, 'Шри-Ланка'),
(209, 'Эквадор'),
(210, 'Экваториальная Гвинея'),
(211, 'Эритрея'),
(212, 'Эстония'),
(213, 'Эфиопия'),
(214, 'ЮАР'),
(311, 'Югославия'),
(215, 'Южная Корея'),
(216, 'Южная Осетия'),
(217, 'Ямайка'),
(218, 'Япония');

-- --------------------------------------------------------

--
-- Структура таблицы `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `name` varchar(500) NOT NULL COMMENT 'Наименование',
  `desc` text NOT NULL COMMENT 'Описание',
  `is_published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Опубликовано',
  `date_publish` date NOT NULL COMMENT 'Дата публикации',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `documents`
--


-- --------------------------------------------------------

--
-- Структура таблицы `documents_files`
--

CREATE TABLE IF NOT EXISTS `documents_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(11) unsigned NOT NULL COMMENT 'Документ',
  `title` varchar(250) NOT NULL COMMENT 'Заголовок',
  `file` varchar(50) NOT NULL COMMENT 'Файл',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Добавлен',
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `documents_files`
--


-- --------------------------------------------------------

--
-- Структура таблицы `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `first_name` varchar(40) NOT NULL COMMENT 'Имя',
  `last_name` varchar(40) DEFAULT NULL COMMENT 'Фамилия',
  `patronymic` varchar(40) DEFAULT NULL COMMENT 'Отчество',
  `company` varchar(80) DEFAULT NULL COMMENT 'Компания',
  `position` varchar(50) DEFAULT NULL COMMENT 'Должность',
  `phone` varchar(50) DEFAULT NULL COMMENT 'Телефон',
  `email` varchar(80) NOT NULL COMMENT 'Email',
  `section_id` int(11) NOT NULL COMMENT 'Раздел',
  `question` longtext NOT NULL COMMENT 'Вопрос',
  `answer` longtext COMMENT 'Ответ',
  `is_published` int(1) NOT NULL DEFAULT '0' COMMENT 'Опубликовано',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Добалено',
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `date` (`date_create`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `faq`
--


-- --------------------------------------------------------

--
-- Структура таблицы `faq_sections`
--

CREATE TABLE IF NOT EXISTS `faq_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `name` varchar(200) NOT NULL COMMENT 'Название',
  `is_published` int(1) NOT NULL DEFAULT '0' COMMENT 'Опубликован',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `faq_sections`
--


-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL COMMENT 'Имя',
  `last_name` varchar(40) DEFAULT NULL COMMENT 'Фамилия',
  `patronymic` varchar(40) DEFAULT NULL COMMENT 'Отчество',
  `company` varchar(80) DEFAULT NULL COMMENT 'Компания',
  `position` varchar(40) DEFAULT NULL COMMENT 'Должность',
  `phone` varchar(50) DEFAULT NULL COMMENT 'Телефон',
  `email` varchar(80) NOT NULL COMMENT 'Email',
  `comment` varchar(1000) NOT NULL COMMENT 'Комментарий',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Создано',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `first_name`, `last_name`, `patronymic`, `company`, `position`, `phone`, `email`, `comment`, `date_create`) VALUES
(1, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:13:31'),
(2, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:15:47'),
(3, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:15:55'),
(4, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:16:39'),
(5, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:17:02'),
(6, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:21:32'),
(7, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:22:39'),
(8, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:23:13'),
(9, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:23:34'),
(10, 'dawdawd', 'dawda', 'awdaw', 'dawdawd', 'awdawd', '+7-903-5492969', 'dwad@mail.ru', 'awd', '2011-09-11 23:25:31'),
(11, 'вфцв', 'вфцв', 'фцвфцв', 'фцвфцв', 'фцвфцвф', '+7-903-5492969', 'ada@mail.ru', 'dadaw', '2011-09-13 01:06:53'),
(12, 'wadaw', 'dawd', 'dwad', 'awdawd', 'dawddawdaw', '+7-903-5492969', 'dadwa@mail.ru', 'dawd', '2011-09-16 14:24:02'),
(13, 'dawdwa', 'dwad', 'dwad', 'dwad', 'dwadawd', '+7-903-5492969', 'dawd@mail.ru', 'dawda', '2011-09-16 14:41:54'),
(14, 'awdaw', 'dawd', 'dwd', 'dwad', 'dwadaw', '+7-903-5492969', 'dawdw@mail.ru', 'dawd', '2011-09-16 15:04:23'),
(15, 'adwa', 'dawdw', 'dwad', 'awdaw', 'dawd', '+7-903-5492969', 'awda@mail.ru', 'dawddawd', '2011-09-16 15:05:06'),
(16, 'awdwad', 'wwd', 'fawddawdaw', 'dawd', 'awdawd', '+7-903-5492969', 'awdawd@mail.ru', 'dwadaw', '2011-09-16 15:05:47');

-- --------------------------------------------------------

--
-- Структура таблицы `file_manager`
--

CREATE TABLE IF NOT EXISTS `file_manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` varchar(100) DEFAULT NULL COMMENT 'ID объекта',
  `model_id` varchar(100) DEFAULT NULL COMMENT 'Модель',
  `name` varchar(100) NOT NULL COMMENT 'Файл',
  `tag` varchar(100) DEFAULT NULL COMMENT 'Тег',
  `title` text COMMENT 'Название',
  `descr` text COMMENT 'Описание',
  `order` int(11) unsigned NOT NULL COMMENT 'Порядок',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Дамп данных таблицы `file_manager`
--

INSERT INTO `file_manager` (`id`, `object_id`, `model_id`, `name`, `tag`, `title`, `descr`, `order`) VALUES
(1, '13', 'News', 'e607ea11303b1ae216ce8410fb3d680f.jpg', 'files', 'DSCN2060(www.CoolWallpapers.org)-1280x10242.JPG', NULL, 1),
(2, '13', 'News', '88364aee8a6ef951dcfadcdbe576e550.png', 'files', 'GNOME-210SimpleAndElegant_1280x1024.png', NULL, 2),
(3, '13', 'News', 'a627f1aa47a9cd775c348578fc23da58.png', 'files', 'wallpaper-linux-cli-commands-1280-1024.png', NULL, 3),
(4, '13', 'News', 'b874601073fbc29c0ca0459d2ee7f7c8.jpg', 'files', 'OTHER-SmolovSummer2004_1024x768.jpg', NULL, 4),
(5, '13', 'News', '3c664f65c64426ff95f413f48e12088d.jpg', 'files', 'ubuntualien.jpg', NULL, 5),
(6, '13', 'News', 'b1d756441e6eae30632e1dc172041a8b.jpg', 'files', 'NATURE-AtTheEdgeOfAtmosphere_1024x768.jpg', NULL, 6),
(7, '13', 'News', '8b45f94c61220ccf25b4c666b11a1b6b.jpg', 'files', 'DSCN2060(www.CoolWallpapers.org)-1280x10242.JPG', NULL, 7),
(8, '13', 'News', '015e557b48ef1f20368f67dfd8fe3706.png', 'files', 'GNOME-210SimpleAndElegant_1280x1024.png', NULL, 8),
(9, '13', 'News', 'a91446c6617815267c8975043708464b.jpg', 'files', 'ski-resort-bad-hofgastein-1280x1024.jpg', NULL, 9),
(10, '13', 'News', '1995e2446badb63bba8e92978d400d37.jpg', 'files', 'DSCN2060(www.CoolWallpapers.org)-1280x1024.JPG', NULL, 10),
(11, '13', 'News', '61edbd42e55b69480b783b7054d370f5.jpg', 'files', 'awp05_alltolls_blogspot098-1280x1024.jpg', NULL, 11),
(17, '1', 'Review', '3f8f5ce89fd13624a4823669fba8f672.jpg', 'any', NULL, NULL, 3),
(16, '1', 'Review', '736721604351d382b202913dae295e05.jpg', 'any', NULL, NULL, 2),
(15, '1', 'Review', '59d19ee7299cbcea43a419cfe6fed313.jpg', 'any', NULL, NULL, 1),
(18, '1', 'Review', 'a149aa9d801afb276df43843d09f53ff.jpg', 'any', NULL, NULL, 4),
(19, '1', 'Review', '839a879663a300d241031faa5ce42a82.jpg', 'any', NULL, NULL, 5),
(20, '1', 'Review', '186a8a51b2ff5c03cf75e0f72447cf80.jpg', 'any', NULL, NULL, 6),
(21, '1', 'Review', 'f94e9b35348fd04650f21fac3c18cec2.jpg', 'any', NULL, NULL, 7),
(22, '1', 'Review', '8e48e55bc9ec69bce46da35fe8af7bd5.jpg', 'any', NULL, NULL, 8),
(23, '1', 'Review', '2c39bb0419f25571b844a1b40a948d99.jpg', 'any', NULL, NULL, 9),
(24, 'tmp_19', 'Review', '3e375b7b239ccbf487fbaa03eba1d8e9.jpg', 'any', NULL, NULL, 1),
(25, 'tmp_19', 'Review', 'ee49ff4cdbcb0abd136658085dbcb8cf.jpg', 'any', NULL, NULL, 2),
(26, 'tmp_19', 'Review', '5925c9459a43ad22447c260776a7d7bb.jpg', 'any', NULL, NULL, 3),
(27, 'tmp_19', 'Review', 'b6cfdcdb3485db395e2a4a905e413cb9.jpg', 'any', NULL, NULL, 4),
(28, 'tmp_19', 'Review', '4c5180d84f6f7e296f2c75deed3554f5.jpg', 'any', NULL, NULL, 5),
(29, 'tmp_19', 'Review', '87ae7074b28a86f9b29dcbde42702c5d.jpg', 'any', NULL, NULL, 6),
(39, '1', 'Review', '21da5f6826901e1f6883bb8c07f98d8e.jpg', 'files', NULL, NULL, 10),
(40, '1', 'Review', '7c1fded3324509ca8e057f3aaeb2866d.jpg', 'files', NULL, NULL, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Название',
  `is_published` tinyint(1) NOT NULL COMMENT 'Опубликована',
  `order` int(11) NOT NULL COMMENT 'Сортировка',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `is_published`, `order`) VALUES
(1, 'Земляной Вал', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` char(2) NOT NULL COMMENT 'ID',
  `name` varchar(15) NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
('en', 'english'),
('ru', 'русский');

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) DEFAULT NULL COMMENT 'Тип',
  `category` varchar(128) DEFAULT NULL COMMENT 'Категория',
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время',
  `message` text COMMENT 'Сообщение',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `log`
--


-- --------------------------------------------------------

--
-- Структура таблицы `mailer_fields`
--

CREATE TABLE IF NOT EXISTS `mailer_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT 'Код ',
  `name` varchar(200) NOT NULL COMMENT 'Наименование',
  `value` varchar(250) NOT NULL COMMENT 'Значение',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `mailer_fields`
--

INSERT INTO `mailer_fields` (`id`, `code`, `name`, `value`) VALUES
(1, '{FIRST_NAME}', 'Имя', '$user->first_name'),
(2, '{LAST_NAME}', 'Фамилия', '$user->last_name'),
(3, '{PATRONYMIC}', 'Отчество', '$user->patronymic'),
(5, '{DATE}', 'Текущая дата', 'date(''d.m.Y'')'),
(6, '{ROLE}', 'Наименование группы к которой принадлежит пользователь', '$user->role->description'),
(7, '{APPEAL}', 'Обращение к пользователю', '$user->gender == User::GENDER_MAN ? ''Уважаемый'' : ''Уважаемая'''),
(9, '{SITE_NAME}', 'Название сайта', 'yii_cms'),
(10, '{ACTIVATE_ACCOUNT_URL}', 'URL ссылки активации аккаунта', '$user->activateAccountUrl();');

-- --------------------------------------------------------

--
-- Структура таблицы `mailer_letters`
--

CREATE TABLE IF NOT EXISTS `mailer_letters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned DEFAULT NULL COMMENT 'Шаблон',
  `subject` varchar(150) NOT NULL COMMENT 'Тема письма',
  `text` text NOT NULL COMMENT 'Текст письма',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата отправки',
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `mailer_letters`
--

INSERT INTO `mailer_letters` (`id`, `template_id`, `subject`, `text`, `date_create`) VALUES
(5, NULL, 'Письмо с тегами {SITE_NAME}', '{SITE_NAME}  !<br /><br />{APPEAL}  {FIRST_NAME}&nbsp;  {LAST_NAME}  &nbsp;{PATRONYMIC}  .<br /><br />{DATE}&nbsp;  - {ROLE}  <br />Yo  ', '2011-09-30 19:18:22');

-- --------------------------------------------------------

--
-- Структура таблицы `mailer_recipients`
--

CREATE TABLE IF NOT EXISTS `mailer_recipients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `letter_id` int(11) unsigned NOT NULL COMMENT 'Рассылка',
  `user_id` int(11) unsigned NOT NULL COMMENT 'Пользователь',
  `status` enum('accepted','fail','waiting','sent') DEFAULT 'waiting' COMMENT 'Статус',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата отправки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `letter_id_2` (`letter_id`,`user_id`),
  KEY `letter_id` (`letter_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `mailer_recipients`
--

INSERT INTO `mailer_recipients` (`id`, `letter_id`, `user_id`, `status`, `date_create`) VALUES
(9, 5, 17, 'sent', '2011-09-30 19:18:22'),
(10, 5, 18, 'sent', '2011-09-30 19:18:22');

-- --------------------------------------------------------

--
-- Структура таблицы `mailer_templates`
--

CREATE TABLE IF NOT EXISTS `mailer_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL COMMENT 'Название',
  `subject` varchar(150) NOT NULL COMMENT 'Тема письма',
  `text` text NOT NULL COMMENT 'Текст письма',
  `is_basic` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Основной',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Создан',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `mailer_templates`
--


-- --------------------------------------------------------

--
-- Структура таблицы `mailer_templates_recipients`
--

CREATE TABLE IF NOT EXISTS `mailer_templates_recipients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_id_2` (`template_id`,`user_id`),
  KEY `template_id` (`template_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `mailer_templates_recipients`
--


-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Название',
  `is_visible` tinyint(1) NOT NULL COMMENT 'Отображать',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `name`, `is_visible`) VALUES
(6, 'Верхнее меню', 1),
(7, 'Нижнее меню', 1),
(8, 'Боковое меню', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT 'Родитель',
  `page_id` int(11) unsigned DEFAULT NULL COMMENT 'Привязка к странице',
  `menu_id` int(11) unsigned NOT NULL COMMENT 'Меню',
  `title` varchar(50) NOT NULL COMMENT 'Заголовок',
  `url` varchar(200) NOT NULL COMMENT 'Адрес',
  `user_role` varchar(64) DEFAULT NULL COMMENT 'Только для',
  `not_user_role` varchar(64) DEFAULT NULL COMMENT 'Для всех кроме',
  `order` int(11) NOT NULL COMMENT 'Порядок',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Отображать',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `menu_id` (`menu_id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_role` (`user_role`),
  KEY `not_user_role` (`not_user_role`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп данных таблицы `menu_links`
--

INSERT INTO `menu_links` (`id`, `lang`, `parent_id`, `page_id`, `menu_id`, `title`, `url`, `user_role`, `not_user_role`, `order`, `is_visible`) VALUES
(1, 'ru', NULL, 1, 6, 'Главная', '/', NULL, NULL, 1, 1),
(2, 'ru', NULL, 2, 6, 'О нас', 'about_usss', NULL, NULL, 2, 1),
(3, 'ru', NULL, NULL, 6, 'Обратная связь', 'feedback', NULL, NULL, 3, 1),
(4, 'ru', NULL, NULL, 6, 'Войти', 'login', 'guest', NULL, 4, 1),
(6, 'ru', NULL, NULL, 6, 'Выйти', 'logout', NULL, 'guest', 6, 1),
(13, 'ru', NULL, NULL, 6, 'Регистрация', 'registration', 'guest', NULL, 7, 1),
(14, 'ru', NULL, 18, 7, 'Услуги', '', NULL, NULL, 1, 1),
(15, 'ru', NULL, 19, 7, 'Цены', '', NULL, NULL, 2, 1),
(16, 'ru', NULL, 2, 7, 'О нас', '', NULL, NULL, 3, 1),
(17, 'ru', NULL, 1, 8, 'Главная страница', '', NULL, NULL, 1, 1),
(18, 'ru', NULL, 21, 8, 'Сотрудничество', '', NULL, NULL, 2, 1),
(19, 'ru', NULL, NULL, 8, 'Отзывы', 'reviews', NULL, NULL, 3, 1),
(20, 'ru', NULL, NULL, 8, 'Фото', 'photo', NULL, NULL, 4, 1),
(21, 'ru', NULL, 19, 8, 'Цены', '', NULL, NULL, 5, 1),
(22, 'ru', NULL, 20, 8, 'Контакты', '', NULL, NULL, 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `meta_tags`
--

CREATE TABLE IF NOT EXISTS `meta_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned DEFAULT NULL COMMENT 'ID объекта',
  `model_id` varchar(50) NOT NULL COMMENT 'Модель',
  `title` varchar(300) DEFAULT NULL COMMENT 'Заголовок',
  `keywords` varchar(300) DEFAULT NULL COMMENT 'Ключевые слова',
  `description` varchar(300) DEFAULT NULL COMMENT 'Описание',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Создано',
  `date_update` datetime DEFAULT NULL COMMENT 'Отредактирован',
  PRIMARY KEY (`id`),
  UNIQUE KEY `object_id` (`object_id`,`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `object_id`, `model_id`, `title`, `keywords`, `description`, `date_create`, `date_update`) VALUES
(5, 2, 'Page', '111', '3333', '222', '2011-10-19 17:25:04', NULL),
(7, 1, 'Page', 'www', 'rtyrtyry', 'trfyhr', '2011-10-19 17:25:29', NULL),
(8, 3, 'News', 'zzzz', 'keyww', 'oppp', '2011-10-20 13:10:13', '2011-10-20 13:12:40');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `user_id` int(11) unsigned NOT NULL COMMENT 'Автор',
  `title` varchar(250) NOT NULL COMMENT 'Заголовок',
  `text` longtext NOT NULL COMMENT 'Текст',
  `photo` varchar(50) DEFAULT NULL COMMENT 'Фото',
  `state` enum('active','hidden') NOT NULL COMMENT 'Состояние',
  `date` date NOT NULL COMMENT 'Дата',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Создана',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `lang`, `user_id`, `title`, `text`, `photo`, `state`, `date`, `date_create`) VALUES
(1, 'ru', 1, 'IdeaPad Y570: мощный ноутбук по разумной цене', '<p>В блоге компании Lenovo на Хабре мы уделяем наибольшее внимание серии ThinkPad, что вполне логично &ndash; судя по отзывам, большинству из вас по нраву как раз эти модели, созданные для работы и творчества, крепкие и строгие внешне. Но сегодня у нас обзор модели IdeaPad Y570, яркого представителя &laquo;пользовательской&raquo; серии ноутбуков Lenovo, весьма отличающейся от унаследованных у IBM бизнес-моделей. Обойти вниманием такой ноутбук сложно: при стоимости от 30 тысяч рублей он предоставляет в ваше распоряжение одну из самых мощных видеокарт, современный процессор Intel Core, а также невероятно быструю дисковую систему. Гибрид из емкого жесткого диска и быстрого SSD именно в &laquo;пятьсот семидесятом&raquo; стал штатным: им оснащается большинство модификаций ноутбука. В этом обзоре я расскажу о том, чем хороша загрузка за 15 секунд, какие изменения произошли в новой модели Y-серии, а также о том, почему стоит выбрать именно эту модель в качестве домашнего развлекательного центра.</p>', '80f3dfc8fb0c6fe5c33950e89eed32cf.jpeg', 'active', '2006-04-24', '0000-00-00 00:00:00'),
(2, 'ru', 1, 'Твиттер запустит инструмент для веб-аналитики', '<p>Сколько трафика ваш сайт получает из Твиттера? Дать ответ на этот вопрос позволит анонсированный Твиттером инструмент для веб-аналитики под названием Twitter Web Analytics.<br /><br />Новый инструмент призван дать владельцам сайтов больше данных об эффективности их интеграции с Твиттером. Он основан на технологиях компании BackType, которая занимается социальной аналитикой и которую Твиттер купил в июне.<br /><a></a><br />Как <a href="https://dev.twitter.com/blog/introducing-twitter-web-analytics">пояснил</a> основатель BackType и новый сотрудник Твиттера Кристофер Голда, Twitter Web Analytics поможет владельцам сайтов понимать три ключевых момента: сколько их контента распространяется в Твиттере, сколько трафика их сайт получает из Твиттера, и насколько эффективны кнопки Твиттера.<br /><br />Как видно на скриншоте, панель аналитики состоит из четырёх вкладок. Первая, &laquo;трафик&raquo;, отображает число твитов со ссылками на сайт и количество кликов по этим ссылкам. Графики доступны для текущего дня, прошлой недели и прошлого месяца. Вкладка &laquo;твиты&raquo; показывает все твиты, содержащие ссылки на сайт, а также все твиты, отправленные из встроенных кнопок Твиттера на сайте. Администратор может ретвитить и отвечать на твиты из этой панели. Вкладка &laquo;кнопка Твиттера&raquo; показывает, насколько активно используются кнопки Твиттера на сайте, а вкладка &laquo;контент&raquo; показывает наиболее эффективные страницы сайта.<br /><br />По словам директора Твиттера по развитию веб-бизнеса Эйприл Андервуд, данные будут очищены от ботов и спама. Твиттер также выпустит API инструмента для разработчиков.<br /><br />Twitter Web Analytics бесплатен и пока что в бета-версии. Небольшая группа партнёров получит к нему доступ на этой неделе, а для всех он будет запущен в течение нескольких недель.</p>', 'be8a93e588f5469ee426a77a66e2444a.png', 'active', '2011-09-05', '0000-00-00 00:00:00'),
(3, 'ru', 1, 'Microsoft выпустил Windows 8 Developer Preview', '<p>Разумеется, это не готовый продукт, поэтому будьте готовы к ошибкам, постоянным обновлениям и несовместимости программ. В общем, действуйте на свой риск.<br /><br />Если хотите получить некоторое представление о Windows 8 перед установкой, посмотрите скриншоты под катом.<br /><a></a>Разумеется, это не готовый продукт, поэтому будьте готовы к ошибкам, постоянным обновлениям и несовместимости программ. В общем, действуйте на свой риск.<br /><br />Если хотите получить некоторое представление о Windows 8 перед установкой, посмотрите скриншоты под катом.<br /><a></a><br />На конференции Microsoft продемонстрировал много устройств на Windo<strong>ws 8, в том числе планшетов:zz</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Разумеется, это не готовый продукт, поэтому будьте готовы к ошибкам, постоянным обновлениям и несовместимости программ. В общем, действуйте на свой риск.<br /><br />Если хотите получить некоторое представление о Windows 8 перед установкой, посмотрите скриншоты под катом.<br /><a></a><br />На конференции Microsoft продемонстрировал много устройств на Windo<strong>ws 8, в том числе планшетов:zz</strong></strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong><strong>Разумеется, это не готовый продукт, поэтому будьте готовы к ошибкам, постоянным обновлениям и несовместимости программ. В общем, действуйте на свой риск.<br /><br />Если хотите получить некоторое представление о Windows 8 перед установкой, посмотрите скриншоты под катом.<br /><a></a><br />На конференции Microsoft продемонстрировал много устройств на Windo<strong>ws 8, в том числе планшетов:zz</strong><br /></strong></strong></p>\r\n<p>На конференции Microsoft продемонстрировал много устройств на Windo<strong>ws 8, в том числе планшетов:zz</strong></p>', '328a76e70961ee6f64165f802d281e09.jpg', 'active', '2011-09-14', '0000-00-00 00:00:00'),
(4, 'en', 1, 'Intel brandishes first Google Android tablet', '<p>SAN FRANCISCO--Intel hauled out its first\r\n<a href="http://www.cnet.com/android-atlas/">Android</a>\r\n<a href="http://reviews.cnet.com/tablets/">tablet</a>\r\n running on "Medfield," an upcoming Atom chip for smartphones and \r\ntablets, while two executives also chatted with CNET about their \r\nrelationship with Google, all at Intel''s developer conference today. </p>\r\n<p>The Medfield Atom chip is one of Intel''s most power-efficient chip \r\ndesigns--a strict requirement for tablets and smartphones. It contains a\r\n single processing core--as opposed to more power-hungry dual-core Atom \r\nchips used in Netbooks--and will be available in devices in the first \r\nhalf of 2012. </p>\r\n<p>The tablet that Intel showed today (see photo below) is a so-called \r\nreference design that the company will supply to tablet makers that \r\nwould use it as a template for their own product. </p>\r\n<p>Importantly, Intel-based tablets and smartphones will be targeted at \r\nGoogle''s Android software, not Intel''s internal MeeGo operating system. \r\nThe latter has been relegated to automotive and industrial applications \r\nmostly and is no longer seen as a promising operating system for \r\nconsumer devices. To drive this point home, Intel reaffirmed its \r\nrelationship with Google today. </p>\r\n<p>CNET sat down briefly with two Intel phone executives to talk about \r\nthe relationship. The reaffirmation of the relationship is about \r\n"optimizing Intel for the Android platform for phone and for tablets," \r\nsaid Mike Bell, co-general manager of the phone division. "So, as a \r\n[device maker] you''ll be able to go out and build a device with the full\r\n blessing and backing of Intel and Google," he said. </p>\r\n<p>Intel has done an about-face of sorts. Its phone efforts had focused \r\nheavily on Nokia until that company made a dramatic switch to \r\nMicrosoft''s Windows phone platform. "We were very focused on Nokia. Mike\r\n and I took over in April and got the company very focused on the \r\nAndroid ecosystem," said Dave Whalen, the other co-manager of the phone \r\ndivision. </p><div><br />Read more: <a href="http://news.cnet.com/8301-13924_3-20105608-64/intel-brandishes-first-google-android-tablet/#ixzz1Xw5pQIsr">http://news.cnet.com/8301-13924_3-20105608-64/intel-brandishes-first-google-android-tablet/#ixzz1Xw5pQIsr</a><br /></div>  ', 'c142759dc89ae8e20abc642e1dd0e99c.jpg', 'active', '2011-09-14', '0000-00-00 00:00:00'),
(5, 'en', 1, 'Windows 8 debuts at Microsoft Build (live blog)  Read more: http://news.cnet.com/8301-10805_3-20105152-75/windows-8-debuts-at-microsoft-build-live-blog/#ixzz1Xw61Mgip', '<p>A new analyst report making the rounds this morning asserts that \r\nApple''s putting the finishing touches on iOS 5, and plans to send it to \r\nits device assemblers as soon as next week. </p>\r\n<p>Analyst Ming-Chi Kuo of Concord Securities told <a href="http://www.appleinsider.com/articles/11/09/12/apple_to_release_ios_5_gm_to_assemblers_during_week_of_sept_23.html">AppleInsider</a> and <a href="http://www.macrumors.com/2011/09/12/apple-sending-ios-5-to-iphone-assemblers-at-end-of-september-no-sign-of-redesigned-iphone-5/">MacRumors</a>\r\n today that Apple should be delivering the golden master version of iOS 5\r\n between September 23 and 30. That software will then be imaged onto new\r\n devices that ship out to stores.\r\n</p>\r\n<p>The timing is of special note given expectations of a new\r\n<a href="http://www.cnet.com/apple-iphone.html">iPhone </a>and\r\n<a href="http://www.cnet.com/ipod/">iPod Touch</a> \r\nin the coming weeks. Kuo suggests it will take 10 to 12 days for \r\nshipping of new iPhones and iPod Touch units with the upgraded software,\r\n placing a higher possibility that those units won''t be available until \r\nthe second week of October. </p>\r\n<p>Apple released the latest beta version of its iOS 5 system software \r\nto developers at the tail end of August, the seventh iteration since \r\ntaking the wraps off the software at its Worldwide Developers Conference\r\n in June. So far, Apple has gone through a lengthier test process than \r\nusual, releasing a new beta of the software every few weeks ahead of the\r\n golden master, which represents the version the public gets: </p><div><br />Read more: <a href="http://news.cnet.com/8301-27076_3-20104888-248/ios-5-gold-master-expected-next-week-report-says/#ixzz1Xw6AsG9Q">http://news.cnet.com/8301-27076_3-20104888-248/ios-5-gold-master-expected-next-week-report-says/#ixzz1Xw6AsG9Q</a><br /></div>    ', '9bfe8a178df245ee90a2b5d62bfe682b.jpg', 'active', '2011-09-14', '0000-00-00 00:00:00'),
(6, 'en', 1, 'Google Street View''s naked lady', '<p>It is well accepted that, if there were commercial gain involved, \r\nGoogle might not be averse to peering inside the most intimate parts of \r\nyour life.</p>\r\n<p>However, sometimes the company manages to cast its gaze without even realizing just how close to you it is.</p>\r\n<p>I am sure some will be grateful to <a href="http://www.thesmokinggun.com/buster/google/google-street-view-naked-woman-094672">the always generous Smoking Gun</a>\r\n for leading them (in a SFW way) to a street in Miami, where a woman is \r\nstanding outside her front door naked. (The story of these interesting \r\npixels was originally broken by the <a href="http://randompixels.blogspot.com/2011/09/stay-classy-miami.html">Random Pixels blog</a>) </p>\r\n<p>Oh, of course it''s on Google Street View. Where else would you find truly unguarded moments, like <a href="http://news.cnet.com/8301-17852_3-20013500-71.html">a 10-year-old playing dead</a> or, indeed, <a href="http://news.cnet.com/8301-17852_3-20023487-71.html">a naked man in an open car trunk</a>?</p><p>In the Miami case, it appears the lady may have spotted Google''s \r\nmarauding recording vehicle, for in a subsequent shot on the site she \r\nattempts to cover up.</p>\r\n<p>The nude pose was still up in all its glory last night. However, this\r\n morning it''s blurred. What remains is merely a shot of her house and \r\nthe blurry image of a naked ghost.</p>\r\n<p>There will be those who will wonder what the naked lady might have \r\nbeen doing outside her house in a clothing-optional state. The obvious \r\nanswer would be that Miami is very hot. In this case, the naked lady \r\nappeared to be washing. Though this might have merely been a scene from \r\nyet another M. Night Shyamalan movie.</p>\r\n<p>Still, one can only wonder what other gems might still exist on a \r\nservice that, with its real-time captures of a microcosm of the world, \r\ntells us how people really spend their days. </p>  ', '22285438321c76a76dc925206f5dd5bf.png', 'active', '2011-09-14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `title` varchar(200) NOT NULL COMMENT 'Заголовок',
  `url` varchar(250) DEFAULT NULL COMMENT 'Адрес',
  `text` text NOT NULL COMMENT 'Текст',
  `is_published` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Опубликована',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Создана',
  `back_left` varchar(255) DEFAULT NULL COMMENT 'Фон левой колонки',
  `back_center` varchar(255) DEFAULT NULL COMMENT 'Центральный фон',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `lang`, `title`, `url`, `text`, `is_published`, `date_create`, `back_left`, `back_center`) VALUES
(1, 'ru', 'Главная страница', '/', '<p style="text-align: center;"><strong style="font-size: xx-large;"><span style="color: #ff6600;">ДОБРО ПОЖАЛОВАТЬ!&nbsp;</span></strong></p>\r\n<p style="text-align: center;"><span style="font-size: medium;"><strong>ПромАльпГруппа "ВертикАльП" рада приветствовать Вас на своем сайте.</strong></span></p>\r\n<p style="text-align: center;"><span style="font-size: medium;"><strong><strong><strong>Основная специализация компании &ndash; высотные работы самого широкого профиля.<br /></strong>Промышленный альпинизм уже давно стал привычным атрибутом нашего времени,<br />зачастую он является самым быстрым и удобным способом решить поставленные задачи.</strong></strong></span></p>\r\n<h3 style="text-align: center;"><span style="font-size: medium;"><strong>Спектр наших услуг не ограничивается представленными на сайте разделами.<br />Мы рады помочь нашим клиентам в реализации их идей.</strong></span></h3>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<table style="border-color: #000000; border-width: 0px; width: 790px;" border="1" cellpadding="5">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><span style="font-size: medium;">В преддверии новогодних праздников мы рады предложить вам необычную услугу &ndash;</span><br /><span style="font-size: medium;"><strong>ПОЗДРАВЛЕНИЕ В ОКНО</strong></span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style="text-align: center;"><strong><br /></strong></p>\r\n<p style="text-align: justify;"><span style="font-size: medium;"><span style="color: #00ccff; font-size: large;"><strong>Поздравление в окно</strong></span> &ndash; уникальный<a href="aasdf.ru"> способ удивить</a> не только ребенка, но и взрослого. Цветы, мягкие игрушки, воздушные шарики, любые подарки по Вашему желанию мы передадим Вашим любимым через окно. Такое необычное и оригинальное поздравление, несомненно, порадует и запомнится им надолго.<br /></span></p>\r\n<p style="text-align: justify;"><span style="font-size: medium;"><span style="color: #00ccff;"><em><strong>8 марта и не только.</strong></em></span> Любая девушка, конечно же, всегда мечтает о</span><span style="font-size: medium;"> романтике, об особенных знаках внимания, о красивых поступках. Обычных цветов, конфет, плюшевых мишек уже недостаточно. А значит мужчины должны соответствовать - нужно становиться рыцарями, совершать безумные поступки, проявлять чудеса находчивости и изобретательности.<br />Что же &ndash; мы готовы вам в этом помочь!<br />Букет в окно &ndash; такой сюрприз удивит даже самую взыскательную красотку! Да-да, букет будет передан из рук в руки! Вы только представьте себе степень ее удивления, когда она получит букет цветов с Вашей визиткой и пожеланиями, ниспосланный ей прямо с неба. Вам в этой ситуации лучше находиться где-нибудь поблизости, ведь растроганная девушка не сможет устоять перед таким проявлением чувств и, скорее всего, упадет к Вам в объятия. <br />А если пока еще Ваша любимая не знает о Ваших чувствах, то самое время рассказать ей об этом таким нестандартным и оригинальным способом!</span></p>\r\n<p style="text-align: justify;"><span style="font-size: medium;"><em><strong><span style="color: #00ccff;">Новогоднее поздравление от Деда Мороза.</span></strong></em> Пока мы дети, мы верим в чудеса. Становясь взрослыми, мы с улыбкой&nbsp; вспоминаем те мгновения счастья и радости, которые были нам подарены в детстве. И очень хотим повторить их уже для своих детей, подарив что-нибудь ну очень волшебное.<br />Как обрадовать своего ребенка, поддержав в нем веру в чудо? Чем можно приятно удивить его, учитывая огромное разнообразие выбора в сфере развлечений?<br />Пригласите в гости нашего волшебного посыльного от Деда Мороза для того, чтобы вызвать улыбку на лице Вашего малыша.<br />Новый год делает нас всех немного волшебниками. В это время чудес мы хотим подарить вам и вашим детям маленькую сказку.<br /></span><span style="font-size: medium;">Дед  Мороз непременно должен перемещаться по воздуху на волшебных санях,  запряженных крылатыми оленями, и не заходить в дом через дверь, как папа  и мама. И все его помощники тоже. Наш посыльный именно такой &ndash; он  появится из ниоткуда за Вашим окном, вручит подарок вашему малышу, поздравит его от имени Деда Мороза и оставит после себя  восторг и удивление всей Вашей семьи.</span></p>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong><span style="font-size: medium;">Специалисты ПромАльпГруппы &laquo;ВертикАльП&raquo;, руководствуясь наработанным опытом, подберут для Вас оптимальное решение по применяемым технологиям, согласуют график работ, обсудят детали.</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p style="text-align: center;"><strong><span style="font-size: medium;">Мы гарантируем, что результат удовлетворит все Ваши ожидания!</span></strong></p>', 1, '2011-06-25 16:23:15', '263959ec7943784d2a361e94c20b5d95.jpg', '9d9e37fae9379388705e426ddc95ca56.jpg'),
(2, 'ru', 'О нас', '', '<p>ПромАльпГруппа "ВертикАльП" собрала под своим именем профессионалов, работающих в сфере промышленного альпинизма.</p>', 1, '2011-09-10 17:11:25', NULL, NULL),
(18, 'ru', 'Услуги', 'service', '<p>НАШИ УСЛУГИ</p>', 1, '2011-12-12 20:43:17', NULL, NULL),
(19, 'ru', 'Цены', 'price', '<p style="text-align: center;">&nbsp;</p>\r\n<p style="text-align: center;"><span style="font-size: medium;">В преддверии Нового года мы рады предложить Вам необычную услугу</span></p>\r\n<table style="width: 600px; height: 50px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="0" align="center">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><span style="font-size: medium;"><strong>"ПОЗДРАВЛЕНИЕ В ОКНО ОТ ДЕДА МОРОЗА"</strong></span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style="text-align: center;"><br /><span style="font-size: medium;">Совместно с сайтом Ситирадар ПромАльпГруппа "ВертикАльп" запустила акцию<br /><em><strong>"Поздравление в окно от Деда Мороза, даже на 2012 этаж со скидкой 50% от компании ВертикАльп!".</strong></em></span></p>\r\n<p><span style="font-size: medium;">&raquo; Купон дает право скидки:</span><br /><span style="font-size: medium;">&nbsp;1) с 14-12-2011 по 25-12-2011 и 02-01-2012 по 31-01-2012 - цена без скидки 7000 рублей, с купоном 3500 рублей;</span><br /><span style="font-size: medium;">&nbsp;2) с 26-12-2011 по 28-12-2011 - цена без скидки 11000 рублей, с купоном 5500 рублей;</span><br /><span style="font-size: medium;">&nbsp;3) с 29-12-2011 по 31-12-2011 (до 14-00) - цена без скидки 20000 рублей, с купоном 10000 рублей;</span><br /><span style="font-size: medium;">&nbsp;4) с 31-12-2011 по 31-12-2011 (с 14-00 до 21-00) - цена без скидки 30000 рублей, с купоном 15000 рублей;</span><br /><span style="font-size: medium;">&nbsp;5) с 31-12-2011 по 01-01-2012 (с 21-00 31-го по 06-00 01-го) - цена без скидки 50000 рублей, с купоном 25000 рублей.</span></p>\r\n<p style="text-align: justify;"><span style="font-size: medium;">Порадуйте себя и своих близких неожиданным и оригинальным подарком!</span></p>\r\n<p style="text-align: justify;">&nbsp;</p>\r\n<p style="text-align: justify;"><span style="font-size: medium;">Цены на услуги промышленных альпинистов рассчитываются для каждого объекта индивидуально. На окончательное формирование цены могут влиять следующие факторы:&nbsp;</span></p>\r\n<ul>\r\n<li><span style="font-size: medium;">ограниченное время или срочность работы (например, работа возможна только ночью или в выходные дни) </span></li>\r\n<li><span style="font-size: medium;">сложная конфигурация фасада (большие козырьки, нависания, выступающие конструкции)</span></li>\r\n<li><span style="font-size: medium;">угол наклона крыши, отсутствие мест креплений на крыше и ограждений на кровле </span></li>\r\n<li><span style="font-size: medium;">этажность здания </span></li>\r\n<li><span style="font-size: medium;">большая проходимость людей т.п.</span></li>\r\n</ul>\r\n<p style="text-align: justify;"><span style="font-size: medium;">Мы рады предложить нашим постоянным клиентам скидки за большой объем выполняемых работ и комплексное сотрудничество по различным направлениям нашей деятельности.</span></p>\r\n<p><span style="font-size: medium;"> </span></p>\r\n<hr />\r\n<p style="text-align: center;"><strong><span style="font-size: medium;">Специалисты ПромАльпГру</span><span style="font-size: medium;">ппы &laquo;ВертикАльП&raquo;, руководствуясь наработанным опытом, подберут для Вас оптимальное</span><span style="font-size: medium;"> решение по применяемым технологиям, согласуют график работ, обсудят детали.</span></strong></p>\r\n<p style="text-align: center;"><strong><span style="font-size: medium;">Мы гарантируем, что результат удовлетворит все Ваши ожидания!</span></strong></p>\r\n<p style="text-align: justify;"><em><span style="font-size: medium;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.</span></em></p>\r\n<p style="text-align: justify;"><em><span style="font-size: medium;">Выезд специалиста на объект (М, МО) для осмотра и составления сметы</span><span style="font-size: medium;"> - </span></em><span style="font-size: medium;"><span style="font-size: medium;"><span style="font-size: large;">БЕСПЛАТНО!</span></span></span><em><span style="font-size: medium;"><br />Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.&nbsp;</span><span style="font-size: medium;">&nbsp;</span></em></p>', 1, '2011-12-12 20:43:35', NULL, NULL),
(20, 'ru', 'Контакты', 'contacts', '<p style="text-align: center;">&nbsp;</p>\r\n<p style="text-align: center;"><strong>Наши телефоны:</strong></p>\r\n<p style="text-align: center;">ОФИС С 10-00 ДО 20-00</p>\r\n<p style="text-align: center;">+7 (495) 226-77-96</p>\r\n<p style="text-align: center;">ХУДИК АЛЕКСАНДР, РУКОВОДИТЕЛЬ ПРОЕКТОВ</p>\r\n<p style="text-align: center;">+7 (925) 777-09-50</p>\r\n<p style="text-align: center;">+7 (964) 594-85-51</p>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<p style="text-align: center;"><strong>E-mail:</strong></p>\r\n<p style="text-align: center;">vertikalp@list.ru</p>', 1, '2011-12-12 20:43:55', NULL, NULL),
(21, 'ru', 'Сотрудничество', 'cooperation', '<p style="text-align: justify;"><strong style="font-size: medium;">ПромАльпГруппа &laquo;ВертикАльП&raquo; рада предложить сотрудничество как юридическим, так и физическим лицам. В разделе <a href="../../../../page/contacts">Контакты</a> Вы можете выбрать наиболее удобный способ связи с нами.</strong></p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><span style="font-size: medium;"><span style="color: #ff6600;"><em><strong>1. Юридическим лицам.</strong></em></span> Сотрудничество с организациями предполагает работу на условиях генподряда или субподряда. Мы также охотно сотрудничаем с event-агентствами и рекламными компаниями, занимающимися необычными поздравлениями.</span><br /><span style="font-size: medium;"><em><strong>Для выполнения работ в качестве генподрядчика</strong></em> наши сотрудники детально ознакомятся с вашим проектом, в случае необходимости дадут совет по использованию тех или иных материалов, согласуют применяемые технологии, обсудят сроки сдачи объекта.Собственникам мы можем предложить постоянное годовое обслуживание Вашего здания &ndash; в зимний период мы проведем уборку кровли от снега и наледи, весной помоем фасад, летом выполним покраску стен, ремонт кровли, чистку кондиционеров, осенью подготовим здание к зимнему периоду путем утепления и герметизации.</span><br /><span style="font-size: medium;"><em><strong>При работе по договору субподряда</strong></em>&nbsp;мы будем рады сотрудничеству с клининговыми и строительными компаниями, с ТСЖ и муниципальными структурами. Если у вас горят сроки сдачи объекта, если предыдущие работники не справились с поставленной задачей или не смогли до конца выполнить свои обязательства &ndash; звоните нам, мы постараемся вам помочь.</span><br /><span style="font-size: medium;"><em><strong>Необычные поздравления.</strong></em> Наша компания готова предложить сотрудничество в области организации нестандартных поздравлений. Промышленные альпинисты с радостью выполнят заказ &laquo;поздравление в окно&raquo; как для взрослых (поздравление с 8-м марта), так и для детей (новогоднее поздравление от Деда Мороза).</span></span></p>\r\n<p style="text-align: justify;"><span style="font-size: medium;"><em><strong><span style="color: #00ccff;"><span style="font-size: small;"><span style="font-size: medium;"><span style="color: #ff6600;"><em><strong>2. Частным заказчикам</strong></em></span></span></span> </span></strong></em>мы посвятили отдельный Раздел. Мы с радостью выполним для вас любые разовые работы в соответствии с вашими пожеланиями. Вне зависимости от того, живете ли вы в многоквартирном доме или являетесь обладателем собственного коттеджа, вы всегда можете обратиться к нам за консультацией.</span></p>\r\n<p style="text-align: justify;"><span style="font-size: medium;"><em><strong><span style="color: #00ccff;"><span style="font-size: small;"><span style="font-size: medium;"><span style="color: #ff6600;"><em><strong>3. Физическим лицам. </strong></em></span></span></span></span></strong></em>Мы также нуждаемся в опытных специалистах своего дела, способных выполнять работу четко, профессионально, с соблюдением сроков и с учетом пожеланий заказчиков. Мы гарантируем своевременную оплату за выполненные работы. Нам нужны надежные и ответственные люди, умеющие решать нестандартные задачи. Свои резюме вы можете отправлять на наш электронный адрес, мы обязательно свяжемся с вами!</span></p>', 1, '2011-12-13 17:59:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `pages_blocks`
--

CREATE TABLE IF NOT EXISTS `pages_blocks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `title` varchar(250) NOT NULL COMMENT 'Заголовок',
  `name` varchar(50) NOT NULL COMMENT 'Название (англ.)',
  `text` longtext NOT NULL COMMENT 'Текст',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Добавлено',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_2` (`lang`,`title`),
  UNIQUE KEY `lang_3` (`lang`,`name`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `pages_blocks`
--

INSERT INTO `pages_blocks` (`id`, `lang`, `title`, `name`, `text`, `date_create`) VALUES
(1, 'en', 'Копирайт', 'copyright', '<p class="lf">© Copyright <a href="#">MyWebSite</a>.</p>\r\n            <p class="rf">Layout by Rocket <a href="http://www.rocketwebsitetemplates.com/">Website Templates</a></p>  ', '2011-09-11 00:39:54'),
(3, 'ru', 'Копирайт', 'copyright', '<p class="lf">© Copyright <a href="#">MyWebSite</a>.</p>\r\n            <p class="rf">Layout by Rocket <a href="http://www.rocketwebsitetemplates.com/">Website Templates</a></p>  ', '2011-09-13 02:41:42'),
(4, 'ru', 'Контакты', 'contacts', '<h2>Контакты</h2>\r\n                <p><a href="#">support@yoursite.com</a></p>\r\n                <p>+1 (123) 444-5677<br />\r\n                    +1 (123) 444-5678</p>\r\n                <p>Адрес: 123 TemplateAccess Rd1</p>  ', '2011-09-13 02:45:15'),
(5, 'en', 'Контакты', 'contacts', '<h2>Contact</h2>\r\n                <p><a href="#">support@yoursite.com</a></p>\r\n                <p>+1 (123) 444-5677<br />\r\n                    +1 (123) 444-5678</p>\r\n                <p>Address: 123 TemplateAccess Rd1</p>  ', '2011-09-13 02:45:40');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Название',
  `is_published` tinyint(1) NOT NULL COMMENT 'Опубликована',
  `order` int(11) NOT NULL COMMENT 'Сортировка',
  `photo` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT 'Скан отзыва',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `title`, `is_published`, `order`, `photo`) VALUES
(1, 'Земляной Вал', 1, 0, '02acbed65172e1c4952b0692bc97b7eb.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` varchar(50) NOT NULL COMMENT 'Модуль',
  `code` varchar(50) NOT NULL COMMENT 'Код',
  `name` varchar(100) NOT NULL COMMENT 'Заголовок',
  `value` text NOT NULL COMMENT 'Значение',
  `element` enum('text','textarea','editor') NOT NULL COMMENT 'Элемент',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Скрыта',
  PRIMARY KEY (`id`),
  UNIQUE KEY `const` (`code`),
  UNIQUE KEY `title` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `module_id`, `code`, `name`, `value`, `element`, `hidden`) VALUES
(1, 'users', 'registration_mail_body', 'Шаблон письма регистрации', '<p>Здравствуйте {LAST_NAME} {FIRST_NAME} {PATRONYMIC}!</p>\r\n<p>Вы зарегистрировались на сайте {SITE_NAME}.</p>\r\n<p>Для завершения регистрации пройдите <a href="%7BACTIVATE_ACCOUNT_URL%7D">по этой ссылке.</a></p>\r\n<p>Адрес ссылки: {ACTIVATE_ACCOUNT_URL}</p>  ', 'editor', 0),
(7, 'users', 'registration_mail_subject', 'Тема письма регистрации', 'Регистрация на сайте {SITE_NAME}', 'text', 0),
(9, 'users', 'registration_done_message', 'Сообщение о завершении регистрации', '<p>Вы успешно зарегистрированы в системе, на ваш Email отправлено письмо с инструкциями завершения регистрации.</p>', 'editor', 0),
(10, 'users', 'activate_request_done_message', 'Сообщение после повторного запроса активации аккаунта', 'Мы выслали на ваш Email письмо, в котором нужно будет пройти по ссылке для активации аккаунта!', 'textarea', 0),
(11, 'users', 'change_password_request_mail_body', 'Шаблон письма запроса на смену пароля', '<p>Здравствуйте {LAST_NAME} {FIRST_NAME} {PATRONYMIC}!</p>\r\n<p>Вы сделали запрос на восстановление пароля на сайте {SITE_NAME}.</p>\r\n<p>Для того чтобы изменить пароль пройдите <a href="%7BLINK%7D">по этой ссылке.</a></p>\r\n<p>Адрес ссылки: {LINK}</p>  ', 'editor', 0),
(12, 'users', 'change_password_request_mail_subject', 'Тема письма запроса на смену пароля', 'Запрос на смену пароля {SITE_NAME}  ', 'editor', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `site_actions`
--

CREATE TABLE IF NOT EXISTS `site_actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT 'Пользователь',
  `title` varchar(200) NOT NULL COMMENT 'Заголовок',
  `module` varchar(50) NOT NULL COMMENT 'Модуль',
  `controller` varchar(50) NOT NULL COMMENT 'Контроллер',
  `action` varchar(50) NOT NULL COMMENT 'Действие',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `site_actions`
--


-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL COMMENT 'Имя',
  `last_name` varchar(40) DEFAULT NULL COMMENT 'Фамилия',
  `patronymic` varchar(40) DEFAULT NULL COMMENT 'Отчество',
  `email` varchar(200) NOT NULL COMMENT 'Email',
  `phone` varchar(50) DEFAULT NULL COMMENT 'Мобильный телефон',
  `password` varchar(32) NOT NULL COMMENT 'Пароль',
  `birthdate` date DEFAULT NULL COMMENT 'Дата рождения',
  `gender` enum('man','woman') DEFAULT NULL COMMENT 'Пол',
  `status` enum('active','new','blocked') DEFAULT 'new' COMMENT 'Статус',
  `activate_code` varchar(32) DEFAULT NULL COMMENT 'Код активации',
  `activate_date` datetime DEFAULT NULL COMMENT 'Дата активации',
  `password_recover_code` varchar(32) DEFAULT NULL,
  `password_recover_date` datetime DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Зарегистрирован',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `patronymic`, `email`, `phone`, `password`, `birthdate`, `gender`, `status`, `activate_code`, `activate_date`, `password_recover_code`, `password_recover_date`, `date_create`) VALUES
(1, 'Иван', 'Иванов', 'Васильевич', 'admin@ya.ru', '+7-965-1935233', 'e10adc3949ba59abbe56e057f20f883e', '2003-05-20', 'man', 'active', '070a63ae33af0eb7986992e774dc53e8', '2011-05-21 13:18:39', NULL, NULL, '2011-05-19 03:25:50'),
(17, 'Артем', 'Остапец', 'Игоревич', 'artem-moscow@yandex.ru', '+7-903-5492969', '813107300f254c3a072c17066c15a22a', '2011-09-25', 'man', 'new', '7533c7b47ed8206d6913e6d271b23ec3', NULL, NULL, NULL, '2011-09-22 20:19:48'),
(19, 'Алексей', 'Шаров', NULL, 'www.pismeco@gmail.com', '', '827ccb0eea8a706c4c34a16891f84e7b', '0000-00-00', '', 'active', '827ccb0eea8a706c4c34a16891f84e7b', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '2011-11-11 16:17:20');
