-- phpMyAdmin SQL Dump
-- version 
-- http://www.phpmyadmin.net
--
-- Хост: u326839.mysql.masterhost.ru
-- Время создания: Авг 10 2012 г., 13:06
-- Версия сервера: 5.5.24
-- Версия PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `u326839_3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actions`
--

DROP TABLE IF EXISTS `actions`;
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

DROP TABLE IF EXISTS `actions_files`;
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

DROP TABLE IF EXISTS `articles`;
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

DROP TABLE IF EXISTS `articles_sections`;
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

DROP TABLE IF EXISTS `auth_assignments`;
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

DROP TABLE IF EXISTS `auth_items`;
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
('Page_Services', 0, NULL, NULL, 'N;', 1),
('Category_Service', 0, NULL, NULL, 'N;', 1),
('Category_Prices', 0, NULL, NULL, NULL, 1),
('Category_Price', 0, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_items_childs`
--

DROP TABLE IF EXISTS `auth_items_childs`;
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

DROP TABLE IF EXISTS `auth_objects`;
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

DROP TABLE IF EXISTS `banners`;
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

DROP TABLE IF EXISTS `banners_roles`;
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

DROP TABLE IF EXISTS `category`;
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
  `alias` varchar(250) DEFAULT NULL COMMENT 'Алиас',
  `for_price` text NOT NULL COMMENT 'Для страницы "Цены"',
  `sidebar_top` text NOT NULL COMMENT 'Верхний сайдбар',
  `sidebar_top_title` varchar(255) NOT NULL COMMENT 'Верхний сайдбар - Заголовок',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Категория' AUTO_INCREMENT=66 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `alias`, `for_price`, `sidebar_top`, `sidebar_top_title`) VALUES
(1, 'root', 1, 1, 92, '2012-07-30 16:56:43', 0, 1, NULL, NULL, NULL, '', '', ''),
(2, 'Клининговые <span>услуги</span>', 2, 2, 7, '2012-08-09 18:36:26', 1, 0, '<p style="text-align: justify;"><a href="../../../../chapter/mojka-okon">Мойка окон</a> и <a href="../../../../chapter/mojka-fasadov">мойка фасадов</a> поможет привести облик любого здания в надлежащий вид. Жилые дома, складские и офисные помещения или торговые центры со сплошной облицовкой &ndash; любые фасады и остекленные поверхности нуждаются в регулярной очистке от накапливающейся грязи, пыли и городского смога. Своевременная мойка не только освежает внешний вид фасада, но одновременно служит для профилактики постепенного разрушения здания.&nbsp;</p>\r\n<p style="text-align: justify;">В крупных городах ответственность за поддержание внешнего вида здания ложится на собственника, и услуги по мойке фасадов и окон являются крайне востребованными.</p>\r\n<p style="text-align: justify;">Нередки ситуации, когда конструкция здания такова, что добраться без сложностей до отдельных поверхностей фасада не представляется возможным. В силу особенностей архитектурных решений здания могут иметь выступающие козырьки крыльца, отрицательный уклон панорамного остекления фасада, колонны, навесы и т.п. Для выполнения высотных работ по мойке зданий наиболее целесообразным является привлечение промышленных альпинистов.</p>\r\n<p style="text-align: justify;">В зависимости от труднодоступности очищаемой поверхности может быть применено непосредственно альпинистское снаряжение, или же будут использованы автовышки, туры или телескопические погрузчики.</p>\r\n<p style="text-align: center;"><img src="../../../../upload/tiny/cleaning/01_00_01.jpg" alt="" width="200" height="133" /> &nbsp;&nbsp;<img src="../../../../upload/tiny/cleaning/01_00_02.jpg" alt="" width="200" height="133" /> &nbsp;&nbsp;<img src="../../../../upload/tiny/cleaning/01_00_03.jpg" alt="" width="200" height="133" /></p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '5f7f2f1a78e8d42ab32a5a0ad427ea54.jpg', 'cleaning', '<p><strong>&nbsp;&nbsp; МОЙКА ОКОН, МОЙКА ФАСАДОВ</strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Мойка окон</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">от 45</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Мойка фасадов</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">от 42</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Мойка окон после стройки (послестрой)</td>\r\n<td class="xl73" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl74" style="text-align: center;">от 85</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 6 000 руб.</strong></p>', '<p style="text-align: center;">Группа компаний &laquo;Альпинисты Москвы&raquo; рада предложить своим заказчикам услуги по комплексной мойке окон и фасадов зданий. Высотная мойка окон и фасадов требует профессионального подхода. Наши специалисты обладают необходимым опытом и квалификацией для выполнения такого рода работ.<br />&nbsp;Помыть фасад с помощью технологий промышленного альпинизма &ndash; значит сэкономить время и деньги!</p>\r\n<p style="text-align: center;"><strong>ПОЗВОНИТЕ НАМ!</strong><br /> Мы возьмем на себя Ваши заботы!</p>', 'КЛИНИНГОВЫЕ УСЛУГИ'),
(3, 'Фасадные <span>работы</span>', 2, 8, 25, '2012-08-07 18:35:00', 1, 0, '<p style="text-align: justify;">Внешний вид любого здания является его визитной карточкой, поэтому так важно, чтобы фасад выглядел чистым, свежим, ухоженным. Проблемы, связанные с восстановлением облика здания, помогут решить фасадные работы, объединенные в комплекс многопрофильных задач, разбитых на этапы. <a href="../../../../chapter/ochistka-fasada">Очистка фасада</a>, штукатурные работы, шпатлевка, <a href="../../../../chapter/pokraska-fasada">покраска фасада</a>, облицовочные работы на фасаде, устройство цоколя, установка дополнительных декоративных элементов, <a href="../../../../chapter/restavratsija-fasada">реставрация лепнины</a>, восстановление балконов, <a href="../../../../chapter/germetizatsija-shvov">герметизация швов</a> &ndash; все это и многое другое входит в понятие &laquo;фасадные работы&raquo;.&nbsp;</p>\r\n<p style="text-align: justify;">Правильное устройство фасада позволяет владельцам здания заботиться лишь о поддержании его в надлежащем состоянии. Однако, неблагоприятное воздействие окружающей среды, возможные ошибки, допущенные при строительстве, небережная эксплуатация &ndash; все это может стать причиной разрушений.&nbsp;</p>\r\n<p style="text-align: justify;">С помощью технологий промышленного альпинизма можно в короткие сроки устранить имеющиеся дефекты и придать внешнему виду фасада обновленный вид. Высотные работы, выполняемые промышленными альпинистами, избавят от установки громоздких строительных лесов, не создадут дополнительных проблем с ограждением лишней территории вокруг места проведения работ и, конечно, сэкономят время и деньги.&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '98ed9a15f2857fd2a21c5823918e974a.jpg', 'fasads', '<p><strong>&nbsp;&nbsp; ПОКРАСКА ФАСАДОВ</strong></p>\r\n<table style="width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr style="background-color: #cccccc; height: 40px;">\r\n<td class="xl75" style="text-align: center;" width="775" height="40"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td class="xl76" style="text-align: center;" width="89"><strong>Ед. изм.</strong></td>\r\n<td class="xl77" style="text-align: center;" width="89"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" width="775" height="40"><strong>Очистка старой краски</strong><br /> Очистка сторой краски металлическими щетками или механическим способом</td>\r\n<td class="xl65" style="text-align: center;">м. кв.</td>\r\n<td class="xl66" style="text-align: center;">от 50</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" width="775" height="40"><strong>Мойка фасада перед покраской</strong><span><br /> Мойка фасада аппаратом высокого давления</span></td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 35</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Грунтовка поверхности</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 40</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" width="775" height="40"><strong>Окраска поверхности фасада (один слой)</strong><span><br /> Oкраска фасада выполняется валиками или краскопультом</span></td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 55</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Окраска поверхности фасада более трех цветов (один слой)</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 85</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Окраска лепнины</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 135</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Окраска оконных рам</td>\r\n<td class="xl67" style="text-align: center;">шт.</td>\r\n<td class="xl68" style="text-align: center;">от 400</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Окраска оконных и балконных решеток (по площади решетки)</td>\r\n<td class="xl67" style="text-align: center;">шт.</td>\r\n<td class="xl68" style="text-align: center;">от 480</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Окраска подоконных отливов</td>\r\n<td class="xl67" style="text-align: center;">шт.</td>\r\n<td class="xl68" style="text-align: center;">от 130</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Покраска карнизов</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 95</td>\r\n</tr>\r\n<tr>\r\n<td class="xl73" height="40">Окраска водосточных труб</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 140</td>\r\n</tr>\r\n<tr>\r\n<td class="xl74" height="40">Окраска пожарных лестниц</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">от 220</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 6 000 руб.</strong></p>', '<p style="text-align: center;">Группа компаний &laquo;Альпинисты Москвы&raquo; осуществляет любые виды фасадных работ. Отделка фасадов фактурной штукатуркой, восстановление декоративных элементов фасада, монтаж вентилируемых фасадов &ndash; мы выполняем различные работы на фасадах быстро и качественно! Фасадные работы &ndash; это одна из специализаций нашей компании. Мы также занимаемся заменой панорамного остекления на фасадах.<br /> <strong>ПОЗВОНИТЕ НАМ!</strong><br /> Мы возьмем на себя Ваши заботы!</p>', 'ФАСАДНЫЕ РАБОТЫ'),
(4, 'Кровельные работы', 2, 26, 37, '2012-07-26 18:04:14', 1, 0, '<p style="text-align: justify;"><strong>Кровельные работы</strong>&nbsp;являются одним из последних этапов в строительстве здания. Правильно подобранные кровельные материалы и технология устройства кровли обеспечат надежность крыши и долговечность ее эксплуатации. Многослойность современной кровли, за которую ее еще называют &laquo;пирогом&raquo;, ставит перед монтажником задачу правильного совмещения всех ее слоев в единую систему кровельного покрытия.&nbsp;</p>\r\n<p style="text-align: justify;">Помимо самой кровли, состоящей из несущей обрешетки, гидроизоляции, утеплителя, пароизоляционной пленки и кровельного покрытия, кровельная система включает в себя множество дополнительных элементов. Они в свою очередь образуют целостную систему безопасности кровли, обеспечивающую удобство при обслуживании здания.&nbsp;</p>\r\n<p style="text-align: justify;">От качества кровельного покрытия зависит долговечность и сохранность всего дома. Ведь кровля защищает не только само строение, но и все, что находится внутри него. Из-за протечек на стенах может образовываться плесень. Ошибки в выборе используемых материалов могут привести к деформации кровли, что в свою очередь окажет давление на фундамент всей конструкции, и она может покоситься. Неверный монтаж способен спровоцировать обрушение кровли. Именно поэтому кровельным работам нужно уделять максимальное внимание, ведь зачастую ремонт и восстановление могут обойтись гораздо дороже, чем затраты на первоначальный качественный монтаж.&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br /></strong>Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'bb16e3b98157d15779f711108e7607c4.jpg', 'crovel', '<p><strong>&nbsp;&nbsp; ОБЩАЯ ИНФОРМАЦИЯ</strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Монтаж кровли</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Ремонт кровли</td>\r\n<td class="xl69" style="text-align: center;">м.кв.</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Герметизация кровли</td>\r\n<td class="xl69" style="text-align: center;">м.пог.</td>\r\n<td class="xl70" style="text-align: center;">от 250</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Замена желобов</td>\r\n<td class="xl73" style="text-align: center;">м.пог.</td>\r\n<td class="xl74" style="text-align: center;">договорная</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>', '', ''),
(8, 'Очистка от снега', 2, 76, 77, '2012-08-07 14:46:45', 1, 0, '<p style="text-align: justify;">В зимний период важной задачей благоустройства города становится <strong>очистка кровли от снега и наледи.</strong> Скопившийся на крыше <span style="color: #000000;"><strong><em>снег</em></strong></span> и <span style="color: #000000;"><strong><em>сосульки</em></strong></span> могут представялять угрозу для пешеходов и автовладельцев. Стихийный сход снега способен причинить ущерб припаркованным автомобилям, намерзшие на карнизах сосульки, падая, достаточно часто становятся причиной травм людей. В период оттепели образовавшаяся на краю крыши <span style="color: #000000;"><strong><em>наледь</em></strong></span> может привести к деформации покрытия кровли, возможно образование протечек. Кроме этого, до начала периода снегопада необходимо также позаботиться о защите системы водостока. Во время перепадов температур стекающая по желобам вода замерзает внутри трубы, что может привести к ее разрыву. С этой целью перед началом снегопада на верхушки желобов надеваются специальные крышки.</p>\r\n<p style="text-align: justify;">Во избежание несчастных случаев необходимо регулярно очищать крыши от снега и наледи. Технологии промышленного альпинизма позволяют в кратчайшие сроки решить эту проблему. Очистка кровли может проводиться как на всей площади крыши, так и по ее периметру на расстоянии 1,5 метров от края. Если необходимо сбить образовавшиеся сосульки, то и эту проблему решат промышленные альпинисты.</p>\r\n<p style="text-align: justify;">Работы по очистке крыши от снега и наледи могут производиться на основе различных договоров с заказчиком.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Разовый выезд</strong></span> осуществляется по желанию заказчика при однократном крупном снегопаде. Очистка крыши должна быть произведена за один день.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Договор на абонентское обслуживание</strong></span> в зимний период предполагает, что очистка кровли будет производиться специалистами промышленного альпинизма регулярно, выезд бригады осуществляется каждый раз при выпадении снега. При поступлении звонка от заказчика мобильная бригада промышленных аьпинистов выезжает на объект и производит очистку крыши от выпавшего снега.&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br /></strong>Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><em>&nbsp;</em><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'ee919d6207dad5c165192b6d7441cf51.jpg', 'snow', '<p><strong>&nbsp;&nbsp; РАЗОВОЕ ОБСЛУЖИВАНИЕ КРОВЛИ<br /></strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Очистка кровли от снега и льда на расстоянии 1,5 метра от края кровли и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">погонный метр периметра здания</td>\r\n<td class="xl70" style="text-align: center;">от 35</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Полная очистка всей площади кровли от снега и льда и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">квадратный метр площади кровли</td>\r\n<td class="xl70" style="text-align: center;">от 27</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Минимальный заказ (до 200 метров)</td>\r\n<td class="xl73" style="text-align: center;">1 выезд</td>\r\n<td class="xl74" style="text-align: center;">7 000</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;&nbsp; &laquo;КОМПЛЕКС 1&raquo; (не менее 3-х выездов в месяц)</strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Очистка кровли от снега и льда на расстоянии 1,5 метра от края кровли и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">погонный метр периметра здания</td>\r\n<td class="xl70" style="text-align: center;">от 35</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Полная очистка всей площади кровли от снега и льда и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">квадратный метр площади кровли</td>\r\n<td class="xl70" style="text-align: center;">от 24</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Минимальный заказ (до 200 метров)</td>\r\n<td class="xl73" style="text-align: center;">1 выезд</td>\r\n<td class="xl74" style="text-align: center;">7 000</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp; &laquo;КОМПЛЕКС 2&raquo; (полное обслуживание)</strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Очистка кровли от снега и льда на расстоянии 1,5 метра от края кровли и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">погонный метр периметра здания</td>\r\n<td class="xl70" style="text-align: center;">от 250</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Полная очистка всей площади кровли от снега и льда и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">квадратный метр площади кровли</td>\r\n<td class="xl70" style="text-align: center;">от 160</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Минимальный заказ (до 200 метров)</td>\r\n<td class="xl73" style="text-align: center;">месяц</td>\r\n<td class="xl74" style="text-align: center;">40 000</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp; ДРУГИЕ РАБОТЫ</strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Очистка труднодоступных участков кровли с применением альпинистского снаряжения</td>\r\n<td class="xl69" style="text-align: center;">п. м.</td>\r\n<td class="xl70" style="text-align: center;">от 64</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Очистка карнизов, фальш-карнизов и балконов от сосулек, снега и наледи</td>\r\n<td class="xl69" style="text-align: center;">спуск</td>\r\n<td class="xl70" style="text-align: center;">от 600</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Очистка воронок ото льда</td>\r\n<td class="xl73" style="text-align: center;">шт.</td>\r\n<td class="xl74" style="text-align: center;">от 400</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Очистка водосточной трубы ото льда</td>\r\n<td class="xl73" style="text-align: center;">м. п.</td>\r\n<td class="xl74" style="text-align: center;">от 40</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Удаление сосулек и наледи с карниза кровли здания на расстоянии 0,5 м от края кровли</td>\r\n<td class="xl73" style="text-align: center;">м. п.</td>\r\n<td class="xl74" style="text-align: center;">от 24</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Уборка территории от сброшенного снега и льда</td>\r\n<td class="xl73" style="text-align: center;">м. кв.</td>\r\n<td class="xl74" style="text-align: center;">от 18</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Погрузка сброшенного снега и льда в контейнер с последующим вывозом</td>\r\n<td class="xl73" style="text-align: center;">контейнер</td>\r\n<td class="xl74" style="text-align: center;">договорная</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>\r\n<p><span style="text-decoration: underline;"><br />На окончательную стоимость работ влияют следующие факторы:</span></p>\r\n<ul>\r\n<li>удаленность объекта от МКАД;</li>\r\n<li>отсутствие ограждений на кровле;</li>\r\n<li>необходимость уборки и вывоза снега с территории;</li>\r\n<li>наличие большого потока людей на территории;</li>\r\n<li>время производства работ: день или ночь;</li>\r\n<li>количество снега и льда на кровле здания;</li>\r\n<li>сложная архитектура здания;</li>\r\n<li>большая этажность здания (более 7 этажей);</li>\r\n<li>материал кровли здания;</li>\r\n<li>крутизна кровли (угол наклона).</li>\r\n</ul>', '', ''),
(10, 'Монтаж кондиционеров', 2, 78, 79, '2012-08-07 14:46:45', 1, 0, '<p style="text-align: justify;">В современном мире люди стремятся к комфорту проживания &ndash; летом нам нужна прохлада, зимой мы хотим побыстрее согреться, придя с мороза. Установка кондиционера решает одновременно обе эти задачи. Оптимальная температура бывает жизненно необходима не только людям, но и машинам. В этом случае речь идет уже об организации целой системы вентиляции воздуха (например, обустройство вентиляции в цехе или складском помещении).</p>\r\n<p style="text-align: justify;"><strong>Монтаж наружных блоков кондиционеров </strong>представляет собой комплексную, очень сложную в техническом смысле задачу. При установке самого блока требуется для начала смонтировать систему креплений. Для этого в стене с наружной стороны здания специалисты промышленного альпинизма с веревок высверливают специальными бурами отверстия под шурупы. Держащиеся на шурупах кронштейны должны быть сбалансированы, чтобы не происходило перевеса, и укрепленный на них блок кондиционера надежно держался. Над блоком очень часто устанавливают специальные козырьки, которые защищают его от падения сосулек и снега при чистке крыши. Также пластмассовым коробом могут быть дополнительно закрыты все наружные коммуникации, ведущие к внутреннему блоку кондиционера.</p>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;, руководствуясь наработанным опытом, подберут для Вас оптимальное решение по применяемым технологиям, согласуют график работ, обсудят детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '5cb7bd95a99d0bee1585099006e85a31.jpg', 'condition', '<p><strong>&nbsp;&nbsp; МОНТАЖ КОНДИЦИОНЕРОВ<br /></strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Монтаж кондиционера 7-9 БТЕ(2.5-3.5 КВт)</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">6 700</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Монтаж кондиционера 12-18 БТЕ (5.0-7.0 КВт)</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">7 700</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Монтаж наружного блока кондиционера</td>\r\n<td class="xl73" style="text-align: center;">шт.</td>\r\n<td class="xl74" style="text-align: center;">3 300</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40"><strong>Демонтаж кондиционера</strong><br />Стоимость демонтажа кондиционера составляет 70% от стоимости монтажа</td>\r\n<td class="xl73" style="text-align: center;">шт.</td>\r\n<td class="xl74" style="text-align: center;">договорная</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- указанна стоимость стандартного монтажа кондиционера (длинна трассы не более 5 метров);<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>', '', '');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `alias`, `for_price`, `sidebar_top`, `sidebar_top_title`) VALUES
(60, 'Дизайн интерьеров', 3, 83, 84, '2012-08-07 09:36:49', 1, 0, '<p style="text-align: justify;">Оформление интерьера с помощью флуоресцентных красок &ndash; это новое креативное направление в области художественного дизайна. Такой материал, как светящиеся в темноте краски, открывает безграничные возможности для реализации любых неординарных, смелых, творческих идей.<br /><br />Дизайн интерьера, выполненный специальными красками, светящимися в темноте, пользуется сегодня огромной популярностью. Такой дизайн произведет неизгладимое и незабываемое впечатление на любого, кто увидит подобное впервые. Любое помещение превращается в неповторимый мир, который оживает ночью, в ультрафиолетовом свете.<br /><br />Флуоресцентные краски абсолютно безвредны и могут быть использованы на любых поверхностях как внутри помещений, так и на улице. Для разных целей может быть использована как невидимая днем краска, так и краска, которая в дневное время будет выглядеть, как обычная художественная роспись. И в том и другом случае краска начинает светиться только при включенном ультрафиолетовом свете. Главная ее особенность заключается в том, что она не светится в темноте сама по себе. Выключая свет, эффект свечения в темноте исчезнет.<br /><br />Только представьте, как строгий интерьер в одно мгновение превращается в яркий и необычный сказочный ночной мир, и эта метаморфоза происходит у Вас на глазах, благодаря лишь одной флуоресцентной краске и световому оборудованию.<br /><br />Объемные светящиеся в темноте краски могут быть использованы для совершенно разных целей.<br /><br /><span style="color: #198cc2;"><strong>1. Роспись ресторана, кафе, боулинга, ночного клуба</strong></span>, оформленная флуоресцентными красками, способна выделить Ваше заведение из массы похожих друг на друга интерьеров. Это, несомненно, принесет владельцам наплыв посетителей и будет способствовать увеличению прибыли.<br /><br /><span style="color: #198cc2;"><strong>2. Роспись квартиры </strong></span>позволит создать уникальный дизайн интерьера и придаст Вашему жилищу неповторимую изюминку. Расписанная таким способом квартира становится поистине произведением искусства. На даче такую краску можно использовать для <em><strong>росписи беседки</strong></em> или <em><strong>летней террасы</strong></em>. Также флуоресцентными красками можно расписывать и <em><strong>мебель</strong></em> (деревянную или сделанную из МДФ).<br /><br /><span style="color: #198cc2;"><strong>3. Роспись детской комнаты</strong></span> способна превратить сказку в реальность. Детская комната, оформленная в таком стиле, станет незабываемым подарком Вашему малышу! Только представьте, как наяву оживает волшебный мир его любимых сказочных героев.<br /><br /><span style="color: #198cc2;"><strong>4. Роспись на улице </strong></span>предполагает использование специальной краски, которая обладает повышенной износостойкостью. Она применяется для декора бассейнов, облицовочного кирпича, тротуарной плитки и бордюров.<br /><br /><span style="color: #198cc2;"><strong>5. Роспись по металлу</strong></span> может быть применена в <em><strong>авто-тюнинге</strong></em>, использована в <em><strong>аэрографии</strong></em>, покраске автомобильных дисков. Ваше авто точно перестанет быть похожим на все остальные!</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '5d3285a1e444a81a7b724c24c2d45c34.jpg', 'dizajn-intererov', '', '', ''),
(65, 'Роспись интерьеров и авто', 3, 89, 90, '2012-08-07 09:36:49', 1, 0, '<p style="text-align: justify;"><img style="float: left; margin-top: 0px; margin-bottom: 0px; margin-left: 15px; margin-right: 15px;" src="../../../../upload/tiny/09-4.jpg" alt="" width="220" height="200" />Оформление интерьера с помощью флуоресцентных красок &ndash; это новое креативное направление в области художественного дизайна. Такой материал, как светящиеся в темноте краски, открывает безграничные возможности для реализации любых неординарных, смелых, творческих идей.</p>\r\n<p style="text-align: justify;">Дизайн интерьера, выполненный специальными красками, светящимися в темноте, пользуется сегодня огромной популярностью. Такой дизайн произведет неизгладимое и незабываемое впечатление на любого, кто увидит подобное впервые. Любое помещение превращается в неповторимый мир, который оживает ночью, в ультрафиолетовом свете.<br /><br />Флуоресцентные краски абсолютно безвредны и могут быть использованы на любых поверхностях как внутри помещений, так и на улице. Для разных целей может быть использована как невидимая днем краска, так и краска, которая в дневное время будет выглядеть, как обычная художественная роспись. И в том и другом случае краска начинает светиться только при включенном ультрафиолетовом свете. Главная ее особенность заключается в том, что она не светится в темноте сама по себе. Выключая свет, эффект свечения в темноте исчезнет.<br /><br />Только представьте, как строгий интерьер в одно мгновение превращается в яркий и необычный сказочный ночной мир, и эта метаморфоза происходит у Вас на глазах, благодаря лишь одной флуоресцентной краске и световому оборудованию.<br /><br />Объемные светящиеся в темноте краски могут быть использованы для совершенно разных целей.<br /><br /><span style="color: #198cc2;"><strong>1. Роспись ресторана, кафе, боулинга, ночного клуба</strong></span>, оформленная флуоресцентными красками, способна выделить Ваше заведение из массы похожих друг на друга интерьеров. Это, несомненно, принесет владельцам наплыв посетителей и будет способствовать увеличению прибыли.<br /><br /><span style="color: #198cc2;"><strong>2. Роспись квартиры </strong></span>позволит создать уникальный дизайн интерьера и придаст Вашему жилищу неповторимую изюминку. Расписанная таким способом квартира становится поистине произведением искусства. На даче такую краску можно использовать для <em><strong>росписи беседки</strong></em> или <em><strong>летней террасы</strong></em>. Также флуоресцентными красками можно расписывать и <em><strong>мебель</strong></em> (деревянную или сделанную из МДФ).<br /><br /><span style="color: #198cc2;"><strong>3. Роспись детской комнаты</strong></span> способна превратить сказку в реальность. Детская комната, оформленная в таком стиле, станет незабываемым подарком Вашему малышу! Только представьте, как наяву оживает волшебный мир его любимых сказочных героев.<br /><br /><span style="color: #198cc2;"><strong>4. Роспись на улице </strong></span>предполагает использование специальной краски, которая обладает повышенной износостойкостью. Она применяется для декора бассейнов, облицовочного кирпича, тротуарной плитки и бордюров.<br /><br /><span style="color: #198cc2;"><strong>5. Роспись по металлу</strong></span> может быть применена в <em><strong>авто-тюнинге</strong></em>, использована в <em><strong>аэрографии</strong></em>, покраске автомобильных дисков. Ваше авто точно перестанет быть похожим на все остальные!<br /><br /></p>\r\n<p style="text-align: justify;">&nbsp;<img src="../../../../upload/tiny/09-1.jpg" alt="" width="200" height="133" />&nbsp; <img src="../../../../upload/tiny/09-2.jpg" alt="" width="200" height="133" />&nbsp;&nbsp;<img src="../../../../upload/tiny/09-3.jpg" alt="" width="200" height="133" /></p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', NULL, 'rospis-intererov-i-avto', '', '', ''),
(12, 'Частным заказчикам', 2, 80, 91, '2012-08-07 09:36:49', 1, 0, '<p style="text-align: justify;">Услуги промышленного альпинизма могут потребоваться не только организациям, но и <strong>частным заказчикам</strong>. Когда использование обычных методов реализации задуманного затруднительно из-за высоты или труднодоступности объекта, технологии промышленного альпинизма могут стать единственным способом для реализации плана.</p>\r\n<p style="text-align: justify;">Кроме решения бытовых вопросов, мы с радостью окажем Вам услуги по доставке подарков Вашим близким самым необычным способом &ndash; через окно. Промышленные альпинисты поздравят Ваших любимых, передадут им от Вас самые теплые пожелания и вручат заранее приготовленный Вами сюрприз. Хотя само по себе <span style="color: #198cc2;"><strong>поздравление в окно</strong></span> &ndash; уже неожиданный и запоминающийся подарок. Удивите Ваших родных и близких!</p>\r\n<p style="text-align: justify;">К каждому нашему заказчику мы применяем индивидуальный подход. Выполнение заказов производится в удобное для заказчика время, оптимальные сроки, по разумным ценам и с учетом всех пожеланий клиента.</p>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;, руководствуясь наработанным опытом, подберут для Вас оптимальное решение по применяемым технологиям, согласуют график работ, обсудят детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '13beb6544f6d0caf57e2205653d951dd.jpg', 'private', '<p><strong>&nbsp;&nbsp; ОБЩАЯ ИНФОРМАЦИЯ<br /></strong></p>\r\n<table style="height: 176px; width: 600px; border-width: 1px; border-color: #000000; border-style: solid;" border="1" cellspacing="0" cellpadding="5"><colgroup><col width="775" /> <col span="2" width="89" /> </colgroup>\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr>\r\n<td class="xl68" width="775" height="48">Ремонт балконов</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Утепление квартир</td>\r\n<td class="xl69" style="text-align: center;">м.кв. </td>\r\n<td class="xl70" style="text-align: center;">от 1 100</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Установка антенн</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr>\r\n<td class="xl71" height="48">Доставка цветов в окно (стоимость подарка не входит в стоимость услуги)</td>\r\n<td class="xl69" style="text-align: center;">&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">от 4 000</td>\r\n</tr>\r\n<tr>\r\n<td class="xl72" height="40">Дод Мороз в окно</td>\r\n<td class="xl73" style="text-align: center;">&nbsp;</td>\r\n<td class="xl74" style="text-align: center;">от 10 000</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', ''),
(13, 'Мойка окон', 3, 3, 4, '2012-08-09 18:34:42', 1, 0, '<p style="text-align: justify;">Чистые окна и витрины &ndash; это лицо здания, поэтому <strong>стекломой</strong> &ndash; один из самых популярных видов работ на сегодняшний день в сфере промышленного альпинизма.<br />Мойка окон подразумевает не только мытье стекол, но и мытье откосов, подоконников и самих оконных рам с применением специальных очищающих и моющих средств, не оставляющих разводов, а также предотвращающих запыление и загрязнение уже чистой поверхности на длительный срок.<br />Технологии промышленного альпинизма широко применяются также при мойке зданий с панорамным остеклением, например торгово-развлекательных комплексов, облицованных помещений складов, стеклянных крыш переходов, витражей и зеркальных куполов и многих других объектов недвижимости.</p>\r\n<p style="text-align: justify;">Мойка остекленных поверхностей может быть осуществлена следующими способами.</p>\r\n<div>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ручная мойка</strong></span> предполагает использование моющего средства, скребка, шубки и сгона (склиза). Данный вид мытья применяется при небольшой площади работ и невысокой степени загрязнения.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Автоматизированная мойка</strong></span> производится с помощью мобильного аппарата высокого давления (АВД) при работе с большими объемами остекленных поверхностей. В аппарате струя воды подается из шланга под давлением, что позволяет очистить стеклянную поверхность легко и быстро не только от грязи и пыли, но также и от остатков скотча, краски, клея и т.д.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Мойка окон с помощью автовышки</strong></span> проводится в том случае, когда стандартная мойка не доступна с земли, или у альпинистов нет возможности добраться до очищаемой поверхности сверху (например, при мойке поверхностей с углом наклона в сторону фасада здания). Аренда автовышки позволяет ускорить ход работ за счет быстроты ее установки и перемещения и, безусловно, создает более безопасные условия труда для мойщиков, находящихся в люльке.</p>\r\n<p style="text-align: center;"><img src="../../../../upload/tiny/01_01_01.jpg" alt="" width="200" height="133" />&nbsp; &nbsp;<img src="../../../../upload/tiny/01_01_02.jpg" alt="" width="200" height="133" /> &nbsp;&nbsp;<img src="../../../../upload/tiny/01_01_03.jpg" alt="" width="200" height="133" /></p>\r\n</div>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /></strong><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><em>&nbsp;</em><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '45d9ac72c332ea5f58ce9b824db2a049.jpg', 'mojka-okon', '', '<p style="text-align: center;">Группа компаний &laquo;Альпинисты Москвы&raquo;<br />с радостью поможет помыть окна Вашего здания! Это одна из самых востребованных услуг в сфере промышленного альпинизма.<br />Мы также занимаемся полировкой фасадного остекления. Ваш фасад будет защищен от оседания пыли и грязи длительное время.<br />Мы быстро и качественно проведем для Вас комплексные работы по мойке стекол.</p>\r\n<p style="text-align: center;"><strong>ПОЗВОНИТЕ НАМ!</strong><br /> Мы возьмем на себя Ваши заботы!</p>', 'МОЙКА ОКОН'),
(14, 'Мойка фасадов', 3, 5, 6, '2012-08-09 18:35:38', 1, 0, '<p style="text-align: justify;">В крупном городе воздух всегда загрязнен пылью, копотью, выхлопами, которые оседают на стенах домов. Кроме этого со временем на фасадах появляются высолы, ускоряющие разрушение здания.<br /><strong>Мойка фасада</strong> - одна из наиболее распространенных услуг, оказываемых промышленными альпинистами. Фасад &ndash; это лицо здания, поэтому его внешнему виду следует уделять особое внимание. Мойка здания обязательно выполняется перед ремонтными работами на фасаде. При помощи технологий промальпа можно очистить стены здания даже в труднодоступных местах.</p>\r\n<p style="text-align: justify;">Мойка фасадов производится <span style="text-decoration: underline;">следующими способами</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Химическая ручная мойка</strong></span> применяется, прежде всего, для <a href="../../../../chapter/15">устранения высолов</a>. Чтобы через небольшой промежуток времени соли не выступили вновь и мойку фасада не пришлось повторять, рекомендуется провести <a href="../../../../chapter/gidrofobizatsija-fasada">гидрофобизацию</a> здания. Стены, обработанные специальным составом, будут устойчивы к проникновению влаги и способны отторгать грязь.<span style="color: #198cc2;">&nbsp;</span></p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Автоматизированная мойка </strong></span>с использованием аппарата высокого давления (АВД) в короткие сроки избавит поверхность здания от въевшейся грязи, копоти, городского смога. Особенно это актуально для зданий и сооружений, находящихся вблизи оживленных дорог. Автоматизированная мойка незаменима в случае, если фасад необходимо подготовить к дальнейшей покраске. Подаваемая под большим давлением вода зачистит стены от плохо держащейся штукатурки или полностью удалит ее. С помощью автомойки производится также разделка и зачистка межплитных швов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Мойка фасадов с применением автовышки </strong></span>производится в том случае, если выполнить работу только силами промышленных альпинистов не представляется возможным, например, на фасадах со сложной архитектурой (козырьки, колонны, крышные надстройки, лепнина).&nbsp;</p>\r\n<p style="text-align: center;"><img src="../../../../upload/tiny/cleaning/01_02_01.jpg" alt="" width="200" height="133" />&nbsp; &nbsp;<img src="../../../../upload/tiny/cleaning/01_02_02.jpg" alt="" width="200" height="133" />&nbsp; &nbsp;<img src="../../../../upload/tiny/cleaning/01_02_03.jpg" alt="" width="200" height="133" /></p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /></strong><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><em>&nbsp;</em><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'e2a543413ea78537488ee3f65c1d55af.jpg', 'mojka-fasadov', '', '<p style="text-align: center;">Промышленная группа &laquo;Альпинисты Москвы&raquo; выполнит для Вас любые работы по мойке фасадов. Мы удалим с фасада накопившуюся копоть и грязь, удалим высолы и отполируем фасад. Мойка фасадов &ndash; это эффективный способ сохранить эстетичный внешний облик здания и поддержать его долговечность. Услуги промышленного альпинизма в разы сократят Ваши затраты по обслуживанию здания.<br /><br /><strong>ПОЗВОНИТЕ НАМ!</strong><br /> Мы возьмем на себя Ваши заботы!</p>', 'МОЙКА ФАСАДОВ'),
(15, 'Очистка фасада', 3, 9, 10, '2012-07-31 17:11:27', 1, 0, '<p style="text-align: justify;"><strong>Очистка фасада</strong> &ndash; это та необходимая услуга, которая позволит поддержать привлекательность здания и одновременно поможет отодвинуть время проведения его ремонта. Говоря об очистке фасада, важно понимать, что она представляет собой целый комплекс отдельно взятых работ по приведению внешнего вида здания в надлежащее состояние.<br />В перечень фасадных работ по очистке входят следующие работы.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Пескоструйная чистка</strong></span>&nbsp;основана на обработке различных поверхностей абразивными материалами, подаваемыми из сопла под давлением воздушного потока. Преимущество пескоструйного аппарата в том, что он эффективно и быстро удаляет любые виды загрязнений и покрытий (например, лакокрасочные материалы, окалину, ржавчину) с любого типа поверхностей (кирпичная стена, металлоконструкции, бетон и проч.). Недостаток этой технологии заключается в том, что ее применение невозможно на исторических зданиях, работы с которыми приравниваются к реставрационным.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Удаление грибкового налета и плесени</strong></span>&nbsp;представляет собой лечение и защиту поверхности фасада от заражения спорами. Подобные меры позволяют сохранить прочность стен и в дальнейшем предотвратить их разрушение.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Удаление граффити</strong></span> начинается с нанесения специального состава на испачканную поверхность, который способен провести глубокую очистку даже сильно пористых материалов. В дальнейшем проводится дополнительная химическая антивандальная обработка стен, что не позволяет краске из баллончиков закрепиться на обработанной поверхности и помогает предотвратить проникновение красителя в структуру фасада.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Удаление высолов</strong></span>&nbsp;одна из наиболее востребованных услуг в сфере промышленного альпинизма. Размытые белесые пятна выступающей соли на поверхности фасада не только портят его внешний вид, но и могут стать причиной разрушения части конструкции здания. Удаление кристаллизованных солевых пятен производится жесткими металлическими щетками с применением определенных химических средств. Для предотвращения их повторного появления желательно проводить <strong><a href="../../../../chapter/gidrofobizatsija-fasada">гидрофобизацию фасада</a></strong>.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '526810b3d95ce7bf32536aaead2639f7.jpg', 'ochistka-fasada', '', '', ''),
(16, 'Ремонт фасада', 3, 11, 12, '2012-07-26 18:17:51', 1, 0, '<div>\r\n<p style="text-align: justify;">Любой фасад стареет и разрушается под воздействием многочисленных негативных факторов, со временем на стенах появляются сырые пятна, отшелушивается краска, могут образовываться трещины. Своевременный <strong>ремонт фасада</strong> поможет продлить сроки эксплуатации всего здания в целом, что существенно увеличит долговечность постройки.&nbsp;</p>\r\n<p style="text-align: justify;">Ремонтные работы на фасаде различаются, прежде всего, по типам фасадов.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ремонт вентилируемого фасада</strong></span>&nbsp;начинается с демонтажа декоративной плитки, демонтажа утеплителя, регулировки направляющих или замены отдельных частей крепежной системы. Сборка ветфасада производится в обратном порядке &ndash; сначала осуществляется монтаж металлических конструкций фасадной системы, затем на стену крепится утеплитель (если это предусмотрено). По окончании на металлическую основу монтируется <a href="../../../../chapter/restavratsija-fasada">декоративная облицовка</a>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Ремонт <span style="color: #198cc2;"><strong>&laquo;мокрого&raquo;</strong></span>&nbsp;фасада</strong></span> подразумевает, прежде всего, демонтаж старой штукатурки и краски. Если на стенах имеются трещины, необходимо провести их расшивку и заделку специальным химическим составом на силиконовой основе. Далее происходит оштукатуривание стены (обычное или по сетке). Следующим слоем укладывается шпаклевка, после чего производится зачистка и огрунтовка поверхности. Последним слоем на подготовленный фасад наносится краска (обычно в 2 слоя).&nbsp;</p>\r\n<p style="text-align: justify;">Стоит отметить, что монтажные работы на вентфасадах можно проводить круглый год, тогда как штукатурные и малярные работы на &laquo;мокрых&raquo; фасадах возможно проводить лишь при благоприятных погодных условиях при отсутствии осадков.&nbsp;</p>\r\n<p style="text-align: justify;">Сложность ремонта фасада зависит от степени его изношенности.<br /><br /><span style="color: #198cc2;"><strong>1. Капитальный ремонт фасада</strong></span> проводится в том случае, если разрушения составляют от 30% от общей площади поверхности здания. Такие фасадные работы носят, как правило, длительный характер и делятся на большое количество отдельных этапов.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Косметический ремонт фасада</strong></span>&nbsp;заключается, прежде всего, в реставрации фасадного покрытия, <a href="../../../../chapter/pokraska-fasada">покраске фасада</a>, восстановлении рисунка на фасаде здания и т.п.</p>\r\n</div>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></strong></p>\r\n<p style="text-align: center;">&nbsp; Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '496b2fd54b4dc2157c966edd0b0a20b9.jpg', 'remont-fasada', '', '', ''),
(19, 'Бытовые работы', 3, 81, 82, '2012-08-07 09:36:49', 1, 0, '<p style="text-align: justify;">Промышленный альпинизм незаменим там, где речь идет об улучшении качества жизни людей, о благоустройстве жилища, о комфорте и удобстве. Многие <strong>бытовые работы</strong> могут быть проведены только с помощью специалистов, работающих на высоте. Потребность в выполнении таких работ может возникнуть в <span style="text-decoration: underline;">разных ситуациях</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Утепление квартир</strong></span> является достаточно частым заказом для промышленных альпинистов. Герметизация межпанельных швов позволит сохранить тепло в доме, снизит затраты на отопление, избавит Вашу квартиру от сырости и промерзания стен. Наружное утепление фасада с использованием теплоизоляционных плит станет дополнительным шагом на пути к сокращению потери тепла, особенно в зимний период.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Установка спутниковых антенн</strong></span> часто сопряжена с необходимостью укрепления самой тарелки в таком месте, куда не добраться без помощи соответствующего специалиста. В том случае, если антенна монтируется непосредственно рядом с окном или балконом квартиры, необходимо произвести надежное крепление оборудования. Если тарелка крепится на крыше, то провода, ведущие от крыши здания непосредственно в квартиру, закрепляются на всей протяженности стены здания жгутами на анкера.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Установка кондиционеров</strong></span> бывает невозможна без привлечения специалистов, способных работать на высоте. Монтаж наружных блоков не должен производиться изнутри, как иногда это происходит, так как это очень опасно.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Устройство крыш на балконе</strong></span> начинается с монтажа металлического каркаса. Затем на собранные металлические фермы монтируется основание кровли, производится ее герметизация, сверху крепится кровельное покрытие. Обшивка наружной стороны балкона может быть дополнительно укреплена и утеплена по желанию заказчика. После этого уже возможна установка окон.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Подъем грузов</strong></span> с привлечением промышленных альпинистов производится в том случае, если доставка до квартиры обычным способом невозможна. Например, в дверные проемы не всегда проходит светозвуковое оборудование, дорогая крупная мебель, ванны для джакузи или большой холодильник. Правильно организованные такелажные работы помогут решить эту проблему.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '0d87c13569cb444f2f7f7237c1484db3.jpg', NULL, '', '', '');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `alias`, `for_price`, `sidebar_top`, `sidebar_top_title`) VALUES
(22, 'Покраска фасада', 3, 13, 14, '2012-08-07 11:28:37', 1, 0, '<p style="text-align: justify;"><strong><img src="../../../../upload/tiny/02_03.jpg" alt="" />Покраска фасада</strong> является самым популярным и экономичным способом отделки фасадов. Данная услуга в сфере промышленного альпинизма всегда была и остается самой востребованной. Своевременно проведенная окраска поверхности фасада защитит здание от агрессивного воздействия внешней среды (ветер, дождь, смена температур) и поможет освежить его внешний вид.</p>\r\n<p style="text-align: justify;">Перед началом работ определяется тип поверхности фасада, проводится анализ состояния поверхности, определяются типы разрушений. Предварительно может быть осуществлена <a href="../../../../chapter/ochistka-fasada">очистка фасада</a>. При необходимости проводится оштукатуривание фасада, выравнивание основания и огрунтовка. После чего осуществляется непосредственно окраска фасада.&nbsp;</p>\r\n<p style="text-align: justify;">Виды работ по покраске фасада различаются в зависимости от типа постройки.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Фасады исторических зданий</strong></span>&nbsp;нуждаются в деликатном восстановлении. Окраска фасада такого типа порой является единственно возможным способом уберечь здание от разрушений. Такие работы часто приравниваются к&nbsp;<a href="../../../../chapter/restavratsija-fasada">реставрационным</a>. Окраска фасада проводятся с учетом палитры красок, используемых на фасадах соседних зданий, с целью соблюдения единства архитектурного пространства исторического центра города.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Фасады высотных зданий</strong></span>&nbsp;могут быть покрашены методом сплошной окраски. Современным городам не хватает ярких цветов, промышленные альпинисты смогут провести работы по покраске высотных зданий там, где невозможна установка лесов. Работы могут быть выполнены разными красками по желанию заказчика.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Художественная роспись на фасаде</strong></span>&nbsp;в последнее время становится очень востребованной услугой. Часто владельцы ресторанов и кафе стремятся выделить свое здание из общей массы окружающих его архитектурных построек.&nbsp;Рисунок на фасаде здания&nbsp;привлечет к себе внимание прохожих, а значит, и новых посетителей и клиентов. Художественное оформление фасада выполняется профессиональными художниками в согласовании с пожеланиями заказчика.</p>\r\n<p style="text-align: justify;"><img src="../../../../upload/tiny/1.jpg" alt="" width="150" height="150" />&nbsp;&nbsp;<img src="../../../../upload/tiny/2.jpg" alt="" width="150" height="150" /> &nbsp; <img src="../../../../upload/tiny/3.jpg" alt="" width="150" height="150" />&nbsp;&nbsp;<img src="../../../../upload/tiny/4.jpg" alt="" width="150" height="150" /></p>\r\n<hr />\r\n<p style="text-align: center;"><strong><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /></strong><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <span style="font-size: large;">бесплатно!</span></span><em>&nbsp;</em><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em><em><br /></em></p>', 'c89efb2274ef45172654fcdcb7e82c61.jpg', 'pokraska-fasada', '', '', ''),
(62, 'Замена стекол', 3, 23, 24, '2012-07-27 11:49:06', 1, 0, '<p><strong>Замена стекол зданий</strong> может быть необходима в случае, когда стекло было повреждено и треснуло или же совсем выпало из рамы или отсоединилось от крепежных элементов. В последнее время очень популярным становится безрамное остекление как офисных зданий, так и частных квартир (в частности, панорамное остекление балконов). Панорамным остеклением принято называть окна размером во всю стену, то есть от пола до потолка. Такой тип остекления делает строение легким, прозрачным, почти невесомым.&nbsp;</p>\r\n<p>Перед выполнением работ по замене стекол производится замер деталей, которые необходимо заменить. Специалисты промышленного альпинизма поднимут стекло на нужную высоту, осуществят монтаж нового стеклопакета, при необходимости произведут <a href="../../../../chapter/germetizatsija-shvov">герметизацию швов</a>.&nbsp;</p>\r\n<p>Различные вида остекления применяются в гражданском и промышленном строительстве. Работы по замене стекол можно сгруппировать следующим образом.&nbsp;</p>\r\n<p><span style="color: #198cc2;"><strong>1. Замена стекол административных зданий</strong></span>&nbsp;&ndash; это, прежде всего, работы на остекленных фасадах. В современных фасадных конструкциях облицовка стеклом очень популярна. Стекла в таких конструкциях закрепляются с помощью специальных удерживающих профилей.&nbsp;</p>\r\n<p><span style="color: #198cc2;"><strong>2. Замена стеклопакетов в домах</strong></span>&nbsp;может потребоваться жителям частного сектора. Часто мансардное остекление повреждается в зимний период, стекло трескается под давлением накапливающейся снежной массы. Работы по замене и герметизации таких стеклопакетов выполняются промышленными альпинистами без затруднений.&nbsp;</p>\r\n<p><span style="color: #198cc2;"><strong>3. Замена панорамного остекления </strong></span>и <span style="color: #198cc2;"><strong>замена витрин</strong></span> особенно востребованы в автосалонах, банках, магазинных, для которых светопрозрачные конструкции являются одним из основных элементов привлечения клиентов. Разбитую витрину или поврежденное панорамное остекление бывает невозможно заменить с поверхности силами обычных рабочих. Громоздкие стекла поднимают на сильных присосках на нужную высоту, где их приемку и монтаж осуществляют промышленные альпинисты.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'ea96f5afcae67ed560b0163d638e03ba.jpg', 'zamena-stekol', '', '', ''),
(23, 'Реставрация и декор фасада', 3, 15, 16, '2012-07-27 11:22:37', 1, 0, '<p style="text-align: justify;"><strong>Реставрация фасадов</strong> считается одним из самых сложных и трудоемких работ в сфере промышленного альпинизма. Она требует большого опыта в воспроизведении декоративных элементов фасада и особенной аккуратности в работе с целью восстановления архитектурного облика здания с исторической точностью. Однако, <strong>декор фасада</strong> &ndash; это отличная возможность оформить и современное здание в оригинальном стиле, сделать его внешне привлекательным и неповторимым. В зависимости от вида фасада его реставрация, отделка и декорирование могут быть выполнена разными способами.</p>\r\n<p style="text-align: justify;"><strong>Декор мокрых фасадов</strong> включает в себя следующие виды работ.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Покраска фасада</strong></span>&nbsp;&ndash; один из недорогих и оригинальных способов отделки и восстановления фасадов.&nbsp;<a href="../../../../chapter/pokraska-fasada">Покраска фасада</a>&nbsp;производится специальными фасадными красками, устойчивыми к атмосферным явлениям. В летний период это один из наиболее востребованных типов работ в сфере промышленного альпинизма.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Декоративная штукатурка</strong></span> способна воплощать в жизнь любые решения дизайнеров и сделать любое здание поистине уникальным. Кроме эстетических функций, нанесенная на стену декоративная штукатурка визуально скрывает все неровности поверхности.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Лепнина</strong></span> является одним из самых заметных и благородных элементов декора фасада. Однако, лепнина выполненная из гипса, с течением времени изнашивается и разрушается, так как гипс сам по себе очень хрупкий материал. Реставрационные работы по восстановлению лепнины требуют особенно тщательного подхода и внимательности.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Декоративные элементы из пенопласта</strong></span>&nbsp;могут быть выполнены в самых разнообразных формах и стилях. Старинные колонны, пилястры, арки или современные отделки балконов, наличники и карнизы &ndash; все это может быть вырезано из пенополистирола. Благодаря своей легкости, изделия из пенопласта легко монтируются. Сверху такие элементы декора покрываются защитным слоем штукатурки и краски, что позволяет им сохранить долговечность, не уступая в этом отделке из гипса или бетона.&nbsp;</p>\r\n<p><strong>Декор вентилируемых фасадов</strong> подразумевает работы по установке и замене облицовки фасада.&nbsp;</p>\r\n<p><span style="color: #198cc2;"><strong>1. Облицовка фасада</strong></span> различными материалами выполняется на вентилируемых фасадах. Съемные панели крепятся поверх предварительно устанавливаемой фасадной системы. В качестве отделочного материала могут быть использованы панели из искусственного камня, керамогранита или стекла. Особенно часто такого рода декор используется в облицовке офисных зданий, складских помещений, торговых центров.&nbsp;</p>\r\n<p><span style="color: #198cc2;"><strong>2. Сайдинг</strong></span> представляет собой металлические профили сложной формы, включающие в себя сразу и элементы крепления. Облицованный таким способом фасад очень прочен и не горюч.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em><em><br /></em></p>', 'bda3798737cfd113c4fec5e7edf0080e.jpg', 'restavratsija-fasada', '', '', ''),
(61, 'Гидрофобизация фасада', 3, 21, 22, '2012-07-27 11:41:09', 1, 0, '<p style="text-align: justify;"><strong>Гидрофобизация</strong> &ndash; это обработка поверхности специальными составами, благодаря которым ей придаются водоотталкивающие свойства. Гидрофобизаторы служат барьером, препятствующим проникновению влаги в толщу материала: вода просто скатывается с обработанной поверхности стен. Такая обработка способствует увеличению прочности стен, уменьшению оседания пыли и грязи, появлению эффекта самоочищения, так как осевшая грязь легко смывается дождевой водой.</p>\r\n<p style="text-align: justify;">Гидрофобизаторы создают водоотталкивающий эффект на любых фасадах &ndash; на бетоне, минеральной штукатурке, песчанике, натуральном камне и силикатном кирпиче, гидрофобными смесями также можно обрабатывать и деревянные конструкции (например, пропитка основания кровли дома предотвратит гниение дерева).</p>\r\n<p style="text-align: justify;">Гидрофобизация стен способна решить проблему появления белого налета на поверхности здания. Перед нанесением гидрофобизатора необходимо провести <a href="../../../../chapter/mojka-fasadov">мойку</a> и <a href="../../../../chapter/ochistka-fasada">очистку фасада</a> здания от уже имеющихся загрязнений и высолов.Кроме создания защитного барьера от проникновения воды, гидрофобизация позволяет повысить антикоррозийную стойкость материалов, увеличивает срок службы окрашенных стен, предотвращает рост грибка и плесени на поверхности фасада.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'ca50b233f654b06063b090b1081815b8.jpg', 'gidrofobizatsija-fasada', '', '', ''),
(24, 'Утепление фасада', 3, 17, 18, '2012-07-27 11:36:25', 1, 0, '<div>\r\n<p style="text-align: justify;">Кроме непосредственно <a href="../../../../chapter/remont-fasada">ремонтных фасадных работ</a>&nbsp;по желанию заказчика также могут быть выполнены работы по утеплению фасада. Теплоизоляционная система способна защитить строение от разрушений и перепадов температур, что позволит значительно увеличить срок его эксплуатации. Утепление стен современными материалами позволит не только сократить теплопотери и сэкономит средства на обогрев, но и повысит звукоизоляцию здания.&nbsp;</p>\r\n<p style="text-align: justify;"><strong>Утепление фасада</strong>&nbsp;можно разделить на две категории по видам фасадов.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Утепление вентилируемого фасада</strong></span>&nbsp;осуществляется по принципу &laquo;сэндвича&raquo;. После установки крепежной фасадной системы на несущую стену наклеиваются плиты утеплителя. Затем вся конструкция закрывается защитным слоем из облицовочного материала. Таким образом, создается наружная декоративная стена. Облицовочные панели крепятся к фасадной системе специальными заклепками, кляймерами или видимыми снаружи анкерами. Декоративный экран может быть изготовлен из различных материалов: металлических пластин, алюкобонда, керамогранита, облицовочного камня, стекла и т.д.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2<span style="color: #198cc2;"><strong>. Утепление &laquo;мокрого&raquo; фасада</strong></span></strong></span> начинается с подготовки стены к работам. Производится зачистка поверхности фасада, обработка проникающей грунтовкой, предназначенной для предохранения стен от загнивания. Затем на стены наносится специальный клей, на которой крепится термоизолирующая плита из минеральной ваты или пенополистирола с дополнительной фиксацией с помощью анкеров. После высыхания клея, утепляющий материал закрывается слоем выравнивающей штукатурки (по сетке или без). Далее штукатурный слой выравнивается, огрунтовывается и покрывается краской.&nbsp;</p>\r\n</div>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '9be76dc8d13fd46fe46b94a726d9ce38.jpg', 'uteplenie-fasada', '', '', ''),
(25, 'Герметизация швов', 3, 19, 20, '2012-07-27 11:36:37', 1, 0, '<div>\r\n<p style="text-align: justify;"><strong>Герметизация швов</strong>, прежде всего, направлена на защиту строения от продуваний и перепадов температур. Такого вида работы проводятся на фасадах любого типа. Швы и пустоты, образующиеся в оконных проемах, необходимо заделывать не только изнутри, но и снаружи, чтобы улучшить теплоизоляционные характеристики здания. Швы на остекленных оранжереях обязательно заделываются, чтобы не допустить проникновения влаги внутрь металлоконструкций.</p>\r\n<p style="text-align: justify;"><strong>Герметизация межпанельных швов</strong> способна надежно защитить Ваше жилище от холодного воздуха. При осадке здания и естественном расширении строительного материала при смене температур нужно свободное пространство, чтобы стены не разрушились. Это объясняет обязательное наличие межпанельных швов в любой постройке. Однако, наличие межпанельных швов становится причиной для проникновения в помещение влаги, сырости, ветра, а иногда даже понижения температур до отрицательных значений. Совместить теплоизоляцию и гибкость помогут эластичные герметики на силиконовой основе.</p>\r\n<p style="text-align: justify;">Существуют две основные технологии заделки швов.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Открытый шов (первичная герметизация открытых стыков).</strong></span> Этот термин применятся, когда необходимо вскрыть старый шов и провести новую герметизацию. Для этого отслуживший и потрескавшийся герметик удаляют и зачищают полость от старого утеплителя. Затем шов покрывается монтажной пеной, пена служит для заполнения пустот и уплотнения шва. Поверх пены закладывается вилатерм &ndash; специальный утепляющий материал. После этого производится конечная обработка эластичным герметиком, который служит для гидроизоляции шва.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Шов закрыт (вторичная герметизация или ремонт шва).</strong></span> При данном виде работы вскрытие шва не предполагается, а производится вторичная промазка трещин. По желанию заказчика в швах могут быть засверлены отверстия, через которые внутренняя полость шва дополнительно утепляется монтажной пеной, после чего накладывается эластичная мастика, как и в случае с первичной герметизацией.</p>\r\n</div>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'cb89ca993bee2d71301cb3db5aa978c2.jpg', 'germetizatsija-shvov', '', '', ''),
(26, 'Монтаж кровли', 3, 27, 28, '2012-07-27 15:01:59', 1, 0, '<div>\r\n<p style="text-align: justify;">Надежность и долговечность крыши, прежде всего, обеспечивает правильно выполненный <strong>монтаж кровли</strong>. Главной частью всей конструкции кровли является стропильная система. Стропила служат опорой для самой кровли и защитой от давления снега и ветра. Стропильную систему конструируют индивидуально под каждый проект, просчитывая все параметры: какой кровельный материал будет использоваться, в каких климатических условия будет эксплуатироваться крыша и т.п. Все внутренние элементы кровли &ndash; паро- и гидроизоляция, акустическая, тепловая и пожарная изоляция &ndash; должны учитывать тип строения, его дизайн, обеспечивать надежную защиту от теплопотерь и образования конденсата, достаточную вентиляцию подкровельного пространства. Герметизация и обустройство водосточной системы также являются необходимыми этапами в работе по монтажу кровли. Завершает монтаж кровли настил предварительно выбранного кровельного покрытия.&nbsp;</p>\r\n<p style="text-align: justify;">Тип монтажа кровельного полотна можно условно разделить по типу покрытий кровли.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Монтаж жесткой кровли</strong></span>&nbsp;представляет собой наборное (штучное, листовое) покрытие крыши. Это оптимальный вариант для создания качественного и долговечного кровельного покрытия, не требующего специального ухода и частого ремонта. К жестким кровлям относятся профнастил, фальцевая кровля, металлочерепица, еврошифер, кровля из оцинкованной стали и т.д. Жесткое кровельное покрытие широко применяется в малоэтажном строительстве домов коттеджного типа, многоэтажных жилых и общественных зданий, а также для производственных сооружений, в том числе для крыш со сложной формой.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Монтаж мягкой кровли</strong></span>&nbsp;- это условное название конструкции водоизоляционного ковра, для устройства которого применяются рулонные материалы, полимерные мембраны, различные мастики. Эти варианты кровли идеально подходят для плоских крыш. Здесь кровельный материал раскатывается на предварительно подготовленное основание. Для скатных крыш часто используется гибкая кровельная плитка (мягкая битумная черепица).</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n</div>', 'f1d1376cf832fd3f546092289506532b.jpg', 'montazh-krovli', '', '', ''),
(27, 'Ремонт кровли', 3, 29, 30, '2012-07-27 15:02:18', 1, 0, '<p style="text-align: justify;">По прошествии определенного времени любому зданию или сооружению может потребоваться <strong>ремонт кровли</strong>. Преждевременный износ и разрушение кровли могут быть связаны как с естественными причинами (воздействие окружающей среды), так и с повреждениями кровельного покрытия механическим путем (например, во время зимней уборки снега). Кровля также может деформироваться в силу того, что при ее монтаже мог быть допущен брак, или неверными оказались расчеты конструкции кровли, в результате чего она несла нагрузки, превышающие допустимые нормы прочности материала.</p>\r\n<p style="text-align: justify;">В зависимости от силы повреждений может быть произведен различный по типу <span style="text-decoration: underline;">ремонт кровли</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Капитальный ремонт кровли</strong></span> предусматривает демонтаж старого износившегося покрытия и замену его на новое, ремонт и замену стяжки, гидроизоляцию кровли, ее утепление.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Текущий ремонт кровли</strong> </span>(местный или точечный ремонт) предусматривает установку заплат с частичной заменой кровельного материала, окраску и герметизацию поверхности кровли.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Аварийный ремонт кровли</strong></span> производится чаще всего для устранения локальных протечек и подержания кровли в нормальном для эксплуатации состоянии. При ремонте кровли возможна также замена водоприемных воронок, восстановление и замена карнизных свесов и покрытий парапетов.</p>\r\n<p style="text-align: justify;"><span style="color: #000000;"><strong><em>Ремонт жесткой кровли</em></strong></span> очень часто связан не просто с заменой листов или установкой заплаток, но и с частичной заменой материалов кровельного &laquo;пирога&raquo;, так как при деформации внешнего металлического покрытия возможно повреждение внутренних слоев теплоизолятора и нарушение герметизации. Деформация кровли может и не повлечь за собой протечку, однако на кровлях из металла может возникнуть ржавчина. В этом случае производится зачистка листов с их последующей оцинковкой и покраской.</p>\r\n<p style="text-align: justify;"><span style="color: #000000;"><strong><em>Ремонт мягкой кровли</em></strong></span> предусматривает устранение трещин и вздутий, механических повреждений и порывов покрытия, вскрытие пузырей и воздушных мешков, ремонт мест примыканий к элементам конструкций здания при отслоении материала, огрунтовку старого кровельного ковра и укладку новых слоев кровельного материала.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '2c989ccd122c53adb77ea950023e25a0.jpg', 'remont-krovli', '', '', ''),
(28, 'Герметизация кровли', 3, 31, 32, '2012-07-27 15:01:38', 1, 0, '<div>\r\n<p><strong>Герметизация кровли</strong> является одним из самых важных этапов в процессе ее укладки, особенно в местах соединений кровельного полотна и на стыках кровли с деталями крыши (дымоходом, системой вентиляции, антенной). При эксплуатации крайне важна надежная защита от протеканий, так как кровля постоянно подвергается влиянию атмосферных осадков, ультрафиолетовых лучей, ветра.&nbsp;</p>\r\n<p>Герметизация кровли происходит в несколько этапов в зависимости от вида кровельного покрытия, масштаба разрушения кровли, уровня сложности крыши. Прежде всего, происходит осмотр типов повреждений или мест протечки, затем производится частичный демонтаж кровельного покрытия, зачистка ржавчины, очистка поверхности крыши от остатков краски, грязи, пыли. После на очищенную поверхность наносятся специальные герметики и мастики, возможно также использование фольгированной ленты.</p>\r\n<p><em><strong>Кровельный герметик</strong></em> или <em><strong>герметизирующая мастика</strong></em> широко применяются для уплотнения мягкого кровельного покрытия &ndash; толи, гибкой черепицы и т.д. Такая бесшовная герметизация имеет ряд преимуществ: высокая эластичность, быстрое холодное нанесение, хорошие звукоизоляционные свойства, устойчивость к резким перепадам температур, устойчивость к кислотам и щелочам, возможность работы по влажному основанию, долговечность.</p>\r\n<p>Мы оказываем следующие услуги по герметизации кровли.</p>\r\n</div>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Герметизация жесткой кровли</strong></span> необходима чаще всего в случаях негерметичного сопряжения отдельных элементов кровли. Гидроизоляция жестких кровельных покрытий требует применения особых материалов - пластичных, не подверженных растрескиванию и выкрашиванию, а также стойких к атмосферным явлениям. Отдельное внимание уделяется тщательной подготовке поверхности кровли под герметизацию, так как важно, чтобы в дальнейшем герметик не отслаивался.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Герметизация мягкой кровли</strong></span> возможна без применения дополнительных герметиков. Технология ремонта заключается в прогреве кровельного ковра до поверхности стяжки термоспекателями (тепловой поток без применения открытого огня), с удалением вздутий, водяных пузырей, трещин, разрывов и т.д. и превращения его в единый монолитный слой.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Наливная кровля</strong></span> &ndash; очень хороший вариант для гидроизоляции плоской кровли. Это покрытие позволяет качественно и на долгий срок обеспечить защиту кровли от проникновения воды. После застывания мастики покрытие выглядит как монолитный, резиновый ковер. Наливная кровля паропроницаема, устойчива к ультрафиолету, агрессивным средам и большим перепадам температур.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong></strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '3475a806c2b221408cb1210cea88f192.jpg', 'germetizatsija-krovli', '', '', ''),
(63, 'Установка заборов', 3, 85, 86, '2012-08-07 09:36:49', 1, 0, NULL, NULL, 'zabory', '', '', ''),
(64, 'Необычные поздравления в окно', 3, 87, 88, '2012-08-07 09:36:49', 1, 0, NULL, NULL, 'pozdravlenija-v-okno', '', '', '');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `alias`, `for_price`, `sidebar_top`, `sidebar_top_title`) VALUES
(29, 'Безопасность кровли', 3, 33, 34, '2012-07-27 15:03:12', 1, 0, '<div>\r\n<p style="text-align: justify;">При эксплуатации кровли необходимость выхода на крышу возникает достаточно часто (для очистки от снега и наледи, установки и обслуживания антенн, чистки дымоходов, водосточной и вентиляционной системы, для выполнения ремонтных работ и т.п.). Поэтому очень важно иметь возможность легко и беспрепятственно перемещаться по всей ее поверхности. Каждый такой выход сопряжен с вероятностью падения людей. <strong>Элементы безопасности кровли</strong> помогут сократить риск при работе на высоте и обеспечат сохранность и длительность эксплуатации кровли.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ограждение кровли</strong></span>&nbsp;является обязательным элементом для любых типов крыш (плоские или скатные). Главное требование &ndash; это прочность и надежность, так как в случае критической ситуации кровельное ограждение должно будет выдержать значительную нагрузку, чтобы предотвратить несчастный случай.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Кровельные лестницы</strong></span>&nbsp;используются для обеспечения доступа к каминным и печным трубам и антеннам. <em><strong>Лестницы на скат</strong></em> позволяют передвигаться вверх и вниз по кровле, чтобы не нанести кровельному полотну повреждений и избежать прогибов кровли. <em><strong>Пристенные лестницы</strong></em> предназначены для безопасного подъема на кровлю. В том месте, где пристенная лестница переходит в кровельную, обязательно устанавливаются поручни.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Лестницы на купол</strong></span>&nbsp;представляют собой специальную мобильную систему, которая крепится на опорных округлых рельсах и может перемещаться вдоль всей поверхности купола на прорезиненных катках. Использование такой системы идеально для надземных переходов, атриумов или зданий с площадками панорамного обозрения. Они облегчат выполнение текущих монтажных и ремонтных работ, связанных с остеклением, электрификацией, кондиционированием и т.д.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Переходные мостики</strong></span>&nbsp;значительно упрощают перемещение по скатным крышам. Они могут быть установлены вдоль всей кровли параллельно карнизу. Установка переходных мостиков способна предотвратить деформацию и повреждения кровельного покрытия, что, несомненно, поддержит гидроизоляционные свойства кровли.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Снегозадержатели</strong></span> на кровле нужны для того, чтобы в период таяния снега предотвратить его лавинообразный сход. Они могут быть закреплены на кровле в ряд или в шахматном порядке &ndash; в зависимости от интенсивности выпадения снега в конкретном регионе. Обязательно необходимо устанавливать снегозадержатели над пешеходными дорожками, в местах парковки автотранспорта, над крыльцом или козырьком здания, над мансардными окнами.</p>\r\n</div>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br /></strong>Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'bb7b731d6ddeaa79cfb19b435297aa74.jpg', 'bezopasnost-krovli', '', '', ''),
(30, 'Обслуживание водостоков', 3, 35, 36, '2012-07-27 15:01:01', 1, 0, '<div>\r\n<p style="text-align: justify;"><strong>Замена желобов</strong> и <strong>ремонт водостока</strong> может понадобиться как новом доме, так и в давно построенном. Листья и другой мусор попадают в желоба, засоряя воронки и водосточные трубы. Это может нарушить работу всей водосточной системы, если желоба провиснут, и течение воды замедлится, произойдет застой воды. В свою очередь это может вызвать разгерметизацию или даже повреждение желобов. Кроме того опасность представляет зимнее намерзание наледи на кромки водосточных желобов и водостоков, так как это создает дополнительные нагрузки на крепежную систему.&nbsp;</p>\r\n<p style="text-align: justify;">При нарушении целостности водосточной трубы ее элементы подлежат замене. Ремонт желобов может производиться как&nbsp;полностью, так и частично. Тип ремонтных работ зависит от материала, из которого собрана водоотводная система.<strong><br /></strong></p>\r\n</div>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ремонт металлических желобов </strong></span>чаще всего бывает спровоцирован появлением ржавчины. Для удаления небольших пятен используются жесткие проволочные щетки, для защиты от расширения пятен ржавчины используются специальные ингибиторы. После очистки на желоба наносится слой грунтовки и краски. Если речь идет о замене секции водоотводов, то новые металлические отрезки желобов соединяются между собой болтами и гайками, после чего стыки герметизируются с помощью эпоксидных материалов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Ремонт пластиковых желобов </strong></span>производится с помощью специального клея, который надежно спаивает части поврежденной конструкции между собой. Одно из главных преимуществ установки пластиковой системы водостока заключается в ее исключительной долговечности &ndash; такая система не подвержена влиянию температурных перепадов и выдерживает длительное воздействие ультрафиолетовых лучей.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br /></strong>Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'e5e48d30e9b95914906c83d6f06712f7.jpg', 'obsluzhivanie-vodostokov', '', '', ''),
(41, 'Металлоконструкции', 2, 38, 51, '2012-08-07 09:37:01', 1, 0, '<div>\r\n<p style="text-align: justify;">С развитием строительства в стране повышается спрос на различные объекты промышленного назначения. Многопрофильные <strong>металлоконструкции</strong>&nbsp;становятся неизменными спутниками нашей жизни, окружают нас повсюду, дают нам свет и тепло, соединяют между собой города и страны. Железнодорожные и автомобильные мосты, вышки линий электропередач, телевизионное и сценическое оборудование, обустройство спортивных площадок и стадионов, &ndash; эти и многие другие объекты можно объединить под одним термином &ndash; металлоконструкции.</p>\r\n<p style="text-align: justify;">В промышленном масштабе сооружение каждого из таких объектов является весьма дорогостоящим мероприятием. Чтобы поддержать их в рабочем состоянии как можно более длительное время, человеку нужно постоянно следить за их эксплуатационными характеристиками, вовремя проводить ремонт и комплексное обслуживание металлоконструкций.&nbsp;</p>\r\n<p style="text-align: justify;">Металлоконструкции, используемые нами в частной жизни, представляют собой большое разнообразие различных объектов. Это и зимние сады, возводимые на участках, это и каркасы зданий бассейнов, основы зданий торговых комплексов, помещения автосалонов и т.д.&nbsp;</p>\r\n<p style="text-align: justify;">Многие металлоконструкции имеют столь сложную конфигурацию, что добраться до отдельных мест, узлов, деталей бывает невозможно без специальной подготовки и снаряжения. Технологии промышленного альпинизма, пожалуй, единственный способ реализовать эти задачи. Опытные профессионалы, прошедшие соответствующую подготовку, помогут решить вопросы, связанные с приведением сооружения в рабочее состояние, его ремонтом, а если потребуется и поэтапным демонтажом.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n</div>', '4b729a6a0743251e2b569db8cdbf8e02.jpg', 'metall', '', '', ''),
(42, 'Монтаж металлоконструкций', 3, 39, 40, '2012-08-07 09:37:01', 1, 0, '<div>\r\n<p style="text-align: justify;">Металлоконструкции &ndash; это широкий круг изделий из металла и сплавов, которые используются в самых разных отраслях человеческой деятельности: при производстве и строительстве зданий, в хозяйственной сфере, в сфере торговли и т.п. В основе каркасных зданий лежит технология сборки конструктивных элементов непосредственно на месте строительства. <strong>Монтаж металлоконструкций</strong> &ndash; очень ответственное мероприятие в строительстве. От качества монтажных работ зависит надежность, безопасность и долговечность всего строения в целом.&nbsp;</p>\r\n<p style="text-align: justify;">При сборке металлоконструкций основным способом крепления деталей являются сварочные работы, но также используются соединения на болтах и заклепках. Собранный каркас обшивается снаружи каким-либо материалом (листовым поликарбонатом, металлосайдингом). Если строится теплое помещение &ndash; стены дополнительно утепляются и обшиваются изнутри.&nbsp;</p>\r\n<p style="text-align: justify;"><em><strong>Ремонт металлоконструкций</strong></em> производится посредством замены существенно изношенных металлических частей строения на новые. Также может производиться дополнительное усиление металлоконструкций без замены отдельных деталей.&nbsp;</p>\r\n<p style="text-align: justify;"><em><strong>Демонтаж металлоконструкций</strong></em> представляет собой процесс, точно обратный сборке. Он не имеет ничего общего с разрушением. На площадке производится разбор строения поэлементно. Задача состоит в том, чтобы не просто разобрать строение, но и перевезти его на новую площадку и там собрать вновь.&nbsp;</p>\r\n<p style="text-align: justify;">Услуги по монтажу металлоконструкций можно разделить по видам оборудования, требующего монтажа.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Монтаж телекоммуникационного оборудования</strong></span>&nbsp;предполагает, прежде всего, <a href="../../../../chapter/montazh-vyshek-sotovoj-svjazi">монтаж вышек сотовой связи</a>. К числу прочих относятся работы по монтажу теле- и радиооборудования, а также работы на вышках линий электропередач. Подобные работы требуют от монтажников не только навыков работы на высоте, но и обязывают иметь знания в части обращения с электричеством.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Монтаж промышленных зданий, монтаж ангаров</strong></span> и <span style="color: #198cc2;"><strong>монтаж складских помещений</strong></span> представляет собой монтаж металлических ферм, на которые впоследствии навешивается облицовка из листов металла или пластика, образуя таким образом целостную конструкцию.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Монтаж торговых павильонов</strong></span> и <span style="color: #198cc2;"><strong>монтаж атриумов</strong></span>&nbsp;подразумевает, кроме работы непосредственно с металлом, также и работу со стеклом. Современные конструкции из металла и стекла позволяют воплотить в жизнь самые смелые архитектурные решения.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Монтаж веранд, террас, оранжерей, бассейнов</strong></span> относится к работам в частном секторе. Оборудованные подобными конструкциями участки приносят своим владельцам радость и создают дополнительный уют.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n</div>', '3b2937699f63d2c77b55165447c2ccac.jpg', 'montazh-metallokonstruktsij', '', '', ''),
(43, 'Электромонтаж оборудования', 2, 52, 61, '2012-08-07 09:37:01', 1, 0, '<div>\r\n<p style="text-align: justify;"><strong>Электромонтажные работы</strong> считаются одними из самых опасных видов работ, так как они сопряжены с большими рисками для жизни и здоровья людей. Именно поэтому монтаж электрооборудования должен производиться только профессионалами. Доверьте нам работы по сборке и установке электромонтажного оборудования, и мы соберем электрошкаф в Вашем офисе, сможем организовать современное освещение в Вашем торговом павильоне, устраним неполадки в электропроводке в Вашем доме или квартире.&nbsp;</p>\r\n<p style="text-align: justify;">Технологии промышленного альпинизма также позволяют выполнять монтаж электрооборудования на высоте. Прежде всего, это касается работ по <a href="../../../../chapter/montazh-vyshek-sotovoj-svjazi">монтажу вышек сотовой связи</a>, установке оборудования на крышах домов, демонтажу башен и антенно-мачтовых сооружений. Мы также производим монтаж мобильных трибун и <a href="../../../../chapter/Oborudovanije-dlja-stsen">сценического оборудования</a>.&nbsp;</p>\r\n<p style="text-align: justify;">Электромонтажные работы в комплексе включают в себя прокладку электролиний, установку электротехнических приборов и устройств, подключение системы, а также обязательное заземление и молниезащиту оборудования. Мы проводим работу с нашими заказчиками как на инженерно-проектном уровне (т.е. непосредственно помогаем Вам разработать всю электросистему), так и на этапе составления схем с последующим монтажом по уже имеющимся у заказчика проектам.&nbsp;</p>\r\n<p style="text-align: justify;"><a href="../../../../chapter/sborka-elektricheskih-schitov">Сборка электрических щитов</a> любой сложности (офисные и квартирные щиты) производится в строгом соответствии с правилами устройства электроустановок и, конечно, со строгим соблюдением техники безопасности. Офисные, промышленные и квартирные щиты (ПР, ЩР, ВРУ, ГРЩ), щиты с автоматикой , системами контроля и управления собираются на комплектующих как российских, так и зарубежных производителей.&nbsp;</p>\r\n<p style="text-align: justify;">Мы также осуществляем пуско-наладочные работы, которые представляют собой целый комплекс отдельных мероприятий, связанных с проверкой и подготовкой всей электросистемы к дальнейшей работе. Специалисты производят замеры сопротивления изоляции, замеры сопротивления петли "фаза-ноль", прогрузку автоматических выключателей и т.д. Одним из важнейших условий является монтаж релейной защиты. По итогам замеров производится составление технических расчетов.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n</div>', '7d5746db758badada6ff5e99d706f8e9.jpg', 'electro', '', '', ''),
(44, 'Обеспыливание металла', 3, 41, 42, '2012-08-07 09:37:01', 1, 0, '<div>\r\n<p style="text-align: justify;">Обеспыливание металлоконструкций само по себе призвано не допустить превышения предельных норм содержания пыли в воздухе, что является фактором риска и прямой угрозой для здоровья людей. Важно понимать, что своевременно проведенные работы по обеспыливанию позволят предотвратить возможную поломку оборудования, ведь пыль оседает на узлах и деталях, связываясь со смазочными материалами, образует наросты, что может стать причиной приостановки производства.</p>\r\n<p style="text-align: justify;">Также работы по очистке металлоконструкций от грязи и пыли необходимы перед проведением антикоррозийной обработки с последующей покраской деталей. Если этого этапа избежать, нанесенная на металл краска быстро облупиться и начнет осыпаться, тогда работы придется повторять снова и снова.&nbsp;</p>\r\n<p style="text-align: justify;">Существует несколько способов очистить поверхность металлоконструкций от пыли.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ручная очистка</strong></span>&nbsp;поверхности металлоконструкций предполагает работу скребками и щетками. Такая очистка позволяет произвести также зачистку старой краски на поверхности металлических ферм.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Механическая чистка</strong></span> поверхности металлоконструкций проводится отбойниками, электро- и пневмоинструментами, когда металлоконструкции значительно повреждены ржавчиной, и существует необходимость более глубокой очистки поверхности.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Абразивная очистка</strong></span> посредством частиц абразива удаляет с металла прокатную окалину и загрязнения. Перед проведением такой очистки необходимо предварительное обезжиривание поверхности, так как неудаленные загрязнители будут вбиты в поверхность металла струей абразива, а впоследствии спровоцируют отслаивание лакокрасочного покрытия от основания.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Очистка сжатым воздухом</strong></span> предполагает дополнительную шлифовку поверхности от шероховатостей и царапин. Дальнейшая окраска металлоконструкций должна производиться только по ровной поверхности.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n</div>', '98156c5a3246cb939a6bbede1e732af7.jpg', 'obespylivanie-metalla', '', '', ''),
(45, 'Свет, реклама, баннеры, декор', 2, 62, 75, '2012-08-07 09:37:01', 1, 0, NULL, NULL, 'light', '', '', ''),
(46, 'Покраска металлоконструкций', 3, 43, 44, '2012-08-07 09:37:01', 1, 0, '<div>\r\n<p style="text-align: justify;">Металлоконструкции в промышленности применяются и встречаются повсеместно, покраска необходима различным металлоконструкциям, начиная с покраски металлических ферм производственных цехов и ангаров, заканчивая окраской мостов и строительных кранов. С течением времени любые металлоконструкции изнашиваются, под действием снега, дождя и ветра лакокрасочное покрытие разрушается, на металле появляется коррозия. Это влечет за собой снижение прочности материала, что, в свою очередь, влияет на безопасность всей конструкции.&nbsp;</p>\r\n<p style="text-align: justify;"><strong>Покраска металлоконструкций</strong>, в первую очередь, призвана защитить металл от возможной коррозии и разрушения. Современные лакокрасочные материалы способны защитить металл на десятилетия. Важно только правильно подобрать краску и подготовить поверхность металла перед покрытием.&nbsp;</p>\r\n<p style="text-align: justify;">Работы по покраске металлоконструкций можно разделить на следующие виды.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Покраска металлоконструкций</strong></span>, призванная освежить внешний вид и увеличить срок службы строения осуществляется в несколько этапов. Сначала производится очистка поверхности металла от старой краски и удаление ржавчины. Затем проводят обезжиривание поверхности, устраняются следы масел и смазок. Затем поверхность шлифуется. Грунтование и окраска металла выполняется только по ровной, без дефектов поверхности.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Антикоррозийная защита металлоконструкций</strong></span> требуется во всех отраслях промышленности. Особенно это касается производств с вредными и агрессивными средами, таких как газовая, нефтеперерабатывающая, пищевая и фармацевтическая промышленность. В защите металла от коррозии важным моментом является тщательная прокраска острых кромок, кантов и сварных швов, на которых лакокрасочный слой имеет недостаточную толщину. Специальные краски и эмали надежно защитят металл от преждевременного разрушения.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Огнезащита металла</strong></span> призвана защитить металл от перегрева в случае возникновения пожара. Поверхность металла покрывается специальными красками, которые при повышении температуры вспучиваются и создают защитный теплоизолирующий слой. Обработанная таким образом поверхность металлических ферм не подвергнется деформации, и конструкция не разрушится.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n</div>', 'bd895b2c30fa3c5e75ff3c4a4e553505.jpg', 'pokraska-metallokonstruktsij', '', '', ''),
(47, 'Остекление зимнего сада', 3, 45, 46, '2012-08-07 09:37:01', 1, 0, '<p style="text-align: justify;">Зимний сад &ndash; это высокотехнологичное сооружение из систем алюминиевых профилей с использованием ударопрочных стеклопакетов из триплекса или закаленного стекла. В качестве несущих конструкций для зимнего сада, может быть применен профиль из нержавеющей стали. <strong>Остекление зимнего сада</strong> обязательно должно учитывать статические, снеговые и ветровые нагрузки.&nbsp;</p>\r\n<p style="text-align: justify;">Своевременно выполненная <strong>полировка остекления</strong> зимнего сада позволит предотвратить оседание пыли. Обработанная специальными составами поверхность стекла приобретет грязеотталкивающие свойства, после дождя на поверхности не будут оставаться грязные разводы.&nbsp;</p>\r\n<p style="text-align: justify;">К типу зимних садов можно отнести следующие объекты.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Открытые террасы и пентхаусы</strong></span>, возведенные по технологии панорамного остекления, могут стать истинным украшением фасадов современных зданий. В частных постройках такие остекленные конструкции могут стать продолжением жилого дома, будут являться гостиной, игровой комнатой, творческой мастерской, столовой, кабинетом и т.п.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Панорманое остекление балконов</strong></span> позволит значительно расширить жилое пространство квартиры и создать уют. Остекленный балкон защищает от плохой погоды и лишнего мусора. Если балкон остеклен, это заметно уменьшает уровень шума с улицы.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Остекление теплиц</strong></span> обеспечит сохранность Вашего сада и сохранит жизнь экзотическим растениям. Восстановить влаго- и холодонепроницаемость поможет своевременная герметизация швов на стыках стеклопакетов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Остекление бассейнов</strong></span> должно проводиться такими материалами, для которых влажная среда не является агрессивной. Остекленные навесы бассейнов обязаны выдерживать снеговую нагрузку и перепады температур.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Остекление ресторанов, магазинов </strong></span>и <span style="color: #198cc2;"><strong>торговых павильонов, кафе </strong></span>и <span style="color: #198cc2;"><strong>аптек</strong></span> визуально сделает помещение более светлым и просторным. Особенности такого рода остекления заключаются в том, что работы по их монтажу или замене требует привлечения дополнительной техники, так как само стекло тяжелее обычных привычных нам стеклопакетов в окнах.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'd54c33c2401a512af79b26a8df564dd4.jpg', 'osteklenie-zimnego-sada', '', '', '');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `alias`, `for_price`, `sidebar_top`, `sidebar_top_title`) VALUES
(48, 'Монтаж и покраска труб', 3, 47, 48, '2012-08-07 09:37:01', 1, 0, '<div>\r\n<p style="text-align: justify;">Различные <strong>трубы</strong> применяются в разных сферах и востребованы на многих объектах. Для увеличения срока службы таких сложных высотных конструкций как дымовые трубы, водонапорные башни, <a href="../../../../chapter/montazh-vyshek-sotovoj-svjazi">вышки сотовой связи</a>&nbsp;и т.п. необходимо поддерживать их в рабочем состоянии. По мере увеличения сроков их эксплуатации все острее встает вопрос проведения своевременного ремонта. Так, металлические, железобетонные или кирпичные трубы должны быть обязательно разобраны при выведении из эксплуатации. Зачастую проведение такого рода работ бывает сопряжено с техническими трудностями. Близкое расположение строений вокруг, разрушенное состояние самой трубы &ndash; все это может представлять опасность для людей. Технологии промышленного альпинизма существенно облегчают выполнение задач по обслуживанию труб.&nbsp;</p>\r\n<p>К типам работ, связанным с обслуживанием таких высотных объектов, как различные трубы, можно отнести следующие.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Покраска труб</strong></span> должна производиться специальными красками, способными выдержать большие перепады температур. Маркировочная окраска с чередованием широких белых и цветных полос обязательна. В зависимости от того, из какого материала сделана труба (кирпич, бетон, металл), выбирается и тип краски. Перед этим выполняется необходимый комплекс подготовительных работ к окрашиванию (очистка от старой краски, огрунтовка поверхности и т.д.)&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Ремонт труб</strong></span> представляет собой комплекс различных работ, связанных, прежде всего, с укреплением всей конструкции. Для кирпичных труб бывает необходима переборка оголовка, шпатлевка и штукатурка, замена стяжных колец. На железобетонных трубах могут появляться микротрещины. Устранить их помогут сухие стяжки, а специальный состав защитит арматуру. Металлические трубы, как правило, выходят из строя по причине повреждения ржавчиной. Для предотвращения разрушения производится антикоррозийная защита. Также проводится ремонт фундамента трубы, делается усиление фланцевых соединений основания. Помимо непосредственно ремонтных работ на трубы устанавливается система молниезащиты, производится монтаж сигнальных фонарей.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Демонтаж труб</strong></span> является одной из самых сложных работ в сфере промышленного альпинизма. Перед проведением этой операции необходимо тщательно проанализировать состояние трубы, определиться с технологией проведения работ. Демонтаж металлических труб осуществляется с помощью болгарки и методом кислородной резки. Секции трубы спускаются на землю на веревках или снимаются с помощью автокрана. Демонтаж железобетонных труб может быть проведен с использованием гидроклина. Демонтаж кирпичной трубы методом разбора можно проводить со сбросом обломков наружу или вовнутрь трубы. Разбор трубы вовнутрь с подмостей на кронштейнах возможен, если стяжные кольца достаточно крепкие. В противном случае разбор производится с подвесной площадки, расположенной внутри сносимого столба.</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n</div>', '949f036c5959042c0a26c38e0bbe71ec.jpg', 'truby', '', '', ''),
(49, 'Обслуживание мостов', 3, 49, 50, '2012-08-07 09:37:01', 1, 0, '<div>\r\n<p style="text-align: justify;">Мосты &ndash; неотъемлемая часть любого населенного пункта, от маленькой деревни до огромного мегаполиса. <strong>Обслуживание мостов</strong> требует особого внимания, так как эти сооружения должны быть не только функциональными, но и абсолютно надежными, будь то транспортные путепроводы или торгово-пешеходные строения.</p>\r\n<p style="text-align: justify;">Работы, проводимые силами промышленных альпинистов на мостовых конструкциях, можно разбить на следующие блоки.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Антикоррозийная защита</strong></span> и <span style="color: #198cc2;"><strong>покраска мостов</strong></span> начинается с тщательной очистки поверхности металлических частей путем механической зачистки или с помощью пескоструйного аппарата. Далее производится огрунтовка поверхности и ее покраска специальными лакокрасочными эмалями, которые не только способны защитить металлические поверхности от ржавчины, но и будут препятствовать в дальнейшем оседанию грязи и пыли, образованию окалины при взаимодействии с остатками горюче-смазочных материалов. Бетонные части конструкций мостов также нуждаются в обслуживании. Появившиеся швы и трещины заделываются герметиками, отдельно проводится процедура по уплотнению и гидроизоляции бетона с помощью специальных пропиток.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Сварочные работы на мостах</strong></span> надежно соединяют металлоконструкции пролетных строений путепроводов. Они могут быть выполнены с использованием современных технологий ручной, полуавтоматической и автоматической сварки под флюсом.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Остекление мостов</strong></span> позволяет, прежде всего, обеспечить безопасность передвижения пешеходов. Такие мосты обладают морозо- и теплоустойчивостью, высокой пожаробезопасностью, отличными звукоизоляционными свойствами. Последующее обслуживание (мойка, покраска) остекленных поверхностей мостов и пешеходных сходов даст возможность надолго сохранить внешний вид этих сооружений в надлежащем виде и продлит срок их службы.&nbsp;</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Экспертиза мостов</strong></span> на предмет проверки их технического состояния может производиться как на постоянной основе (исследовательский мониторинг), так и внепланово (контрольный мониторинг). При контрольном мониторинге решается задача по предупреждению возникновения аварийных состояний конструктивных элементов и сооружения в целом, в частности проводится экспертиза сварочных швов, обследование болтов в местах соединений металлоконструкций, производится прогнозирование развития возможных дефектов. При регулярном осмотре выявляются места коррозии материала, трещины в бетонных частях мостов, места возможной концентрации напряжений, протечки воды и т.п. При этом производится измерение параметров отмеченных дефектов с замером длины и ширины раскрытия трещин, площади и толщины продуктов коррозии, площади протечек и т.п.</p>\r\n</div>', '90e65fa4677640b884cbf5cb31af2e2c.jpg', 'obsluzhivanie-mostov', '', '', ''),
(50, 'Монтаж вышек сотовой связи', 3, 53, 54, '2012-08-07 09:37:01', 1, 0, NULL, NULL, 'montazh-vyshek-sotovoj-svjazi', '', '', ''),
(51, 'Оборудование и датчики', 3, 55, 56, '2012-08-07 09:37:01', 1, 0, NULL, 'b7fee77e6625366b6ff2257e84718301.jpg', 'oborudovanie-i-datchiki', '<p style="text-align: justify;"><br /></p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '', ''),
(52, 'Сборка электрических щитов', 3, 57, 58, '2012-08-07 09:37:01', 1, 0, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '770dc3e89ab1a7353eac285a5146c5bc.jpg', 'sborka-elektricheskih-schitov', '', '', ''),
(53, 'Монтаж оборудования для сцен', 3, 59, 60, '2012-08-07 09:37:01', 1, 0, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '58d23d76d2dbe9c77765e4e5129ddc5b.jpg', 'Oborudovanije-dlja-stsen', '', '', ''),
(54, 'Монтаж наружной рекламы', 3, 63, 64, '2012-08-07 09:37:01', 1, 0, NULL, NULL, NULL, '', '', ''),
(55, 'Установка баннеров', 3, 65, 66, '2012-08-07 09:37:01', 1, 0, NULL, NULL, NULL, '', '', ''),
(56, 'Световая реклама', 3, 67, 68, '2012-08-07 09:37:01', 1, 0, NULL, NULL, 'svetovaja-reklama', '', '', ''),
(57, 'Уличная подсветка', 3, 69, 70, '2012-08-07 09:37:01', 1, 0, NULL, NULL, NULL, '', '', ''),
(58, 'Выставки и конференции', 3, 71, 72, '2012-08-08 17:03:51', 1, 0, NULL, NULL, 'vystavki-i-konferentsii', '', '', ''),
(59, 'Декор помещений', 3, 73, 74, '2012-08-07 09:37:01', 1, 0, NULL, NULL, NULL, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `certificates_groups`
--

DROP TABLE IF EXISTS `certificates_groups`;
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

DROP TABLE IF EXISTS `certificates_types`;
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

DROP TABLE IF EXISTS `cities`;
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

DROP TABLE IF EXISTS `countries`;
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

DROP TABLE IF EXISTS `documents`;
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

DROP TABLE IF EXISTS `documents_files`;
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

DROP TABLE IF EXISTS `faq`;
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

DROP TABLE IF EXISTS `faq_sections`;
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

DROP TABLE IF EXISTS `feedback`;
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

DROP TABLE IF EXISTS `file_manager`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=211 ;

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
(40, '1', 'Review', '7c1fded3324509ca8e057f3aaeb2866d.jpg', 'files', NULL, NULL, 11),
(121, '9', 'Gallery', '0004.jpg', 'files', '004.jpg', NULL, 7),
(112, '8', 'Gallery', '8.jpg', 'files', '8.jpg', NULL, 2),
(113, '8', 'Gallery', '10.jpg', 'files', '10.jpg', NULL, 0),
(110, '8', 'Gallery', '6.jpg', 'files', '6.jpg', NULL, 4),
(111, '8', 'Gallery', '7.jpg', 'files', '7.jpg', NULL, 3),
(108, '8', 'Gallery', '14.jpg', 'files', '14.jpg', NULL, 6),
(109, '8', 'Gallery', '45.jpg', 'files', '45.jpg', NULL, 5),
(106, '8', 'Gallery', '22.jpg', 'files', '22.jpg', NULL, 8),
(107, '8', 'Gallery', '1303.jpg', 'files', '1303.jpg', NULL, 7),
(105, '8', 'Gallery', '71.jpg', 'files', '71.jpg', NULL, 9),
(99, '7', 'Gallery', '42.jpg', 'files', '42.jpg', NULL, 3),
(100, '7', 'Gallery', '1.jpg', 'files', '1.jpg', NULL, 4),
(101, '7', 'Gallery', '3.jpg', 'files', '3.jpg', NULL, 2),
(102, '7', 'Gallery', '4.jpg', 'files', '4.jpg', NULL, 1),
(103, '7', 'Gallery', '5.jpg', 'files', '5.jpg', NULL, 0),
(104, '8', 'Gallery', '9.jpg', 'files', '9.jpg', NULL, 1),
(96, '6', 'Gallery', '602.jpg', 'files', '602.jpg', NULL, 3),
(97, '6', 'Gallery', '4701.jpg', 'files', '4701.jpg', NULL, 4),
(95, '6', 'Gallery', '05.jpg', 'files', '05.jpg', NULL, 0),
(88, 'tmp_19', 'Gallery', '1001.jpg', 'files', '1001.jpg', NULL, 2),
(89, 'tmp_19', 'Gallery', '303.jpg', 'files', '303.jpg', NULL, 0),
(86, '4', 'Gallery', '902.jpg', 'files', '902.jpg', NULL, 1),
(90, '5', 'Gallery', '51002.jpg', 'files', '51002.jpg', NULL, 1),
(84, '4', 'Gallery', '204.jpg', 'files', '204.jpg', NULL, 2),
(87, 'tmp_19', 'Gallery', '21002.jpg', 'files', '21002.jpg', NULL, 1),
(83, '4', 'Gallery', '103.jpg', 'files', '103.jpg', NULL, 0),
(93, '6', 'Gallery', '404.jpg', 'files', '404.jpg', NULL, 1),
(94, '6', 'Gallery', '803.jpg', 'files', '803.jpg', NULL, 2),
(91, '5', 'Gallery', '101.jpg', 'files', '101.jpg', NULL, 2),
(77, '2', 'Gallery', '011.jpg', 'files', '011.jpg', NULL, 5),
(92, '5', 'Gallery', '1003.jpg', 'files', '1003.jpg', NULL, 0),
(75, '2', 'Gallery', '031.jpg', 'files', '031.jpg', NULL, 3),
(76, '2', 'Gallery', '021.jpg', 'files', '021.jpg', NULL, 4),
(70, '1', 'Gallery', '02.jpg', 'files', '02.jpg', NULL, 1),
(71, '1', 'Gallery', '701.jpg', 'files', '701.jpg', NULL, 0),
(72, '1', 'Gallery', '703.jpg', 'files', '703.jpg', NULL, 2),
(74, '2', 'Gallery', '041.jpg', 'files', '041.jpg', NULL, 2),
(73, '2', 'Gallery', '051.jpg', 'files', '051.jpg', NULL, 1),
(120, '9', 'Gallery', '3003.jpg', 'files', '003.jpg', NULL, 8),
(130, '9', 'Gallery', '4001.jpg', 'files', '001.jpg', NULL, 10),
(119, '9', 'Gallery', '10002.jpg', 'files', '002.jpg', NULL, 9),
(122, '9', 'Gallery', '005.jpg', 'files', '005.jpg', NULL, 6),
(123, '9', 'Gallery', '006.jpg', 'files', '006.jpg', NULL, 5),
(124, '9', 'Gallery', '007.jpg', 'files', '007.jpg', NULL, 4),
(125, '9', 'Gallery', '008.jpg', 'files', '008.jpg', NULL, 3),
(126, '9', 'Gallery', '009.jpg', 'files', '009.jpg', NULL, 2),
(127, '9', 'Gallery', '010.jpg', 'files', '010.jpg', NULL, 1),
(128, '9', 'Gallery', '2011.jpg', 'files', '011.jpg', NULL, 0),
(135, '13', 'Gallery', '5002.jpg', 'files', '002.jpg', NULL, 5),
(134, '13', 'Gallery', '81001.jpg', 'files', '001.jpg', NULL, 6),
(136, '14', 'Gallery', '4010.jpg', 'files', '010.jpg', NULL, 0),
(137, '14', 'Gallery', '5009.jpg', 'files', '009.jpg', NULL, 1),
(138, '14', 'Gallery', '3008.jpg', 'files', '008.jpg', NULL, 2),
(140, '14', 'Gallery', '8007.jpg', 'files', '007.jpg', NULL, 3),
(141, '14', 'Gallery', '5006.jpg', 'files', '006.jpg\n\n\n', NULL, 7),
(142, '14', 'Gallery', '1005.jpg', 'files', '005.jpg', NULL, 4),
(143, '14', 'Gallery', '6004.jpg', 'files', '004.jpg', NULL, 5),
(144, '14', 'Gallery', '43003.jpg', 'files', '003.jpg', NULL, 8),
(145, '14', 'Gallery', '3002.jpg', 'files', '002.jpg', NULL, 6),
(146, '14', 'Gallery', '6001.jpg', 'files', '001.jpg', NULL, 9),
(147, '13', 'Gallery', '10007.jpg', 'files', '007.jpg', NULL, 0),
(148, '13', 'Gallery', '6006.jpg', 'files', '006.jpg', NULL, 1),
(149, '13', 'Gallery', '4005.jpg', 'files', '005.jpg', NULL, 2),
(150, '13', 'Gallery', '10004.jpg', 'files', '004.jpg', NULL, 3),
(151, '13', 'Gallery', '8003.jpg', 'files', '003.jpg', NULL, 4),
(152, '15', 'Gallery', '6009.jpg', 'files', '009.jpg', NULL, 0),
(153, '15', 'Gallery', '6008.jpg', 'files', '008.jpg', NULL, 1),
(154, '15', 'Gallery', '8005.jpg', 'files', '005.jpg', NULL, 4),
(155, '15', 'Gallery', '3007.jpg', 'files', '007.jpg', NULL, 2),
(156, '15', 'Gallery', '0006.jpg', 'files', '006.jpg', NULL, 3),
(157, '15', 'Gallery', '1010004.jpg', 'files', '004.jpg', NULL, 5),
(158, '15', 'Gallery', '110002.jpg', 'files', '002.jpg', NULL, 7),
(159, '15', 'Gallery', '4003.jpg', 'files', '003.jpg\n\n\n\n\n\n', NULL, 6),
(160, '15', 'Gallery', '26001.jpg', 'files', '001.jpg', NULL, 8),
(161, '16', 'Gallery', '86001.jpg', 'files', '001.jpg', NULL, 5),
(162, '16', 'Gallery', '2005.jpg', 'files', '005.jpg', NULL, 1),
(163, '16', 'Gallery', '95002.jpg', 'files', '002.jpg\n\n\n\n\n\n', NULL, 2),
(164, '16', 'Gallery', '9004.jpg', 'files', '004.jpg', NULL, 3),
(165, '16', 'Gallery', '2003.jpg', 'files', '003.jpg', NULL, 4),
(166, '16', 'Gallery', '2006.jpg', 'files', '006.jpg', NULL, 0),
(167, '17', 'Gallery', '63003.jpg', 'files', '004.jpg', NULL, 2),
(168, '17', 'Gallery', '41005.jpg', 'files', '006.jpg\n\n\n\n\n\n\n\n\n', NULL, 0),
(169, '17', 'Gallery', '6002.jpg', 'files', '002.jpg', NULL, 4),
(170, '17', 'Gallery', '8004.jpg', 'files', '005.jpg', NULL, 1),
(171, '17', 'Gallery', '210001.jpg', 'files', '003.jpg', NULL, 3),
(172, '17', 'Gallery', '1006.jpg', 'files', '001.jpg', NULL, 5),
(173, '18', 'Gallery', '9001.jpg', 'files', '001.jpg', NULL, 1),
(198, '19', 'Gallery', '310001.jpg', 'files', '001.jpg', NULL, 1),
(175, '20', 'Gallery', '33001.jpg', 'files', '001.jpg\n\n\n', NULL, 22),
(176, '20', 'Gallery', '022.jpg', 'files', '022.jpg', NULL, 1),
(177, '20', 'Gallery', '015.jpg', 'files', '015.jpg', NULL, 8),
(178, '20', 'Gallery', '10009.jpg', 'files', '009.jpg', NULL, 14),
(179, '20', 'Gallery', '6011.jpg', 'files', '011.jpg\n\n\n', NULL, 12),
(180, '20', 'Gallery', '7005.jpg', 'files', '005.jpg', NULL, 18),
(181, '20', 'Gallery', '7010.jpg', 'files', '010.jpg\n', NULL, 13),
(182, '20', 'Gallery', '0008.jpg', 'files', '008.jpg', NULL, 15),
(183, '20', 'Gallery', '013.jpg', 'files', '013.jpg', NULL, 10),
(184, '20', 'Gallery', '018.jpg', 'files', '018.jpg', NULL, 5),
(185, '20', 'Gallery', '017.jpg', 'files', '017.jpg', NULL, 6),
(186, '20', 'Gallery', '012.jpg', 'files', '012.jpg', NULL, 11),
(187, '20', 'Gallery', '9021.jpg', 'files', '021.jpg', NULL, 2),
(188, '20', 'Gallery', '016.jpg', 'files', '016.jpg', NULL, 7),
(189, '20', 'Gallery', '4007.jpg', 'files', '007.jpg', NULL, 16),
(190, '20', 'Gallery', '020.jpg', 'files', '020.jpg', NULL, 3),
(191, '20', 'Gallery', '310002.jpg', 'files', '002.jpg', NULL, 21),
(192, '20', 'Gallery', '12003.jpg', 'files', '003.jpg', NULL, 20),
(193, '20', 'Gallery', '5004.jpg', 'files', '004.jpg', NULL, 19),
(194, '20', 'Gallery', '014.jpg', 'files', '014.jpg', NULL, 9),
(195, '20', 'Gallery', '9006.jpg', 'files', '006.jpg', NULL, 17),
(196, '20', 'Gallery', '019.jpg', 'files', '019.jpg', NULL, 4),
(197, '20', 'Gallery', '023.jpg', 'files', '023.jpg', NULL, 0),
(206, '21', 'Gallery', '104001.jpg', 'files', '02.jpg', NULL, 1),
(209, '21', 'Gallery', '110001.jpg', 'files', '01.jpg', NULL, 2),
(210, '21', 'Gallery', '502.jpg', 'files', '03.jpg', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Название',
  `is_published` tinyint(1) NOT NULL COMMENT 'Опубликована',
  `order` int(11) NOT NULL COMMENT 'Сортировка',
  `date` date NOT NULL COMMENT 'Дата',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `is_published`, `order`, `date`) VALUES
(1, '02.07.2011 Покраска, школа №1000, Солнцево', 1, 1, '2011-07-02'),
(2, '27.07.2011 Покраска, детский сад, ул. Ак. Анохина', 1, 2, '0000-00-00'),
(4, '15.08.2011               Помывка, Ленком', 1, 3, '0000-00-00'),
(5, '01.09.2011 Помывка и покраска здания, Солянка', 1, 4, '0000-00-00'),
(6, '05.10.2011 Помывка и покраска здания, Земляной вал', 1, 5, '0000-00-00'),
(7, '14.12.2011 Замена фасадного остекления, Одинцово', 1, 6, '0000-00-00'),
(8, '16.01.2012 Сборка и установка электромонтажного оборудования', 1, 7, '0000-00-00'),
(9, '20.02.2012 Монтаж отливов, герметизация швов, жилое здание', 1, 8, '0000-00-00'),
(14, '04.04.2012 Москва-Сити, полировка', 1, 10, '0000-00-00'),
(13, '22.03.2012 Мойка окон офисного здания', 1, 9, '0000-00-00'),
(15, '23.04.2012 Аэропорт Якутска, мойка фасадного остекления', 1, 11, '0000-00-00'),
(16, '05.05.2012 Московская областная Дума, мойка фасада', 1, 12, '2012-05-05'),
(17, '11.05.2012 Мойка окон и мойка фасада, Солянка', 1, 13, '2012-05-11'),
(18, '16.05.2012 Гидрофобизация фасада 1650 кв.м.', 1, 14, '2012-05-16'),
(19, '02.07.2012 Монтаж кровли балкона квартиры, установка отливов', 1, 16, '2012-07-02'),
(20, '14.06.2012 Герметизация швов, оранжерея 18 век, элитный пос.Довиль, Одинцовский район', 1, 15, '2012-06-14'),
(21, '24.07.2012 Монтаж алюминиевых панелей под козырьком здания, Студенческая улица ', 1, 17, '2012-07-24');

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

DROP TABLE IF EXISTS `languages`;
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

DROP TABLE IF EXISTS `log`;
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

DROP TABLE IF EXISTS `mailer_fields`;
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

DROP TABLE IF EXISTS `mailer_letters`;
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

DROP TABLE IF EXISTS `mailer_recipients`;
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

DROP TABLE IF EXISTS `mailer_templates`;
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

DROP TABLE IF EXISTS `mailer_templates_recipients`;
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

DROP TABLE IF EXISTS `menu`;
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
(1, 'Верхнее меню', 1),
(2, 'Главное меню', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `menu_links`
--

INSERT INTO `menu_links` (`id`, `lang`, `parent_id`, `page_id`, `menu_id`, `title`, `url`, `user_role`, `not_user_role`, `order`, `is_visible`) VALUES
(1, 'ru', NULL, 1, 1, 'ГЛАВНАЯ', '/', NULL, NULL, 1, 1),
(2, 'ru', NULL, 2, 1, 'УСЛУГИ', 'service', NULL, NULL, 2, 1),
(3, 'ru', NULL, NULL, 1, 'ФОТО', 'photo', NULL, NULL, 3, 1),
(4, 'ru', NULL, NULL, 1, 'ОТЗЫВЫ', 'reviews', NULL, NULL, 4, 1),
(6, 'ru', NULL, NULL, 1, 'ЦЕНЫ', 'prices', NULL, NULL, 6, 1),
(13, 'ru', NULL, 21, 1, 'СОТРУДНИЧЕСТВО', 'page/cooperation', NULL, NULL, 7, 1),
(23, 'ru', NULL, NULL, 2, 'Контакты', '/', NULL, NULL, 8, 1),
(24, 'ru', NULL, 20, 1, 'КОНТАКТЫ', 'page/contacts', NULL, NULL, 8, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `meta_tags`
--

DROP TABLE IF EXISTS `meta_tags`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Дамп данных таблицы `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `object_id`, `model_id`, `title`, `keywords`, `description`, `date_create`, `date_update`) VALUES
(5, 2, 'Page', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм, высотные работы, крыша сосульки, очистка кровли от наледи, очистка кровли от снега, очистка крыши от снега, сброс снега, уборка крыши снег, чистка снега кровля, сбить сосульку', 'ПромАльпГруппа "ВертикАльП" собрала под своим именем профессионалов, работающих в сфере промышленного альпинизма.', '2011-10-19 17:25:04', '2011-12-29 14:59:25'),
(7, 1, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'фасадные работы, мойка фасада, мойка окон, покраска фасада, ремонт фасада, мойка фасадов', 'Промышленная Группа "Альпинисты Москвы". Выезд специалиста на объект - БЕСПЛАТНО! Качество. Партнерство. Результат.', '2011-10-19 17:25:29', '2012-08-08 22:49:34'),
(71, 62, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'Утепление панорамного остекления балконов и лоджий, замена остекления, замена оконного стекла, замена стеклопакетов, замена стеклопакетов москва, замена стеклопакетов в пластиковых окнах', 'Промышленная группа "Альпинисты Москвы" проводит работы по замене стеклопакетов в высотных зданиях и жилых квартирах.', '2012-07-26 17:20:42', '2012-07-27 11:49:06'),
(8, 3, 'News', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'герметизация швов', 'Новости Альпинисты Москвы', '2011-10-20 13:10:13', '2012-07-27 18:51:51'),
(9, 20, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм, высотные работы, выезд для осмотра объекта бесплатно', 'Телефон +7(499)390-15-57. Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.  Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы  - бесплатно! Руководитель проектов Худик Александр.', '2011-12-26 20:54:15', '2012-08-07 11:24:47'),
(10, 21, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм сотрудничество, высотные работы, сотрудничество в промышленном альпинизме, промышленный альпинизм генподряд, промышленный альпинизм субподряд, промышленный альпинизм работа, нужны промышленные альпинисты, промышленный альпинизм работа', 'Сотрудничество с организациями: генподряд или субподряд. Сотрудничаем с event-агентствами и рекламными компаниями. Необычные поздравления, доставка букета в окно. Выполним разовые работы в соответствии с вашими пожеланиями. Нанимаем промышленных альпинистов, работа для промышленных альпинистов.', '2011-12-26 21:04:36', '2012-08-07 11:23:56'),
(11, 22, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм цены, уборка снега цена, очистка снега с крыш, сбить сосульку цена, покраска фасада цена, мойка окон цена, мойка фасада цена, штукатурка фасада цена, покраска фасада цена, покраска металлоконструкций цена', 'В этом разделе вы можете ознакомиться с примерными ценами на наши услуги. Мы рады предложить нашим постоянным клиентам СКИДКИ за большой объем выполняемых работ и комплексное сотрудничество по различным направлениям нашей деятельности.', '2011-12-28 20:49:51', '2012-08-07 10:49:36'),
(12, 2, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мойка окон, мойка фасада, мойка фасадов, мытье окон, мытье фасада, помыть фасад, помыть окна, промышленный альпинизм, ремонт фасада, мойка стекол, мойка окон цены, покраска фасада', 'В крупных городах услуги по мойке окон и мойке фасадов являются крайне востребованными. Для выполнения таких работ привлекаются промышленные альпинисты. Мойка окон и мойка фасадов поможет привести облик любого здания в надлежащий вид.', '2011-12-29 15:09:29', '2012-08-09 18:36:26'),
(36, 38, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'электромонтаж, электромонтажные работы, монтаж рекламы, электроработы', 'Сборка электрических щитов любой сложности , квартирные щиты, Пуско-наладочные работы: замеры сопративления изоляции, релейная защита, пуско-наладочные работы.', '2012-03-26 14:13:11', '2012-03-26 15:55:12'),
(38, 40, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'украшение помещений шарами, декор помещений, подвесы, украшение бассейнов, украшение шарами, оформление выставок, возведение стендов', 'Украшение интерьеров, оформление выставок, декорирование к празднику. Промышленный альпинизм может быть успешно применен не только при выполнении уличных работ, промальп технологии также успешно используются для различных работ внутри помещений, таких как рекламные кампании, украшение к праздникам.', '2012-03-26 14:14:27', '2012-03-26 14:25:54'),
(14, 13, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мойка окон, мойка фасадов, мойка стекол, стекломой, помыть окна, помыть здание, мытье окон, мытье фасадов, клининг, промышленный альпинизм клининг, промышленный альпинизм мойка окон, промышленный альпинизм помыть окна, автоматизированная мойка, мойка окон под давлением, вертикальп, клининг цены', 'Чистые окна и витрины – это лицо здания, поэтому стекломой – один из самых популярных видов работ на сегодняшний день в сфере промышленного альпинизма. Технологии промышленного альпинизма широко применяются при мойке зданий с панорамным остеклением, складских помещений, зданий ТРЦ.', '2011-12-29 15:19:36', '2012-08-09 18:34:42'),
(15, 14, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мойка фасада, мойка окон, мойка фасадов, помыть стекла альпинисты, очистка фасада, очистка фасада от краски, пескоструйная очистка, промышленный альпинизм, высотные работы, мойка фасада под давлением, очистить фасад от краски, мойка фасадов зданий, отмыть фасад цена, очистить фасад, вертикальп', 'Мойка фасада - одна из наиболее распространенных услуг, оказываемых промышленными альпинистами. Мойка здания обязательно выполняется перед ремонтными работами на фасаде. При помощи технологий промальпа можно очистить стены здания даже в труднодоступных местах.', '2011-12-29 15:22:04', '2012-08-09 18:35:38'),
(16, 3, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'фасадные работы, шпатлевка стен, шпаклевка стен, очистка фасада, расшивка трещин, герметизация швов, реставрация лепнины, покраска лепнины, реставрация фасада, покрасить фасад, восстановление балкона, балкон ремонт, облицовочные работы, покраска фасада, декоративные элементы фасада, вентфасад', 'Очистка фасада, штукатурные работы, шпатлевка, покраска, облицовочные работы, устройство цоколя, установка дополнительных декоративных элементов, реставрация лепнины, восстановление балконов, герметизация швов – все это и многое другое входит в понятие «фасадные работы».', '2011-12-29 15:42:48', '2012-08-07 18:35:00'),
(17, 15, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'очистка фасада, чистка фасада, удаление высолов, высолы на кирпичной кладке, мойка фасада под давлением, удаление граффити, очистка фасадов зданий, очистка стен от краски, плесень на стенах удаление, грибок на стенах удаление, промышленный альпинизм, вертикальп, высотные работы, промальп', 'Очистка фасада – это та необходимая услуга, которая позволит поддержать привлекательность здания и одновременно поможет отодвинуть время проведения его ремонта. Пескоструйная чистка. Удаление плесени, грибка, устранение высолов. Очистка от граффити.', '2011-12-29 15:56:54', '2012-07-31 17:11:27'),
(18, 16, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'ремонт фасада, капитальный ремонт фасада, косметический ремонт фасада, штукатурка фасада, шпаклевка фасада, покраска фасада, покрасить фасад, расшивка трещин, вентилируемый фасад ремонт, вентфасад, мокрый фасад ремонт, ремонт мокрого фасада, ремонт вентилируемого фасада, облицовка фасада, вертикальп', 'Ремонт фасада. Ремонт "мокрого" фасада. Ремонт вентилируемый фасад. Капитальный ремонт фасада. Косметический ремонт фасада.', '2011-12-29 16:00:54', '2012-07-26 18:17:51'),
(19, 22, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'замена кирпичей, восстановление кирпичной кладки, армирование стены, выпадение кирпичей из стены, кирпичная стена, восстановление кирпичей, высолы на кирпичной кладке, шпаклевка стены, штукатурка фасада, вертикальп', 'Замена кирпичей. Восстановление кирпичной кладки. Армирование стены.', '2011-12-29 16:03:24', '2012-08-07 11:28:37'),
(20, 23, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'покраска фасада, декор фасада, декорирование фасада, украшение на фасаде, лепнина, восстановление лепнины, декор из пенопласта, фасад декор, покраска разноцветная, разноцветная покраска стен, декоративная штукатурка, покраска лепнины, облицовка фасада, облицовочные панели замена, фасадный декор', 'Декор фасада – это отличная возможность оформить здание в оригинальном стиле, сделать его внешне привлекательным и неповторимым. Декоративная отделка фасада, лепнина, покраска, облицовка.', '2011-12-29 16:07:56', '2012-07-27 11:22:37'),
(21, 24, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'утепление фасада, утепление здания, утепление мокрого фасада, утепление вентфасада, утепление вентилируемого фасада, герметизация швов, звукоизоляция здания, сэндвич панели, термоплита, минеральная вата, утепление внешней стены, утеплитель на стене, штукатурка фасада, покраска фасада, вертикальп', 'Утепление фасада. Теплоизоляционная система защитит строение от разрушений и перепадов температур. Увеличение срока эксплуатации здания. Утепление стен современными материалам, сокращение теплопотерь, экономия.', '2011-12-29 16:11:37', '2012-07-27 11:36:25'),
(22, 25, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'герметизация швов, герметизация межпанельных швов, герметик силиконовый, открытый шов, герметизация открытый шов, закрытый шов, герметизация закрытый шов, первичная герметизация, вторичная герметизация, вкрыть старый шов, герметизация стены, фасадные работы, декор фасада, вертикальп, промальп', 'Герметизация межпанельных швов призвана защитить дом от холодного воздуха. Совместить теплоизоляцию и гибкость помогут эластичные герметики на силиконовой основе.', '2011-12-29 16:14:35', '2012-07-27 11:36:37'),
(23, 8, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'очистка от снега, очистка кровли от снега, очистка крыши от снега, сброс снега, уборка крыши снег, очистка крыши от наледи, наледь очистка, очистка крыши от сосулек, почистить крышу, очистка крыш от снега, уборка снега с кровли, уборка снега с крыш, чистка снега, вертикальп, промальп', 'Очистка кровли от снега и наледи. Разовый выезд, Абонентское обслуживание. Очистка снега по периметру на расстоянии 1,5 метров от края кровли. Полная очистка поверхности крыши от снега. Удаление сосулек.', '2011-12-29 16:18:02', '2012-07-27 17:19:19'),
(24, 10, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж кондиционеров, демонтаж кондиционеров, наружный блок кондиционера, промышленный альпинизм, высотные работы, кондиционер в квартиру, кондиционер замена, кондиционер ремонт, монтаж наружных блоков кондиционеров', 'Кондиционеры. Монтаж, обслуживание, ремонт. Замена очистителя. Демонтаж кондиционеров. Помывка кондиционеров.', '2011-12-29 16:20:23', '2012-05-14 13:04:39'),
(67, 60, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'светящиеся в темноте краски, дизайн интерьера, флуоресцентные краски, неоновые краски, роспись интерьера', 'Услуги по художественной росписи любых интерьеров. Рисунки, выполненные светящимися в темноте красками. Работает профессиональный художник.', '2012-07-25 18:31:09', '2012-07-29 21:34:34'),
(69, 2, 'News', NULL, NULL, NULL, '2012-07-26 13:13:09', '2012-07-26 14:04:33'),
(68, 1, 'News', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работы', 'алюминиевые панели замена, промышленный альпинизм, высотные работы', NULL, '2012-07-26 12:01:21', '2012-08-05 00:24:29'),
(70, 61, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды фасадных работ', 'гидрофобизация фасада, гидрофобизация стен, гидрофобизация поверхности, гидрофобизация бетона, гидрофобизация кирпича, гидрофобизация гранита, гидрофобизация стен фасадов', 'Удаление высолов, пескоструйная очистка фасадов, пропитка гидрофобизатором – все это вместе поможет защитить Ваше здание от дальнейших разрушений.  Мы работаем как на частных загородных домах, так и производим работы по заказу компаний.', '2012-07-26 17:20:09', '2012-07-27 11:41:09'),
(26, 12, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'утепление квартиры, утепление квартир, утепление стены, герметизация швов, швы в стенах, дует из стены, заделать щель в стене, дует снаружи, установить антенну, промышленный альпинизм, крыша на балкон, поздравление в окно, необычные поздравления в окно, доставка букета в окно, дед мороз в окно', 'Промышленный альпинизм частным заказчикам. Утепление квартир. Герметизация межпанельных швов. Установка крыши на балкон. Устарнение протечек в крыше.', '2011-12-29 16:29:11', '2011-12-29 16:38:03'),
(27, 19, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'утепление квартиры, утепление квартир, утепление стены, герметизация швов, швы в стенах, дует из стены, заделать щель в стене, дует снаружи, установить антенну, промышленный альпинизм, крыша на балкон, поздравление в окно, необычные поздравления в окно, доставка букета в окно, дед мороз в окно', 'Промышленный альпинизм частным заказчикам. Утепление квартир. Герметизация межпанельных швов. Установка крыши на балкон. Устарнение протечек в крыше.', '2011-12-29 16:31:47', NULL),
(72, 27, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'ремонт кровли, ремонт мягкой кровли, ремонт жесткой кровли, ремонт кровельного покрытия, восстановление кровельного покрытия', 'Осуществляем монтаж мягкой кровли, монтаж жесткой кровли любых типов. Проводим текущий и капитальный ремонт кровельного покрытия', '2012-07-27 14:37:39', '2012-07-27 15:02:18'),
(30, 4, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'ремонт кровли, протечки на кровле, герметизация кровли, ремонт крыши, протекает крыша, кровельное полотно, монтаж кровли, монтаж кровельного покрытия, кровельные материалы, кровельный пирог, устройство кровельного пирога, гидроизоляция кровли, пароизоляция кровли, устройство кровли, вертикальп', 'Кровельные работы. Правильно подобранные кровельные материалы и технология устройства кровли обеспечат надежность крыши и долговечность ее эксплуатации. Монтаж кровли, герметизация кровли. Устройство кровельного пирога.', '2012-01-11 00:05:13', '2012-07-26 18:04:14'),
(31, 26, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'монтаж кровли, монтаж мягкой кровли, монтаж жесткой кровли, герметизация кровли, защита кровли, ремонт кровельного полотна, покрытие кровли, гидроизоляция кровли, покрытия для крыши, кровля, теплоизоляция кровли, кровля цены, кровля мягкая, кровельные материалы, промышленный альпинизм, вертикальп', 'Надежность и долговечность крыши, прежде всего, обеспечивает правильно выполненный монтаж кровли. Выполняем монтаж мягкой кровли, монтаж жесткой кровли.', '2012-01-11 00:08:31', '2012-07-27 15:01:59'),
(32, 28, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'герметизация кровли, ремонт кровли, монтаж кровли, пароизоляция кровли, гилроизоляция кровли, ремонт кровельного полотна, наливная кровли, мягкая кровля, жесткая кровля, вертикальп, промышленный альпинизм, кровля ремонт, ремонт кровельного полотна, герметизация швов, очистка кровли от снега', 'Герметизация кровли в местах соединений кровельного полотна и на стыках кровли с деталями крыши. Герметизация мягкой кровли. Герметизация жесткой кровли. Кровельная мастика. Наливная кровля.', '2012-01-11 00:23:01', '2012-07-27 15:01:38'),
(33, 29, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'защита кровли, кровельные мостики, ограждения кровли, кровля цены, кровельные лестницы, снегозадержатели, снегоудержатели, очистка кровли от снега, уборка снега с крыши, вертикальп, промышленный альпинизм, очистка крыши от снега, сброс снега, сбить сосульку, элементы безопасности кровли', 'Элементы безопасности кровли. Кровельные ограждения. Кровельные мостики. Лестницы на скат. Лестницы на купол. Снегозадержатели.', '2012-01-11 00:27:04', '2012-07-27 15:03:12'),
(34, 30, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'кровельные работы, монтаж водостоков, замена желобов, покраска желобов, герметизация кровли, желоб водосточный, вертикальп, промышленный альпинизм, высотные работы, монтаж водостоков, монтаж водостоков цена, водосточный желоб, водосточная система, ремонт металлических желобов, ремонт желобов', 'Замена желобов и ремонт водостока. Листья и другой мусор попадают в желоба, засоряя воронки и водосточные трубы. Промышленный альпинизм - работы по замене и ремонту водостоков. Ремонт металлических желобов. Ремонт пластиковых желобов.', '2012-01-11 00:32:31', '2012-07-27 15:01:01'),
(37, 39, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'подсветка на улице, уличная подсветка, фонари, монтаж рекалмы, украшение улиц, подсветка улиц, световая реклама', 'Световая реклама на улицах. Подсветка зданий, декорирование деревьев, украшение мостов. Световые вывески, световые короба, объемные буквы, крышные установки.', '2012-03-26 14:14:10', '2012-03-26 14:18:36'),
(39, 7, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж наружной рекламы, монтаж рекламы, монтаж баннера, установка баннера, наружная реклама, реклама внутри помещений', 'Реклама - одни из самых эффективных способов привлечения внимания. Она является залогом успешного бизнеса. Наружная реклама очень разнообразна. Это и световые короба, объемные буквы, крашыне установки. Промальп поможет также в организации рекламы внутри помещений.', '2012-03-26 14:29:40', '2012-05-14 12:52:45'),
(40, 9, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж рекламы, монтаж баннера, крышная установка, монтаж вывесок, билборд, рекламные перетяжки', 'Монтаж наружной рекламы включает в себя огромное количество работ, зависящих от видов рекламы. Чтобы грамотно провести монтаж объектов рекламы, необходимо учитывать множество факторов: близость от линий электропередач, состояние фасада здания, наличие на стене кондиционеров, спутниковых антенн.', '2012-03-26 14:32:35', NULL),
(41, 5, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'обслуживание мостов, обслуживание гидросооружений, украшение мостов, покраска гидросооружений, шлюзовые работы, шлюзовые ворота, антикоррозийная защита моста, ремонт путепровода, ремонт мостов', 'Обслуживание мостов и гидросооружений. Покраска мостов. Гидрофобизация мостовых конструкций.', '2012-05-14 13:22:45', NULL),
(42, 17, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'обслуживание мостов, антикоррозийная защита мостов, украшение моста флагами, установка датчиков на мосты, сварочные работы на мосту, покраска мостов', 'Обслуживание мостов. Антикоррозийная защита мостов. Установка датчиков. Сварочные работы на мостах. Остекление мостов.', '2012-05-14 13:25:05', NULL),
(43, 18, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'обслуживание гидросооружений, очистка шлюза, покраска шлюза, штукатурка камер шлюза, установка оборудования на шлюз, антикоррозийная защита шлюза', 'Обслуживание гидросооружений. Покраска шлюза. Обслуживание шлюзовых камер. Покраска и штукатурка шлюзовых камер. Антикоррозийная защита.', '2012-05-14 13:27:20', NULL),
(44, 6, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж оборудования на высоте, монтаж кондиционера, обслуживание кондиционеров, покраска металлоконструкций, стальные фермы, обеспыливание металлических ферм, сооружение сцены, монтаж электрооборудования', 'Монтаж оборужования. Металлоконструкции любых типов. Оборудование для сцен, монтаж осветительного оборудования.', '2012-05-14 13:30:24', NULL),
(45, 31, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж вышек сотовой связи, монтаж телевизионной антенны, оборудования для сцен, установка датчиков, промышленный альпинизм, монтаж кондиционеров, монтаж освещения, монтаж рекламы, наружнее освещение здания', 'Монтаж оборужования. Монтаж оборудования для сцен. Монтаж кондиционеров. Монтаж рекламы.', '2012-05-14 13:32:27', NULL),
(46, 32, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж металлоконструкций, монтаж оборудования для сцен, монтаж выставочного оборудования, выставочные павильоны монтаж, пескоструйная очистка поверхности, остекление зимнего сада, сварочные работы на металлоконструкциях, антикоррозийная обработка, металлические фермы покраска, обеспылевание  ', 'Монтаж металлоконструкций. Монтаж оборудования для сцен. Монтаж выставочного оборудования. Пескоструйная очистка. Остекление зимнего сада. Сварочные работы на металлоконструкциях. Антикоррозийная обработка.', '2012-05-14 13:32:44', '2012-05-14 16:40:29'),
(47, 34, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'покраска трубы, очистка трубы, разбор трубы, демонтаж трубы, установка светового оборудования на трубу, антикоррозийная обработка трубы, укрепление фундамента трубы, кирпичные трубы, бетонные трубы, металлические трубы', 'Ремонт труб. Покраска, антикоррозийная обработка труб. Монтаж и демонтаж труб. Установка освещения на верхушке трубы.', '2012-05-14 16:42:53', NULL),
(48, 41, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'монтаж металлолконструкций, сборка металлоконструкций', 'Монтаж металлоконструкций широкого профиля. Мы работаем с металлоконструкциями промышленного и гражданского назначения, а значит, готовы выполнить частный заказ и заказ от фирм.', '2012-07-25 18:05:46', '2012-07-27 15:12:08'),
(49, 42, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'монтаж металлоконструкций, ремонт металлоконструкций, демонтаж металлоконструкций', 'Быстрый монтаж металлоконструкций по Вашему заказу. Правильно проведенный монтаж металлоконструкций означает надежность постройки и работу без сбоев. Мы оказываем целый спектр услуг по монтажу, ремонту и демонтажу металлоконструкций любого назначения.', '2012-07-25 18:06:21', '2012-07-27 15:22:59'),
(50, 43, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'электромонтаж, электромонтаж оборудования, сборка электрических щитов', 'Комплекс работ по пуску, наладке, монтажу и тестированию различного электрооборудования. Сервисное обслуживание уже имеющихся электросистем.', '2012-07-25 18:09:36', '2012-07-27 17:12:29'),
(51, 44, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'очистка металлоконструкций, обеспыливание металлоконструкций, абразивная чистка, пескоструйные работы', 'Комплекс работ по обеспыливанию металлоконструкций в промышленных зданиях и помещениях цехов. осуществляем уборку промышленных и офисных зданий: потолков, стен, балок, металлических ферм. Работы производятся в любое время без остановки производственных процессов на предприятии.', '2012-07-25 18:13:55', '2012-08-02 22:40:15'),
(52, 45, 'Category', NULL, NULL, NULL, '2012-07-25 18:15:19', NULL),
(53, 46, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'покраса металлоконструкций, монтаж металлоконструкций, обеспыливание металлоконструкций', 'Полный комплекс услуг по предотвращению коррозии металла, удалению ржавчины и покраске металлоконструкций.', '2012-07-25 18:23:01', '2012-07-27 15:32:59'),
(54, 47, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'остекление зимнего сада, замена стеклопакетов, монтаж панорамного остекления, панорамное остекление', 'Монтаж стеклопакетов. Остекление бассейнов, оранжерей. Монтаж террас. Герметизация стеклопакетов. Замена треснувших стекол. Мы работаем как с частными заказчиками, так и с юридическими лицами. Полировка остекления на фасаде здания', '2012-07-25 18:23:24', '2012-07-27 16:12:53'),
(55, 48, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'монтаж труб, покраска труб, демонтаж труб, обслуживание металлоконструкций, разбор трубы', 'Услуги по обслуживанию, покраске, ремонту, монтажу и демонтажу труб. Покраска труб дымовых и водонапорных башен. Разбор и демонтаж труб.', '2012-07-25 18:24:04', '2012-08-02 22:42:02'),
(56, 49, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'обслуживание мостов, ремонт моста, обследование моста, покраска моста', 'Комплекс регламентных работ по обслуживанию мостов и путепроводов. Обследование мостовых соединений и локальный ремонт отдельных элементов конструкции. Обслуживаем железнодорожные, автомобильные, городские пешеходные мосты и туннели.', '2012-07-25 18:24:33', '2012-07-27 16:22:58'),
(57, 50, 'Category', NULL, NULL, NULL, '2012-07-25 18:25:32', '2012-07-27 15:16:58'),
(58, 51, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'монтаж систем видеонаблюдения, установка датчиков дыма, установка датчиков, монтаж системы слежения, монтаж камер наружного наблюдения', 'Проводим монтаж систем видеонаблюдения, монтаж систем слежения, монтаж потолочных светильников цеховых помещениях и зданиях заводов.', '2012-07-25 18:26:12', '2012-07-27 17:02:15'),
(59, 52, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'монтаж электрооборудования, сборка электрических щитов', NULL, '2012-07-25 18:26:36', '2012-07-27 17:04:02'),
(60, 53, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'монтаж сценического оборудования, монтаж оборудования для сцен, монтаж металлоконструкций', 'Производим монтаж и демонтаж мобильных сцен. Монтаж осветительного оборудования для сцен. Мобильные трубины.', '2012-07-25 18:26:57', '2012-07-27 17:09:12'),
(61, 54, 'Category', NULL, NULL, NULL, '2012-07-25 18:27:26', NULL),
(62, 55, 'Category', NULL, NULL, NULL, '2012-07-25 18:27:42', NULL),
(63, 56, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мотнаж световой рекламы, монтаж световых коробов', NULL, '2012-07-25 18:27:59', '2012-07-29 22:53:43'),
(64, 57, 'Category', NULL, NULL, NULL, '2012-07-25 18:28:14', NULL),
(65, 58, 'Category', NULL, NULL, NULL, '2012-07-25 18:28:40', '2012-08-08 17:03:51'),
(66, 59, 'Category', NULL, NULL, NULL, '2012-07-25 18:28:55', NULL),
(73, 63, 'Category', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', NULL, NULL, '2012-07-27 15:05:54', NULL),
(74, 64, 'Category', 'льпинисты Москвы - промышленный альпинизм, любые виды высотных работ', NULL, NULL, '2012-07-27 15:06:38', NULL),
(75, 65, 'Category', NULL, NULL, NULL, '2012-07-30 16:56:43', '2012-07-30 18:35:53'),
(76, 14, 'News', NULL, NULL, NULL, '2012-07-31 17:18:28', NULL),
(77, 25, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мойка окон, мойка фасадов', 'На данном странице мы публикуем новостную ленту о проделанных нами работах.', '2012-08-05 19:24:13', '2012-08-07 11:37:51'),
(78, 26, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мойка окон, мойка фасадов', 'В данном разделе Вы можете ознакомиться с отзывами, которые предоставили нам благодарные заказчики.', '2012-08-05 19:25:25', '2012-08-07 11:41:46'),
(79, 27, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мойка окон фото, мойка фасада, герметизация швов', 'Фотогалерея наших работ. Вы можете увидеть, какие работы мы выполняем.', '2012-08-05 19:25:46', '2012-08-07 11:17:53'),
(80, 28, 'Page', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'мойка окон, мойка фасадов, ремонт фасадов, покраска фасадов', 'На данной странице Вы можете ознакомиться со списком оказываемых нами услуг.', '2012-08-06 00:14:37', '2012-08-07 11:16:26'),
(81, 15, 'News', 'Альпинисты Москвы - промышленный альпинизм, любые виды высотных работ', 'замена панорамного остекления', NULL, '2012-08-08 22:36:12', NULL),
(82, 16, 'News', NULL, 'полировка стекла, мойка окон', NULL, '2012-08-08 22:38:00', NULL),
(83, 17, 'News', NULL, 'установка панорамного остекления', NULL, '2012-08-08 22:39:29', NULL),
(84, 18, 'News', NULL, NULL, NULL, '2012-08-08 22:41:14', '2012-08-08 22:46:27');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `lang`, `user_id`, `title`, `text`, `photo`, `state`, `date`, `date_create`) VALUES
(1, 'ru', 1, 'Начаты работы по установке алюминиевых панелей на козырьке здания', '<p>Выполняется частный заказ по монтажу профилей и установке алюминиевых панелей под козырьком здания. Закрывающие панели выполняют декоративную функцию. <a href="../../../../photo">фото&gt;&gt;</a></p>', '80f3dfc8fb0c6fe5c33950e89eed32cf.jpeg', 'active', '2012-07-24', '0000-00-00 00:00:00'),
(15, 'ru', 1, 'Замена панорамного остекления', '<p>Произведена успешная установка окон панорамного остекления на оранжерее в пос. Довиль, Одинцовский район</p>', NULL, 'active', '2012-08-08', '2012-08-08 22:36:12'),
(16, 'ru', 1, 'Мойка, полировка, установка прижимных планок', '<p>Начата мойка и полировка стекла на объекте в пос. Довиль. Установлены прижимные планки на остеклении оранжереи.</p>', NULL, 'active', '2012-08-09', '2012-08-08 22:38:00'),
(17, 'ru', 1, 'Установка панорамного остекления', '<p>Произведена установка двух панорамных стеклопакетов. Выполнялся частный заказ.</p>', NULL, 'active', '2012-08-02', '2012-08-08 22:39:29'),
(18, 'ru', 1, 'Обустройство отмостки, укладка декоративной брусчатки', '<p>Возобновлены работы по устройству отмостки фасада дома и укладке декоративной брусчатки в коттеджном поселке "Согласие-4", Троицк</p>', NULL, 'active', '2012-08-09', '2012-08-08 22:41:14'),
(2, 'ru', 1, 'Успешно выполнена работа по гидроизоляции подвального помещения', '<p>При проведении работ по устранению протечек были использованы современные проникающие порошковые смеси Пенетрон, позволяющие практически мгновенно устранить щели в бетоне и провести качественную и надежную гидроизоляцию.</p>', 'be8a93e588f5469ee426a77a66e2444a.png', 'active', '2012-07-19', '0000-00-00 00:00:00'),
(3, 'ru', 1, 'Выполнены работы по герметизации швов', '<p>Полностью завершены работы по герметизации швов на оранжерее (XVIII век) в элитном поселке Довиль, Одинцовский район Московской области.<strong><br /></strong></p>', '328a76e70961ee6f64165f802d281e09.jpg', 'active', '2012-07-13', '0000-00-00 00:00:00'),
(14, 'ru', 1, 'Успешно выполнено 30% работ по установке алюминиевых панелей', '<p>Наши альпинисты успешно выполнили часть работ по облицовке козырька под крышей жилого дома, расположенного по адресу Студенческая ул, д. 20</p>', NULL, 'active', '2012-07-31', '2012-07-31 17:18:28'),
(4, 'en', 1, 'Intel brandishes first Google Android tablet', '<p>SAN FRANCISCO--Intel hauled out its first\r\n<a href="http://www.cnet.com/android-atlas/">Android</a>\r\n<a href="http://reviews.cnet.com/tablets/">tablet</a>\r\n running on "Medfield," an upcoming Atom chip for smartphones and \r\ntablets, while two executives also chatted with CNET about their \r\nrelationship with Google, all at Intel''s developer conference today. </p>\r\n<p>The Medfield Atom chip is one of Intel''s most power-efficient chip \r\ndesigns--a strict requirement for tablets and smartphones. It contains a\r\n single processing core--as opposed to more power-hungry dual-core Atom \r\nchips used in Netbooks--and will be available in devices in the first \r\nhalf of 2012. </p>\r\n<p>The tablet that Intel showed today (see photo below) is a so-called \r\nreference design that the company will supply to tablet makers that \r\nwould use it as a template for their own product. </p>\r\n<p>Importantly, Intel-based tablets and smartphones will be targeted at \r\nGoogle''s Android software, not Intel''s internal MeeGo operating system. \r\nThe latter has been relegated to automotive and industrial applications \r\nmostly and is no longer seen as a promising operating system for \r\nconsumer devices. To drive this point home, Intel reaffirmed its \r\nrelationship with Google today. </p>\r\n<p>CNET sat down briefly with two Intel phone executives to talk about \r\nthe relationship. The reaffirmation of the relationship is about \r\n"optimizing Intel for the Android platform for phone and for tablets," \r\nsaid Mike Bell, co-general manager of the phone division. "So, as a \r\n[device maker] you''ll be able to go out and build a device with the full\r\n blessing and backing of Intel and Google," he said. </p>\r\n<p>Intel has done an about-face of sorts. Its phone efforts had focused \r\nheavily on Nokia until that company made a dramatic switch to \r\nMicrosoft''s Windows phone platform. "We were very focused on Nokia. Mike\r\n and I took over in April and got the company very focused on the \r\nAndroid ecosystem," said Dave Whalen, the other co-manager of the phone \r\ndivision. </p><div><br />Read more: <a href="http://news.cnet.com/8301-13924_3-20105608-64/intel-brandishes-first-google-android-tablet/#ixzz1Xw5pQIsr">http://news.cnet.com/8301-13924_3-20105608-64/intel-brandishes-first-google-android-tablet/#ixzz1Xw5pQIsr</a><br /></div>  ', 'c142759dc89ae8e20abc642e1dd0e99c.jpg', 'active', '2011-09-14', '0000-00-00 00:00:00'),
(5, 'en', 1, 'Windows 8 debuts at Microsoft Build (live blog)  Read more: http://news.cnet.com/8301-10805_3-20105152-75/windows-8-debuts-at-microsoft-build-live-blog/#ixzz1Xw61Mgip', '<p>A new analyst report making the rounds this morning asserts that \r\nApple''s putting the finishing touches on iOS 5, and plans to send it to \r\nits device assemblers as soon as next week. </p>\r\n<p>Analyst Ming-Chi Kuo of Concord Securities told <a href="http://www.appleinsider.com/articles/11/09/12/apple_to_release_ios_5_gm_to_assemblers_during_week_of_sept_23.html">AppleInsider</a> and <a href="http://www.macrumors.com/2011/09/12/apple-sending-ios-5-to-iphone-assemblers-at-end-of-september-no-sign-of-redesigned-iphone-5/">MacRumors</a>\r\n today that Apple should be delivering the golden master version of iOS 5\r\n between September 23 and 30. That software will then be imaged onto new\r\n devices that ship out to stores.\r\n</p>\r\n<p>The timing is of special note given expectations of a new\r\n<a href="http://www.cnet.com/apple-iphone.html">iPhone </a>and\r\n<a href="http://www.cnet.com/ipod/">iPod Touch</a> \r\nin the coming weeks. Kuo suggests it will take 10 to 12 days for \r\nshipping of new iPhones and iPod Touch units with the upgraded software,\r\n placing a higher possibility that those units won''t be available until \r\nthe second week of October. </p>\r\n<p>Apple released the latest beta version of its iOS 5 system software \r\nto developers at the tail end of August, the seventh iteration since \r\ntaking the wraps off the software at its Worldwide Developers Conference\r\n in June. So far, Apple has gone through a lengthier test process than \r\nusual, releasing a new beta of the software every few weeks ahead of the\r\n golden master, which represents the version the public gets: </p><div><br />Read more: <a href="http://news.cnet.com/8301-27076_3-20104888-248/ios-5-gold-master-expected-next-week-report-says/#ixzz1Xw6AsG9Q">http://news.cnet.com/8301-27076_3-20104888-248/ios-5-gold-master-expected-next-week-report-says/#ixzz1Xw6AsG9Q</a><br /></div>    ', '9bfe8a178df245ee90a2b5d62bfe682b.jpg', 'active', '2011-09-14', '0000-00-00 00:00:00'),
(6, 'en', 1, 'Google Street View''s naked lady', '<p>It is well accepted that, if there were commercial gain involved, \r\nGoogle might not be averse to peering inside the most intimate parts of \r\nyour life.</p>\r\n<p>However, sometimes the company manages to cast its gaze without even realizing just how close to you it is.</p>\r\n<p>I am sure some will be grateful to <a href="http://www.thesmokinggun.com/buster/google/google-street-view-naked-woman-094672">the always generous Smoking Gun</a>\r\n for leading them (in a SFW way) to a street in Miami, where a woman is \r\nstanding outside her front door naked. (The story of these interesting \r\npixels was originally broken by the <a href="http://randompixels.blogspot.com/2011/09/stay-classy-miami.html">Random Pixels blog</a>) </p>\r\n<p>Oh, of course it''s on Google Street View. Where else would you find truly unguarded moments, like <a href="http://news.cnet.com/8301-17852_3-20013500-71.html">a 10-year-old playing dead</a> or, indeed, <a href="http://news.cnet.com/8301-17852_3-20023487-71.html">a naked man in an open car trunk</a>?</p><p>In the Miami case, it appears the lady may have spotted Google''s \r\nmarauding recording vehicle, for in a subsequent shot on the site she \r\nattempts to cover up.</p>\r\n<p>The nude pose was still up in all its glory last night. However, this\r\n morning it''s blurred. What remains is merely a shot of her house and \r\nthe blurry image of a naked ghost.</p>\r\n<p>There will be those who will wonder what the naked lady might have \r\nbeen doing outside her house in a clothing-optional state. The obvious \r\nanswer would be that Miami is very hot. In this case, the naked lady \r\nappeared to be washing. Though this might have merely been a scene from \r\nyet another M. Night Shyamalan movie.</p>\r\n<p>Still, one can only wonder what other gems might still exist on a \r\nservice that, with its real-time captures of a microcosm of the world, \r\ntells us how people really spend their days. </p>  ', '22285438321c76a76dc925206f5dd5bf.png', 'active', '2011-09-14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(2) DEFAULT 'ru' COMMENT 'Язык',
  `title` varchar(200) NOT NULL COMMENT 'Заголовок',
  `url` varchar(250) DEFAULT NULL COMMENT 'Адрес',
  `text` text NOT NULL COMMENT 'Текст',
  `is_published` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Опубликована',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Создана',
  `sidebar_top` text NOT NULL COMMENT 'Верхний сайдбар',
  `sidebar_top_title` varchar(255) NOT NULL COMMENT 'Верхний сайдбар - Заголовок',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `lang`, `title`, `url`, `text`, `is_published`, `date_create`, `sidebar_top`, `sidebar_top_title`) VALUES
(1, 'ru', 'Наши <span>Услуги</span>', '/', '<p style="text-align: justify;">Основная специализация нашей компании <span style="font-size: small;">&ndash;&nbsp;</span><strong>высотные работы самого широкого профиля</strong>.</p>\r\n<p style="text-align: justify;">Спектр наших услуг не ограничивается представленными на сайте разделами. Мы готовы выполнить любые строительно-монтажные работы по Вашему заказу. Позвоните нам, и мы дадим Вам подробную консультацию о применяемых технологиях и используемых материалах, обсудим детали проекта, сориентируем Вас по ценам и исполним Ваш заказ в максимально сжатые сроки.</p>\r\n<p style="text-align: justify;">У нас в команде работает постоянная слаженная бригада. Мы всегда рады сотрудничеству и с готовностью беремся за каждый новый проект. Мы работаем как с частными заказчиками, так и с юридическими лицами. В том и другом случае мы нацелены на долгосрочное сотрудничество. Именно поэтому наш девиз звучит как:</p>\r\n<p style="text-align: center;"><span style="font-size: medium;"><strong><span style="font-size: large;">КАЧЕСТВО. &nbsp; &nbsp;ПАРТНЕРСТВО. &nbsp; &nbsp;РЕЗУЛЬТАТ.</span></strong></span></p>\r\n<p style="text-align: justify;">Опыт и квалификация, профессиональный подход и ответственность за результат <span style="font-size: small;">&ndash; </span>мы всегда придерживаемся этих принципов в нашей работе. Полученные <a href="../../../../reviews">рекомендации</a> свидетельствуют о качестве оказываемых нами услуг.<br />Обратитесь к нам, и мы гарантируем, что результат удовлетворит все Ваши ожидания!</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br />Оценка стоимости конкретного вида работ производится после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<span style="font-size: small;"> &ndash; <strong><span style="font-size: large;">бесплатно!</span></strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 1, '2011-06-25 16:23:15', '<p style="text-align: center;">Промышленная группа &laquo;Альпинисты Москвы&raquo; рада приветствовать Вас на своем сайте! Основное направление деятельности нашей компании &ndash; промышленный альпинизм. Доступ к объекту с веревок позволяет сэкономить время и существенно снижает стоимость строительных, отделочных и монтажных работ. Наша работа &ndash; всегда на высоте!<br /> <br /> <strong>ПОЗВОНИТЕ НАМ!</strong><br />&nbsp; Мы возьмем на себя Ваши заботы!</p>', 'ДОБРО ПОЖАЛОВАТЬ!'),
(22, 'ru', 'Наши <span>Цены</span>', 'prices', '<p style="text-align: left;"><strong>В ЭТОМ РАЗДЕЛЕ ВЫ МОЖЕТЕ ОЗНАКОМИТЬСЯ С ПРИМЕРНЫМИ ЦЕНАМИ НА НАШИ УСЛУГИ.<br /></strong> <span style="text-decoration: underline;">На окончательное формирование цены могут влиять следующие факторы:</span><br />&bull;ограниченное время или срочность работы (например, работа возможна только ночью или в выходные дни)<br />&bull;этажность здания и сложная конфигурация фасада (большие козырьки, нависания, выступающие конструкции)<br />&bull;угол наклона крыши, отсутствие мест креплений на крыше и ограждений на кровле<br />&bull;большая проходимость людей т.п.</p>\r\n<p style="text-align: left;">&nbsp;</p>\r\n<p style="text-align: center;"><strong>Мы рады предложить нашим постоянным клиентам<br /><span style="color: #198cc2; font-size: large;"><strong>СКИДКИ<br /></strong></span>за большой объем выполняемых работ<br />и комплексное сотрудничество по различным направлениям нашей деятельности.</strong></p>', 0, '2011-12-28 20:49:51', '<p><strong><span style="font-size: medium;">НАШИ ЦЕНЫ</span></strong></p>', ''),
(2, 'ru', 'О нас', '', '<p>ПромАльпГруппа "ВертикАльП" собрала под своим именем профессионалов, работающих в сфере промышленного альпинизма.</p>', 0, '2011-09-10 17:11:25', '', ''),
(20, 'ru', 'Наши <span>Контакты</span>', 'contacts', '<p style="text-align: center;"><span style="text-decoration: underline; font-size: medium;"><strong><br />НАШИ ТЕЛЕФОНЫ:</strong></span></p>\r\n<p style="text-align: center;">ОФИС С 10-00 ДО 20-00<span style="font-size: medium;"><br /><br /><span style="font-size: large;">+7 (499) 390-15-57</span></span></p>\r\n<p style="text-align: center;"><br /><strong>ФАСАДНЫЕ, КРОВЕЛЬНЫЕ РАБОТЫ, ПРОМЫШЛЕННЫЙ АЛЬПИНИЗМ</strong></p>\r\n<p style="text-align: center;"><span style="font-size: large;">+7 (925) 777-09-50<br />+7 (964) 594-85-51</span><span style="font-size: medium;"><br /></span><span style="font-size: medium;">контактное лицо - Александр<br /><br /></span></p>\r\n<p style="text-align: center;"><strong>ЭЛЕКТРОМОНТАЖ</strong><span style="font-size: medium;">&nbsp;</span></p>\r\n<p style="text-align: center;"><span style="font-size: medium;"><span style="font-size: large;">+7 (495) 645-77-91</span><br /><span style="font-size: large;">+7 (905) 75-76-722</span></span><span style="font-size: medium;"><br /></span><span style="font-size: medium;">контактное лицо - Алексей</span><span style="font-size: medium;">&nbsp;</span></p>\r\n<p style="text-align: center;"><strong>E-mail:</strong></p>\r\n<p style="text-align: center;"><span style="font-size: medium;">alp.mos@yandex.ru</span>&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;<strong>Промышленная группа &laquo;Альпинисты Москвы&raquo; с радостью выполнит для Вас&nbsp;</strong><br /><strong>самые разнообразные высотные работы. </strong><strong>Спасибо, что выбрали нас!</strong><br /><br /></strong>Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 1, '2011-12-12 20:43:55', '', 'КОНТАКТЫ'),
(21, 'ru', 'Сотрудничество <span>С нами</span>', 'cooperation', '<p style="text-align: center;"><strong><span style="font-size: medium;">Промышленная Группа &laquo;Альпинисты Москвы&raquo; рада предложить сотрудничество </span><span style="font-size: medium;">как юридическим, так и физическим лицам.</span></strong><br /><br /><strong>В разделе&nbsp;</strong><strong><a href="../../../../page/contacts">Контакты</a> </strong><strong>Вы можете выбрать наиболее удобный способ связи с нами.</strong></p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><span style="color: #ff6600;"><strong>1. Юридическим лицам.</strong></span> Сотрудничество с организациями предполагает работу на условиях генподряда или субподряда. Мы также охотно сотрудничаем с event-агентствами и рекламными компаниями, занимающимися необычными поздравлениями.<br /><span style="text-decoration: underline;"><em><strong>Для выполнения работ в качестве генподрядчика</strong></em></span> наши сотрудники детально ознакомятся с вашим проектом, в случае необходимости дадут совет по использованию тех или иных материалов, согласуют применяемые технологии, обсудят сроки сдачи объекта.Собственникам мы можем предложить постоянное годовое обслуживание Вашего здания &ndash; в зимний период мы проведем уборку кровли от снега и наледи, весной помоем фасад, летом выполним покраску стен, ремонт кровли, чистку кондиционеров, осенью подготовим здание к зимнему периоду путем утепления и герметизации.<br /><span style="text-decoration: underline;"><em><strong>При работе по договору субподряда</strong></em></span>&nbsp;мы будем рады сотрудничеству с клининговыми и строительными компаниями, с ТСЖ и муниципальными структурами. Если у вас горят сроки сдачи объекта, если предыдущие работники не справились с поставленной задачей или не смогли до конца выполнить свои обязательства &ndash; звоните нам, мы постараемся вам помочь.<br /><span style="text-decoration: underline;"><em><strong>Необычные поздравления.</strong></em></span> Наша компания готова предложить сотрудничество в области организации нестандартных поздравлений. Промышленные альпинисты с радостью выполнят заказ &laquo;поздравление в окно&raquo; как для взрослых (поздравление с 8-м марта), так и для детей (новогоднее поздравление от Деда Мороза).</span></p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><strong><span style="color: #00ccff;"><span style="color: #ff6600;"><strong>2. Частным заказчикам</strong></span> </span></strong>мы посвятили отдельный </span><a href="../../../../chapter/private">Раздел</a><span style="font-size: small;">. Мы с радостью выполним для вас любые разовые работы в соответствии с вашими пожеланиями. Вне зависимости от того, живете ли вы в многоквартирном доме или являетесь обладателем собственного коттеджа, вы всегда можете обратиться к нам за консультацией.</span></p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><strong><span style="color: #00ccff;"><span style="color: #ff6600;"><strong>3. Физическим лицам. </strong></span></span></strong>Мы также нуждаемся в опытных специалистах своего дела, способных выполнять работу четко, профессионально, с соблюдением сроков и с учетом пожеланий заказчиков. Мы гарантируем своевременную оплату за выполненные работы. Нам нужны надежные и ответственные люди, умеющие решать нестандартные задачи. Свои резюме вы можете отправлять на наш электронный адрес, мы обязательно свяжемся с вами!</span></p>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;, руководствуясь наработанным опытом, подберут для Вас оптимальное решение по применяемым технологиям, согласуют график работ, обсудят детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 1, '2011-12-13 17:59:30', '', ''),
(25, 'ru', 'Наши <span>Новости</span>', 'news', '', 0, '2012-08-05 19:24:13', '', 'НОВОСТИ'),
(26, 'ru', 'Отзывы <span>О нас</span>', 'reviews', '', 0, '2012-08-05 19:25:25', '<p style="text-align: center;">В данном разделе Вы можете увидеть, какие отзывы о нашей работе оставляют благодарные клиенты.</p>', 'ОТЗЫВЫ О НАС'),
(27, 'ru', 'Галерея', 'gallery', '', 0, '2012-08-05 19:25:46', '<p style="text-align: center;">Промышленная группа "Альпинисты Москвы" ведет постоянные фоторепортажи со своих объектов, чтобы наглядно показать, насколько широк спектр выполняемых нами работ.</p>\r\n<p style="text-align: center;">Посмотрев нашу фотогалерею, Вы сможете убедиться, что нам можно доверить работу любой сложности!</p>\r\n<p style="text-align: center;"><strong>Позвоните нам!<br /></strong>Мы возьмем на себя Ваши заботы!</p>\r\n<p>&nbsp;</p>', 'ГАЛЕРЕЯ НАШИХ РАБОТ'),
(28, 'ru', 'Услуги', 'service', '', 0, '2012-08-06 00:14:37', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `pages_blocks`
--

DROP TABLE IF EXISTS `pages_blocks`;
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


-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Название',
  `is_published` tinyint(1) NOT NULL COMMENT 'Опубликована',
  `order` int(11) NOT NULL COMMENT 'Сортировка',
  `photo` varchar(250) NOT NULL COMMENT 'Скан отзыва',
  `date` date NOT NULL COMMENT 'Дата',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `title`, `is_published`, `order`, `photo`, `date`) VALUES
(1, 'СтройИнжинирингГрупп', 1, 2, 'b2f3a188a90983fb022d715d81357d4e.jpg', '2012-01-01'),
(2, 'Престиж Строй', 1, 1, '5ca712da4053518620a25aa34ca1def3.jpg', '2012-01-01'),
(7, 'Драйв-очистка от снега', 1, 3, '43d026ff4bcec1b09572833adf00b1d2.jpg', '2012-04-10'),
(8, 'Драйв-мойка фасада', 1, 4, '3f4fef3737f567bc42ebef463347a237.jpg', '2012-05-15');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

DROP TABLE IF EXISTS `settings`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `module_id`, `code`, `name`, `value`, `element`, `hidden`) VALUES
(1, 'users', 'registration_mail_body', 'Шаблон письма регистрации', '<p>Здравствуйте {LAST_NAME} {FIRST_NAME} {PATRONYMIC}!</p>\r\n<p>Вы зарегистрировались на сайте {SITE_NAME}.</p>\r\n<p>Для завершения регистрации пройдите <a href="%7BACTIVATE_ACCOUNT_URL%7D">по этой ссылке.</a></p>\r\n<p>Адрес ссылки: {ACTIVATE_ACCOUNT_URL}</p>  ', 'editor', 0),
(7, 'users', 'registration_mail_subject', 'Тема письма регистрации', 'Регистрация на сайте {SITE_NAME}', 'text', 0),
(9, 'users', 'registration_done_message', 'Сообщение о завершении регистрации', '<p>Вы успешно зарегистрированы в системе, на ваш Email отправлено письмо с инструкциями завершения регистрации.</p>', 'editor', 0),
(10, 'users', 'activate_request_done_message', 'Сообщение после повторного запроса активации аккаунта', 'Мы выслали на ваш Email письмо, в котором нужно будет пройти по ссылке для активации аккаунта!', 'textarea', 0),
(11, 'users', 'change_password_request_mail_body', 'Шаблон письма запроса на смену пароля', '<p>Здравствуйте {LAST_NAME} {FIRST_NAME} {PATRONYMIC}!</p>\r\n<p>Вы сделали запрос на восстановление пароля на сайте {SITE_NAME}.</p>\r\n<p>Для того чтобы изменить пароль пройдите <a href="%7BLINK%7D">по этой ссылке.</a></p>\r\n<p>Адрес ссылки: {LINK}</p>  ', 'editor', 0),
(12, 'users', 'change_password_request_mail_subject', 'Тема письма запроса на смену пароля', 'Запрос на смену пароля {SITE_NAME}  ', 'editor', 0),
(25, 'main', 'phone1', 'Телефон1', '<span>+7 (499)</span> 390-15-57', 'text', 0),
(26, 'main', 'phone2', 'Телефон2', '<span>+7 (925)</span> 777-09-50', 'text', 0),
(27, 'main', 'phone3', 'Телефон3', '<span>+7 (964)</span> 594-85-51', 'text', 0),
(34, 'main', 'footer', 'Подвал', '1', 'textarea', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `site_actions`
--

DROP TABLE IF EXISTS `site_actions`;
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

DROP TABLE IF EXISTS `users`;
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
(1, 'Светлана', 'Колбаскова', NULL, 'pravil_net@mail.ru', '+7-965-1935233', '3aa794c53774cedecd73bec7e2c3d576', '2003-05-20', 'man', 'active', '070a63ae33af0eb7986992e774dc53e8', '2011-05-21 13:18:39', NULL, NULL, '2011-05-19 03:25:50'),
(19, 'Алексей', 'Шаров', NULL, 'www.pismeco@gmail.com', NULL, 'a1268781a44027b5633fd2140da69ecb', '2000-11-30', 'man', 'active', '827ccb0eea8a706c4c34a16891f84e7b', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '2011-11-11 16:17:20');
