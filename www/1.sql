-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 25 2012 г., 03:00
-- Версия сервера: 5.1.40
-- Версия PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- БД: `alp`
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
('Page_Services', 0, NULL, NULL, 'N;', 1),
('Category_Service', 0, NULL, NULL, 'N;', 1),
('Category_Prices', 0, NULL, NULL, NULL, 1),
('Category_Price', 0, NULL, NULL, NULL, 1);

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
  `for_price` text NOT NULL COMMENT 'Для страницы "Цены"',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Категория' AUTO_INCREMENT=41 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `back_left`, `back_center`, `alias`, `for_price`) VALUES
(1, 'root', 1, 1, 72, '2012-03-26 14:26:51', 0, 1, NULL, NULL, NULL, NULL, NULL, ''),
(2, 'Клининг', 2, 2, 7, '2012-03-25 23:41:33', 1, 0, '<p style="text-align: justify;"><strong>Мойка окон и мойка фасадов </strong>поможет привести облик любого здания в надлежащий вид. Жилые дома, складские и офисные помещения или торговые центры со сплошной облицовкой &ndash; любые фасады и остекленные поверхности нуждаются в регулярной очистке от накапливающейся грязи, пыли и городского смога. Своевременная мойка не только освежает внешний вид фасада, но одновременно служит для профилактики постепенного разрушения здания.</p>\r\n<p style="text-align: justify;">В крупных городах ответственность за поддержание внешнего вида здания ложится на собственника, и услуги по мойке фасадов и окон являются крайне востребованными. Для выполнения такого рода работ и привлекаются промышленные альпинисты.</p>\r\n<p style="text-align: justify;">Нередки ситуации, когда конструкция здания такова, что добраться без сложностей до отдельных поверхностей фасада не представляется возможным. В силу особенностей архитектурных решений здания могут иметь выступающие козырьки крыльца, отрицательный уклон панорманого остекления фасада, колонны, навесы и т.п. В зависимости от труднодоступности очищаемой поверхности может быть применено непосредственно альпинистское снаряжение, или же будут использованы автовышки, туры или телескопические погрузчики.</p>\r\n<p style="text-align: left;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong>&nbsp;Специалисты ПромАльпГруппы &laquo;Вертик<em>А</em>льП</strong><strong>&raquo;,    руководствуясь наработанным опытом, подберут для Вас оптимальное    решение по применяемым технологиям, согласуют график работ, обсудят    детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '8f3bc83fa155a10d62888f36cacd029f.jpg', '9c5d0b1817503e821cb0ab4d6f2674ae.jpg', NULL, 'cleaning', '<p><strong>&nbsp;&nbsp; МОЙКА ОКОН, МОЙКА ФАСАДОВ</strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Мойка   окон</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">от 45</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Мойка фасадов</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">от 42</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Мойка окон   после стройки (послестрой)</td>\r\n<td class="xl73" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl74" style="text-align: center;">от 85</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 6 000 руб.</strong></p>'),
(3, 'Фасадные работы', 2, 8, 21, '2012-01-11 00:14:38', 1, 0, '<p style="text-align: justify;">Внешний вид любого здания является его визитной карточкой, поэтому так важно, чтобы фасад выглядел чистым, свежим, ухоженным. Проблемы, связанные с восстановлением облика здания, помогут решить <strong>фасадные работы</strong>, объединенные в комплекс многопрофильных задач, разбитых на этапы. Очистка фасада, штукатурные работы, шпатлевка, покраска, облицовочные работы, устройство цоколя, установка дополнительных декоративных элементов, реставрация лепнины, восстановление балконов, герметизация швов &ndash; все это и многое другое входит в понятие &laquo;фасадные работы&raquo;.</p>\r\n<p style="text-align: justify;">Правильное устройство фасада позволяет владельцам здания заботиться лишь о поддержании его в надлежащем состоянии. Однако, неблагоприятное воздействие окружающей среды, возможные ошибки, допущенные при строительстве, небережная эксплуатация &ndash; все это может стать причиной разрушений.</p>\r\n<p style="text-align: justify;">С помощью технологий промышленного альпинизма можно в короткие сроки устранить имеющиеся дефекты и придать внешнему виду фасада обновленный вид. Высотные работы, выполненные промышленными альпинистами, избавят от установки громоздких строительных лесов, не создадут дополнительных проблем с ограждением лишней территории вокруг места проведения работ и, конечно, сэкономят время и деньги.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,     руководствуясь наработанным опытом, подберут для Вас оптимальное     решение по применяемым технологиям, согласуют график работ, обсудят     детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '894a9044dccfd49503a8797e56c7fd75.jpg', '53f45f27a23cee6169fc8f4cf40b48b3.jpg', NULL, 'fasads', '<p><strong>&nbsp;&nbsp; ПОКРАСКА ФАСАДОВ</strong></p>\r\n<table style="width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr style="background-color: #cccccc; height: 40px;">\r\n<td class="xl75" style="text-align: center;" width="775" height="40"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td class="xl76" style="text-align: center;" width="89"><strong>Ед. изм.</strong></td>\r\n<td class="xl77" style="text-align: center;" width="89"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl71" width="775" height="40"><strong>Очистка   старой краски</strong><br /> Очистка сторой краски металлическими щетками или механическим способом</td>\r\n<td class="xl65" style="text-align: center;">м. кв.</td>\r\n<td class="xl66" style="text-align: center;">от 50</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" width="775" height="40"><strong>Мойка фасада перед покраской</strong><span><br /> Мойка фасада аппаратом высокого давления</span></td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 35</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Грунтовка   поверхности</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 40</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" width="775" height="40"><strong>Окраска поверхности фасада (один слой)</strong><span><br /> Oкраска фасада выполняется валиками или краскопультом</span></td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 55</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Окраска   поверхности фасада более трех цветов (один слой)</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 85</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Окраска   лепнины</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 135</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Окраска   оконных рам</td>\r\n<td class="xl67" style="text-align: center;">шт.</td>\r\n<td class="xl68" style="text-align: center;">от 400</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Окраска   оконных и балконных решеток (по площади решетки)</td>\r\n<td class="xl67" style="text-align: center;">шт.</td>\r\n<td class="xl68" style="text-align: center;">от 480</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Окраска   подоконных отливов</td>\r\n<td class="xl67" style="text-align: center;">шт.</td>\r\n<td class="xl68" style="text-align: center;">от 130</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Покраска   карнизов</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 95</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Окраска   водосточных труб</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 140</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl74" height="40">Окраска   пожарных лестниц</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">от 220</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 6 000 руб.</strong></p>'),
(4, 'Кровельные работы', 2, 22, 33, '2012-01-11 00:20:08', 1, 0, '<p style="text-align: justify;"><strong>Кровельные</strong> <strong>работы</strong> являются одним из последних этапов в строительстве здания. Правильно подобранные кровельные материалы и технология устройства кровли обеспечат надежность крыши и долговечность ее эксплуатации. Многослойность современной кровли, за которую ее еще называют &laquo;пирогом&raquo;, ставит перед монтажником задачу правильного совмещения всех ее слоев в единую систему кровельного покрытия.</p>\r\n<p style="text-align: justify;">Помимо самой кровли, состоящей из несущей обрешетки, гидроизоляции, утеплителя, пароизоляционной пленки и кровельного покрытия, кровельная система включает в себя множество дополнительных элементов. Они в свою очередь образуют целостную систему безопасности кровли, обеспечивающую удобство при обслуживании здания.</p>\r\n<p style="text-align: justify;">От качества кровельного покрытия зависит долговечность и сохранность всего дома. Ведь кровля защищает не только само строение, но и все, что находится внутри него. Из-за протечек на стенах может образовываться плесень. Ошибки в выборе используемых материалов могут привести к деформации кровли, что в свою очередь окажет давление на фундамент всей конструкции, и она может покоситься. Неверный монтаж способен спровоцировать обрушение кровли. Именно поэтому кровельным работам нужно уделять максимальное внимание, ведь зачастую ремонт и восстановление могут обойтись гораздо дороже, чем затраты на первоначальный качественный монтаж.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '10ef21130e9acaad8b1efbf5a1c00918.jpg', 'e8b1a7d4c6817bbe64560c1c646ec34f.jpg', NULL, 'crovel', '<p><strong>&nbsp;&nbsp; ОБЩАЯ ИНФОРМАЦИЯ</strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Монтаж кровли<br /></td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Ремонт кровли</td>\r\n<td class="xl69" style="text-align: center;">м.кв.</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Герметизация кровли<br /></td>\r\n<td class="xl69" style="text-align: center;">м.пог.</td>\r\n<td class="xl70" style="text-align: center;">от 250<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Замена желобов<br /></td>\r\n<td class="xl73" style="text-align: center;">м.пог.</td>\r\n<td class="xl74" style="text-align: center;">договорная</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>'),
(5, 'Обслуживание мостов и гидросооружений', 2, 34, 39, '2012-05-14 13:22:45', 1, 0, '<p style="text-align: justify;">Наши города растут и развиваются, увеличивается количество современных объектов, облегчающих жизнь людей, делающих ее более комфортной. Для увеличения сроков службы таких объектов им требуется постоянное и комплексное обслуживание. Это позволит не только обеспечить их надежность, но и сэкономит деньги на новое строительство.</p>\r\n<p style="text-align: justify;">Одним из монументальных изобретений человечества являются <span style="color: #000000;"><strong><em>гидросооружения</em></strong>.</span> Существует большое количество разнообразных объектов, относящихся к этому классу &ndash; это и гидроэлектростанции, и плотины, причалы, шлюзы и дамбы, и т.д. Это сложные системы, в функции которых входит обеспечение рационального использования воды. <span style="color: #198cc2;"><strong>Обслуживание гидросооружений</strong></span> позволяет поддерживать их в эксплуатационном состоянии. Полный комплекс решаемых при этом задач состоит из обследовательских, очистительных, ремонтно-восстановительных работ.</p>\r\n<p style="text-align: justify;">Не менее важными в жизни человека являются <span style="color: #000000;"><strong><em>мосты</em></strong>.</span> В настоящее время невозможно представить существование мегаполисов без авто и железнодорожных мостов, тоннелей и путепроводов. <span style="color: #198cc2;"><strong>Обслуживание мостов</strong></span> включает в себя разнообразные работы, направленные на защиту конструкции от воздействия влаги, агрессивных щелочных и кислотных соединений, оседающих на поверхности мостов. Регулярное инспектирование и контроль позволят снизить эксплуатационные затраты за счет сокращения периодичности и объемов ремонтных работ.</p>\r\n<p style="text-align: justify;">Использование технологий промышленного альпинизма на отдельных этапах реализации этих задач становится экономически более выгодным, нежели постоянное содержание в штате таких сотрудников.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'a96d44e82ece5e18a14d463f7637ad25.jpg', '09787dc9fe0ebb8b6057645043e03988.jpg', NULL, 'hydro', '<p>&nbsp;- точная стоимость определяется после выезда нашего специалиста на объект;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость экспертизы мостов или гидросооружений от 70 000 тыс. руб.</strong></p>'),
(6, 'Оборудование, металлоконструкции', 2, 40, 47, '2012-05-14 13:30:24', 1, 0, '<p style="text-align: justify;">С развитием строительства в стране повышается спрос на различные объекты промышленного назначения. Многопрофильное <strong>оборудование и металлоконструкции</strong> становятся неизменными спутниками нашей жизни, окружают нас повсюду, дают нам свет и тепло, соединяют между собой города и страны. Сооружение каждого из таких объектов является весьма дорогостоящим мероприятием. Чтобы поддержать их в рабочем состоянии как можно более длительное время, человеку нужно постоянно следить за их эксплуатационными характеристиками, вовремя проводить ремонт и комплексное обслуживание.</p>\r\n<p style="text-align: justify;">Технологии промышленного альпинизма, пожалуй, единственный способ реализовать эти задачи. Многие конструкции имеют столь сложную конфигурацию, что добраться до отдельных мест, узлов, деталей бывает невозможно без специальной подготовки и снаряжения. Опытные профессионалы, прошедшие специальную подготовку, помогут решить вопросы, связанные с приведением сооружения в рабочее состояние, его ремонтом, а если потребуется и поэтапным демонтажом.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '45a9e4ea2a4f4b1765dd896746a30e75.jpg', 'e442528d9e8d1a86772021908e13f2ed.jpg', NULL, 'media', '<p><strong>&nbsp;&nbsp; МЕТАЛЛОКОНСТРУКЦИИ</strong></p>\r\n<table style="border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5" width="800" height="282">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr style="background-color: #cccccc; height: 40px;">\r\n<td class="xl75" style="text-align: center;" width="775" height="40"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td class="xl76" style="text-align: center;" width="89"><strong>Ед. изм.</strong></td>\r\n<td class="xl77" style="text-align: center;" width="89"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl71" width="775" height="40"><strong></strong>Монтаж воздуховодов: O 200</td>\r\n<td class="xl65" style="text-align: center;">м. п.</td>\r\n<td class="xl66" style="text-align: center;">от 200</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" width="775" height="40"><strong></strong>Монтаж воздуховодов: O 400</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 400<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Монтаж воздуховодов: O 600</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 600<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" width="775" height="40"><strong></strong>Монтаж воздуховодов: O 800</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 1000<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Монтаж воздуховодов: O 1000</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 1200<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Демонтаж составляет 70% от стоимости монтажа</td>\r\n<td class="xl67" style="text-align: center;"></td>\r\n<td class="xl68" style="text-align: center;"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>\r\n<p>СТОИМОСТЬ РАБОТ, СВЯЗАННЫХ С УСТАНОВКОЙ И ОБСЛУЖИВАНИЕМ <span style="color: #000000;"><strong><em>ОБОРУДОВАНИЯ</em></strong></span> ОПРЕДЕЛЯЕТСЯ ПОСЛЕ ОСМОТРА ОБЪЕКТА<br />СТОИМОСТЬ РАБОТ ПО ОБСЛУЖИВАНИЮ, РАЗБОРУ, ПОКРАСКЕ <span style="color: #000000;"><strong><em>ТРУБ</em></strong></span> ОПРЕДЕЛЯЕТСЯ ПОСЛЕ ОСМОТРА ОБЪЕКТА</p>'),
(7, 'Свет, реклама, декор', 2, 48, 57, '2012-05-14 12:52:45', 1, 0, '<p style="text-align: justify;">﻿﻿<strong>Реклама</strong> является одним из самых эффективных способов привлечения внимания и, как следствие, залогом успешного бизнеса. Она создает и поддерживает имидж компании, способствует формированию положительных эмоций у потребителей. Реклама может размещаться как снаружи (на улицах города, на стенах домов, на крышах зданий), так и внутри (организация выставочных павильонов, украшение торговых центров).</p>\r\n<p style="text-align: justify;">Монтаж рекламных конструкции часто связан с работой с электричеством.&nbsp;Монтаж электрооборудования обязательно должен производится только специалистами во избежание возможных внештатных ситуаций. С помощью технологий промышленного альпинизма можно слить воедино реализацию идей декора и электромонтажа, привлекая внимание потенциальных покупателей.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>Наружная реклама</strong></span> очень разнообразна. Кроме ознакомления потребителей с рекламируемым товаром, работой или услугой (коммерческая реклама), она является и информационным средством, побуждающим к тому или иному действию (указатели, вывески). Определенные виды рекламных конструкций наполняют город светом, делая его, несомненно, более привлекательным. Месторасположение наружной рекламы выбирается с таким расчетом, чтобы проходящие по улице пешеходы или проезжающие в машинах автомобилисты могли выделять ее среди прочего многообразия городских объектов.</p>\r\n<p style="text-align: justify;">Организация <span style="color: #198cc2;"><strong>рекламы внутри помещений</strong></span> с привлечением специалистов промышленного альпинизма связана, прежде всего, с обустройством выставочных павильонов компаний, участвующих в различных экспозициях и выставках. Промышленные альпинисты смогут украсить любые помещения со свободным подпотолочным пространствам. Прежде всего, это относится к украшению торговых центров (например, в период распродаж) или офисных помещений (украшение елок в новогодние праздники).</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '7d81503d659819f2454e028fe8de8b47.jpg', 'f9455000f7d6a22d2f27070428719582.jpg', NULL, 'light', '<p><strong>&nbsp;&nbsp; МОНТАЖ РЕКЛАМЫ (ОБЫЧНАЯ и СВЕТОВАЯ)</strong></p>\r\n<table style="width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr style="background-color: #cccccc; height: 40px;">\r\n<td class="xl75" style="text-align: center;" width="775" height="40"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td class="xl76" style="text-align: center;" width="89"><strong>Ед. изм.</strong></td>\r\n<td class="xl77" style="text-align: center;" width="89"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl71" width="775" height="40"><strong>Монтаж баннера шнуровкой</strong><br />Баннер крепится шнуровкой через люверсы к раме</td>\r\n<td class="xl65" style="text-align: center;">шт.</td>\r\n<td class="xl66" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" width="775" height="40"><strong>Резьбовое натяжение</strong><br />В карманы баннера вставляются металлические прутья, которые при помощи резьбового соединения притягиваются к раме</td>\r\n<td class="xl67" style="text-align: center;">шт.</td>\r\n<td class="xl68" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Пристреливание баннера</strong><br />Баннер крепится на саморезы или пристреливается строительным степлером</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 300<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" width="775" height="40"><strong></strong> Монтаж рамы из металлического профиля</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 120<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Демонтаж баннера</strong><br />Стоимость демонтажа баннера составляет от 30 до 70% от стоимости монтажа</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">договорная<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Ремонт баннера</strong><br />Поможем закрепить оторвавшийся баннер, сшить разрывы полотна</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Мойка баннера</strong><br />Мойка баннеров от атмосферных загрязнений аппаратом высокого давления и вручную</td>\r\n<td class="xl67" style="text-align: center;">м. кв.<br /></td>\r\n<td class="xl68" style="text-align: center;">от 55<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Монтаж вывески</strong><br />Конструкция вывески поднимается и крепится к фасаду</td>\r\n<td class="xl67" style="text-align: center;">м. кв.<br /></td>\r\n<td class="xl68" style="text-align: center;">от 1 400<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Монтаж светового короба</strong><br />Подъем светового короба, монтаж на фасаде дома, подключение к электричеству</td>\r\n<td class="xl67" style="text-align: center;">м. кв.<br /></td>\r\n<td class="xl68" style="text-align: center;">от 1 700<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Монтаж объемных букв</strong><br />Буквы поднимаются и крепятся к фасаду здания, подключается электричество</td>\r\n<td class="xl67" style="text-align: center;">шт.<br /></td>\r\n<td class="xl68" style="text-align: center;">от 740<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Монтаж неона</strong><br />Крепеж неона и подключение трансформаторов</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 550</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Крепеж дюралайта на хомуты или стяжки, крепеж световых и неоновых шнуров, гирлянд</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 170</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40">Укладка кабеля в гофру или короб, закрепление на стене</td>\r\n<td class="xl67" style="text-align: center;">м. п.</td>\r\n<td class="xl68" style="text-align: center;">от 120</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Ремонт рекламы</strong><br />Замена ламп, панелей, баннеров, ремонт проводки</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Демонтаж наружной рекламы</strong><br />Стоимость демонтажа наружной рекламы составляет 30-50% от стоимости первоначального монтажа</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl73" height="40"><strong>Мойка наружной рекламы</strong><br />Мойка объектов наружной рекламы от атмосферных загрязнений аппаратом высокого давления и вручную</td>\r\n<td class="xl67" style="text-align: center;">м. кв.</td>\r\n<td class="xl68" style="text-align: center;">от 55</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 6 000 руб.</strong></p>');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `back_left`, `back_center`, `alias`, `for_price`) VALUES
(8, 'Очистка от снега', 2, 58, 59, '2012-05-14 13:19:28', 1, 0, '<p style="text-align: justify;">В зимний период важной задачей благоустройства города становится <strong>очистка кровли от снега и наледи.</strong> Скопившийся на крыше <span style="color: #000000;"><strong><em>снег</em></strong></span> и <span style="color: #000000;"><strong><em>сосульки</em></strong></span> могут представялять угрозу для пешеходов и автовладельцев. Стихийный сход снега способен причинить ущерб припаркованным автомобилям, намерзшие на карнизах сосульки, падая, достаточно часто становятся причиной травм людей. В период оттепели образовавшаяся на краю крыши <span style="color: #000000;"><strong><em>наледь</em></strong></span> может привести к деформации покрытия кровли, возможно образование протечек. Кроме этого, до начала периода снегопада необходимо также позаботиться о защите системы водостока. Во время перепадов температур стекающая по желобам вода замерзает внутри трубы, что может привести к ее разрыву. С этой целью перед началом снегопада на верхушки желобов надеваются специальные крышки.</p>\r\n<p style="text-align: justify;">Во избежание несчастных случаев необходимо регулярно очищать крыши от снега и наледи. Технологии промышленного альпинизма позволяют в кратчайшие сроки решить эту проблему. Очистка кровли может проводиться как на всей площади крыши, так и по ее периметру на расстоянии 1,5 метров от края. Если необходимо сбить образовавшиеся сосульки, то и эту проблему решат промышленные альпинисты.</p>\r\n<p style="text-align: justify;">Работы по очистке крыши от снега и наледи могут производиться <span style="text-decoration: underline;">двумя способами</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Разовый выезд</strong></span> производится по желанию заказчика при однократном крупном снегопаде. Очистка крыши должна быть произведена за один день.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Договор на абонентское обслуживание</strong></span> в зимний период предполагает, что очистка кровли будет производиться специалистами промышленного альпинизма регулярно, выезд бригады осуществляется каждый раз при выпадении снега.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '5a08337fced94aa5e030ec289f8aaa32.jpg', 'a54f8872528b4605201cb31d9fdb8567.jpg', NULL, 'shnow', '<p><strong>&nbsp;&nbsp; РАЗОВОЕ ОБСЛУЖИВАНИЕ КРОВЛИ<br /></strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Очистка кровли от снега и льда на расстоянии 1,5 метра от края кровли и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">погонный метр периметра здания</td>\r\n<td class="xl70" style="text-align: center;">от 35<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Полная очистка всей площади кровли от снега и льда и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">квадратный метр площади кровли</td>\r\n<td class="xl70" style="text-align: center;">от 27<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Минимальный заказ (до 200 метров)</td>\r\n<td class="xl73" style="text-align: center;">1 выезд<br /></td>\r\n<td class="xl74" style="text-align: center;">7 000<br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;&nbsp; &laquo;КОМПЛЕКС 1&raquo; (не менее 3-х выездов в месяц)</strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Очистка кровли от снега и льда  на расстоянии 1,5 метра от края кровли и удаление сосулек и наледи с  карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">погонный метр периметра здания</td>\r\n<td class="xl70" style="text-align: center;">от 35<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Полная очистка всей площади кровли от снега и льда и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">квадратный метр площади кровли</td>\r\n<td class="xl70" style="text-align: center;">от 24<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Минимальный заказ (до 200 метров)</td>\r\n<td class="xl73" style="text-align: center;">1 выезд<br /></td>\r\n<td class="xl74" style="text-align: center;">7 000<br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp; &laquo;КОМПЛЕКС 2&raquo; (полное обслуживание)</strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Очистка кровли от снега и льда   на расстоянии 1,5 метра от края кровли и удаление сосулек и наледи с   карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">погонный метр периметра здания</td>\r\n<td class="xl70" style="text-align: center;">от 250<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Полная очистка всей площади кровли от снега и льда и удаление сосулек и наледи с карниза кровли по периметру здания</td>\r\n<td class="xl69" style="text-align: center;">квадратный метр площади кровли</td>\r\n<td class="xl70" style="text-align: center;">от 160<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Минимальный заказ (до 200 метров)</td>\r\n<td class="xl73" style="text-align: center;">месяц<br /></td>\r\n<td class="xl74" style="text-align: center;">40 000<br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp; ДРУГИЕ РАБОТЫ</strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Очистка труднодоступных участков кровли с применением альпинистского снаряжения</td>\r\n<td class="xl69" style="text-align: center;">п. м.<br /></td>\r\n<td class="xl70" style="text-align: center;">от 64<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Очистка карнизов, фальш-карнизов и балконов от сосулек, снега и наледи</td>\r\n<td class="xl69" style="text-align: center;">спуск</td>\r\n<td class="xl70" style="text-align: center;">от 600<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Очистка воронок ото льда</td>\r\n<td class="xl73" style="text-align: center;">шт.</td>\r\n<td class="xl74" style="text-align: center;">от 400</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Очистка водосточной трубы ото льда <br /></td>\r\n<td class="xl73" style="text-align: center;">м. п.</td>\r\n<td class="xl74" style="text-align: center;">от 40</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Удаление сосулек и наледи с карниза кровли здания на расстоянии 0,5 м от края кровли</td>\r\n<td class="xl73" style="text-align: center;">м. п.</td>\r\n<td class="xl74" style="text-align: center;">от 24</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Уборка территории от сброшенного снега и льда</td>\r\n<td class="xl73" style="text-align: center;">м. кв.</td>\r\n<td class="xl74" style="text-align: center;">от 18</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Погрузка сброшенного снега и льда в контейнер с последующим вывозом</td>\r\n<td class="xl73" style="text-align: center;">контейнер</td>\r\n<td class="xl74" style="text-align: center;">договорная</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;- цены указаны без учета стоимости материалов;<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ, архитектуры здания;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>\r\n<p><span style="text-decoration: underline;"><br />На окончательную   стоимость работ влияют следующие факторы:</span></p>\r\n<ul>\r\n<li>удаленность объекта от МКАД;</li>\r\n<li>отсутствие ограждений на кровле;</li>\r\n<li>необходимость уборки и вывоза снега с территории;</li>\r\n<li>наличие большого потока людей на территории;</li>\r\n<li>время производства работ: день или ночь;</li>\r\n<li>количество снега и льда на кровле здания;</li>\r\n<li>сложная архитектура здания;</li>\r\n<li>большая этажность здания (более 7 этажей);</li>\r\n<li>материал кровли здания;</li>\r\n<li>крутизна кровли (угол наклона).</li>\r\n</ul>'),
(9, 'Монтаж наружной рекламы', 3, 49, 50, '2012-03-26 14:32:35', 1, 0, '<p style="text-align: justify;"><strong>Монтаж наружной рекламы</strong> включает в себя огромное количество работ, зависящих от <span style="text-decoration: underline;">видов рекламы</span>. Чтобы грамотно провести монтаж объектов рекламы, необходимо учитывать множество факторов: близость от линий электропередач, состояние фасада здания, наличие на стене кондиционеров, спутниковых антенн, систем видеонаблюдения и т.д. Кроме этого специалисты, занимающиеся монтажом, должны иметь навыки работы с электричеством, так как наружная реклама очень часто бывает подсвечена.</p>\r\n<p style="text-align: justify;">Помимо непосредственно установки рекламных элементов на улицах города, они также нуждаются в периодическом обслуживании. Отдельным рекламным объектам может требоваться ремонт (подтягивание шнуров, укрепление шурупов, замена лампочек). Для реализации этих задач привлекаются промышленные альпинисты, способные выполнить весь спектр необходимых работ.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Установка баннеров</strong></span> &ndash; один из самых распространенных способов привлечения внимания. Баннер, изготовленный из специальной ткани или сетки, может крепиться разными способами. Монтаж баннера на люверсы производится с помощью шнуров к заранее закрепленной на стене раме. Если рекламное полотно обновляется нечасто, то возможен монтаж баннера непосредственно на раму. Для разового монтажа наружной рекламы можно осуществить безрамное крепление на дюбель-гвозди. Вставленные в стену, они последовательно огибаются шнуром и, проходя через люверсы полотна, образуют &laquo;змейку&raquo;.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Рекламные перетяжки</strong></span> представляют собой полотно из хлопчатобумажной ткани с нанесенной поверх информацией путем трафаретной печати. Рекламные растяжки крепят к уличным столбам, либо к зданиям при помощи сверхпрочных тросов. Благодаря большому размеру, реклама на перетяжках привлекает внимание издалека: ее легко рассмотреть как пешеходам, так и водителям.</p>\r\n<p style="text-align: justify;"><strong><span style="color: #198cc2;">3. Монтаж плакатов (билборды).</span></strong> Реклама на бумажной основе с помощью клея крепится на магистральные щиты. Размещение билбордов в городе или по обочинам автомагистралей позволяет не только привлечь внимание новых клиентов, но и повысить узнаваемость бренда. Рекламные щиты 3х6 могут быть одно- или двусторонними, статичными и динамичными, в которых изображения меняются по заданной программе.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Монтаж вывесок</strong></span> различных типов также осуществляется при помощи технологий промышленного альпинизма. <span style="color: #000000;"><strong><em>Вывески без подсветки</em></strong></span> &ndash; наиболее экономичный способ рекламы. <span style="color: #000000;"><strong><em>Световые короба</em></strong></span> позволяют привлечь внимание как в темное, так и в светлое время суток. <span style="color: #000000;"><strong><em>Панель-кронштейны</em></strong></span> размещаются на фасаде с сильным вынесением от стены. Информация содержится на обеих сторонах рекламной конструкции, которая монтируется на металлическую раму, привинчиваемую к фасаду здания. <span style="color: #000000;"><strong><em>Объемные буквы</em></strong></span> с подсветкой или без могут крепиться либо вплотную к фасаду, либо устанавливаться на подложку, которая в свою очередь монтируется на стену.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Крышные установки</strong></span> привлекательны тем, что заметны издалека. Они могут быть любой формы и размера и располагаться на крыше любого здания. В сочетании с внутренней подсветкой, крышные установки создают наиболее объемный и узнаваемый образ рекламируемого бренда.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'bd73ce64a953b7bce40fdc5cd126ed0f.jpg', NULL, NULL, NULL, ''),
(10, 'Кондиционеры', 2, 60, 61, '2012-05-14 13:04:39', 1, 0, '<p style="text-align: justify;">В современном мире люди стремятся к комфорту проживания &ndash; летом нам нужна прохлада, зимой мы хотим побыстрее согреться, придя с мороза. Установка кондиционера решает одновременно обе эти задачи. Оптимальная температура бывает жизненно необходима не только людям, но и машинам. В этом случае речь идет уже об организации целой системы вентиляции воздуха (например, обустройство вентиляции в цехе или складском помещении).</p>\r\n<p style="text-align: justify;"><strong>Монтаж наружных блоков кондиционеров </strong>представляет собой комплексную, очень сложную в техническом смысле задачу. При установке самого блока требуется для начала смонтировать систему креплений. Для этого в стене с наружной стороны здания специалисты промышленного альпинизма с веревок высверливают специальными бурами отверстия под шурупы. Держащиеся на шурупах кронштейны должны быть сбалансированы, чтобы не происходило перевеса, и укрепленный на них блок кондиционера надежно держался. Над блоком очень часто устанавливают специальные козырьки, которые защищают его от падения сосулек и снега при чистке крыши. Также пластмассовым коробом могут быть дополнительно закрыты все наружные коммуникации, ведущие к внутреннему блоку кондиционера.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '5cb7bd95a99d0bee1585099006e85a31.jpg', '909532d451fe09c5d4278414f0eeedf8.jpg', NULL, 'condition', '<p><strong>&nbsp;&nbsp; МОНТАЖ КОНДИЦИОНЕРОВ<br /></strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Монтаж кондиционера 7-9 БТЕ(2.5-3.5 КВт)</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">6 700<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Монтаж кондиционера 12-18 БТЕ (5.0-7.0 КВт)</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">7 700<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Монтаж наружного блока кондиционера</td>\r\n<td class="xl73" style="text-align: center;">шт.</td>\r\n<td class="xl74" style="text-align: center;">3 300</td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40"><strong>Демонтаж кондиционера</strong><br />Стоимость демонтажа кондиционера составляет 70% от стоимости монтажа</td>\r\n<td class="xl73" style="text-align: center;">шт.</td>\r\n<td class="xl74" style="text-align: center;">договорная</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- указанна стоимость стандартного монтажа кондиционера (длинна трассы не более 5 метров);<br />&nbsp;- точная стоимость определяется после осмотра объекта и зависит от объема и сложности работ;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>'),
(11, 'Спил деревьев', 2, 62, 63, '2012-03-26 14:26:51', 1, 0, '<p style="text-align: justify;">Деревья окружают нас, обеспечивая человеку возможность дышать. Но как бы ни были важны деревья, они могут болеть, стареть, становиться помехой, а иногда даже создавать угрозу для строений, автомобилей и самого человека. В таких ситуациях приходиться задумываться о том, чтобы убрать ненужные насаждения или кронировать их.<strong> Спил деревьев</strong> может проводиться как в декоративных, так и в практических целях. Работа по удалению деревьев требует от арбориста внимательности и аккуратности, так как часто она выполняется в условиях ограниченного пространства (вблизи линий электропередач, рядом с домами, на заполненной территории).</p>\r\n<p style="text-align: justify;"><em>Необходимо помнить, что любые работы с деревьями (обрезка, кронирование, удаление) требуют предварительного оформления порубочного билета.</em></p>\r\n<p style="text-align: justify;">Существует <span style="text-decoration: underline;">несколько методов</span> проведения обрезки деревьев.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Удаление дерева целиком</strong></span> возможно в том случае, если существует вероятность безопасного его падения на всю длину. Удаление с определением направления падения производится с помощью организации системы оттяжки, с помощью которой создается определенная траектория падения. Валка дерева целиком на веревочные перила осуществляется тогда, когда необходимо предотвратить падение дерева непосредственно на землю (например, если на территории вокруг организован сложный ландшафтный дизайн).</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Удаление дерева по частям</strong></span> может быть осуществлено двумя способами. Если вокруг дерева достаточно свободного пространства, то обрубленные куски сбрасываются прямо на землю. Для предотвращения повреждения грунта место сброса предварительно закрывается настилом из досок или покрывается слоем песка. Альтернативно может быть произведено завешивание отпиленных частей, каждая из которых аккуратно спускается вниз с помощью веревок.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Кронирование деревьев</strong></span> представляет собой процесс обрезки веток с соблюдением определенных правил. С помощью кронирования дереву может быть придана определенная форма, задано направление будущего роста ветвей. Санитарная обрезка осуществляется для предотвращения распространения заболевания на здоровые ветви. Также удаление ветвей необходимо, если велика вероятность нанесения ущерба (например, надлом и падение веток после обильного снегопада или урагана).</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '7f31ee335f924bdf91bb2529397138f0.jpg', 'd84716d7dedc1a45299620748552efb7.jpg', NULL, 'wood', '<p><strong>&nbsp;&nbsp; УДАЛЕНИЕ ДЕРЕВЬЕВ<br /></strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48"><strong>Удаление дерева целиком с использованием естественного наклона</strong><br />Все работы ведутся на земле; у дерева выпиливается клин со стороны падения, затем дерево подпиливается и валится в нужную сторону</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">от 950<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48"><strong>Удаление дерева целиком с использованием оттяжки</strong><br />На дереве закрепляется оттяжка, делается клин со стороны падения, и дерево с помощью оттяжки укладывается в нужную сторону</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">от 1 550</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48"><strong>Удаление дерева по частям с возможностью сбрасывания частей вниз</strong><br />Под деревом должна быть небольшая свободная площадка; дерево разбирается по частям и его удаленные фрагменты сбрасываются вниз</td>\r\n<td class="xl69" style="text-align: center;">шт. <br /></td>\r\n<td class="xl70" style="text-align: center;">от 3 600<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40"><strong>Удаление дерева по частям со спуском фрагментов через соседние деревья либо через удаляемое</strong><br />Дерево пилиться по частям, каждый фрагмент закрепляется веревкой и аккуратно спускается вниз</td>\r\n<td class="xl73" style="text-align: center;">шт. <br /></td>\r\n<td class="xl74" style="text-align: center;">от 4 100<br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;&nbsp; РАСПИЛ ДЕРЕВА<br /> </strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48"><strong>&nbsp;</strong>Распиловка дерева на части необоходимой Заказчику длинны входит в стоимость работ по удалению</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">от 700<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48"><strong>Уборка территории</strong><br />Транспортировка до 100 м вручную и складирование частей дерева после удаления</td>\r\n<td class="xl69" style="text-align: center;">за 1 дерево<br /></td>\r\n<td class="xl70" style="text-align: center;">от 700<br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;- в стоимость входит распиловка на части длиной до 1 м;<br />&nbsp;- в случае наличия вблизи дерева (под кроной) проводов, крыши, или в случае, когда дерево сильно наклонено&nbsp; над строениями цена может увеличиться на 20-50%;<br />&nbsp;- окончательная стоимость работ оговаривается во время осмотра объекта специалистом;<br />&nbsp;- выезд специалиста бесплатный (Москва, МО);<br /><strong>&nbsp;- минимальная стоимость заказа 7 000 руб.</strong></p>\r\n<p><strong><br />&nbsp;&nbsp; ОБРЕЗКА И КРОНИРОВАНИЕ<br /> </strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48"><strong>Санитарная обрезка веток</strong><br />Обрезаемые ветви сбрасываются вниз на площадку под деревом</td>\r\n<td class="xl69" style="text-align: center;">за 1 дерево<br /></td>\r\n<td class="xl70" style="text-align: center;">от 950<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48"><strong>Санитарная обрезка со спуском веток</strong><br />Каждая спиливаемая ветвь аккуратно спускается вниз на веревках</td>\r\n<td class="xl69" style="text-align: center;">за 1 дерево</td>\r\n<td class="xl70" style="text-align: center;">от 1 550</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48"><strong>&nbsp;</strong>Укрепление наклоненных деревьев троссами и растяжками</td>\r\n<td class="xl69" style="text-align: center;">за 1 дерево<br /></td>\r\n<td class="xl70" style="text-align: center;">от 3 000<br /></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">&nbsp;Декоративная, омолаживающая обрезка</td>\r\n<td class="xl69" style="text-align: center;">за 1 дерево</td>\r\n<td class="xl70" style="text-align: center;">от 950</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>Оформление порубочного билета</strong><br />Цена зависит от категории дерева - является ли оно аварийным, находится ли в опасной близости от зданий, и т.д.</p>'),
(12, 'Частным заказчикам', 2, 64, 71, '2012-03-26 14:26:51', 1, 0, '<p style="text-align: justify;">Услуги промышленного альпинизма могут потребоваться не только организациям, но и <strong>частным заказчикам</strong>. Когда использование обычных методов реализации задуманного затруднительно из-за высоты или труднодоступности объекта, технологии промышленного альпинизма могут стать единственным способом для реализации плана.</p>\r\n<p style="text-align: justify;">Кроме решения бытовых вопросов, мы с радостью окажем Вам услуги по доставке подарков Вашим близким самым необычным способом &ndash; через окно. Промышленные альпинисты поздравят Ваших любимых, передадут им от Вас самые теплые пожелания и вручат заранее приготовленный Вами сюрприз. Хотя само по себе <span style="color: #198cc2;"><strong>поздравление в окно</strong></span> &ndash; уже неожиданный и запоминающийся подарок. Удивите Ваших родных и близких!</p>\r\n<p style="text-align: justify;">К каждому нашему заказчику мы применяем индивидуальный подход. Выполнение заказов производится в удобное для заказчика время, оптимальные сроки, по разумным ценам и с учетом всех пожеланий клиента.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '13beb6544f6d0caf57e2205653d951dd.jpg', 'b3aae4bc72e9b7ef9d006c181eced4b6.jpg', NULL, 'private', '<p><strong>&nbsp;&nbsp; ОБЩАЯ ИНФОРМАЦИЯ<br /></strong></p>\r\n<table style="height: 176px; width: 800px; border: 1px solid #000000;" border="1" cellspacing="0" cellpadding="5">\r\n<colgroup><col width="775"></col> <col span="2" width="89"></col> </colgroup> \r\n<tbody>\r\n<tr height="40">\r\n<td style="background-color: #cccccc; text-align: center;"><strong>НАИМЕНОВАНИЕ   РАБОТ</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Ед. изм.</strong></td>\r\n<td style="background-color: #cccccc; text-align: center;"><strong>Цена, руб.</strong></td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl68" width="775" height="48">Ремонт балконов</td>\r\n<td class="xl69" style="text-align: center;">м.кв.&nbsp;</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Утепление квартир</td>\r\n<td class="xl69" style="text-align: center;">м.кв. <br /></td>\r\n<td class="xl70" style="text-align: center;">от 1 100</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Установка антенн</td>\r\n<td class="xl69" style="text-align: center;">шт.</td>\r\n<td class="xl70" style="text-align: center;">договорная</td>\r\n</tr>\r\n<tr height="48">\r\n<td class="xl71" height="48">Доставка цветов в окно (стоимость подарка не входит в стоимость услуги)<br /></td>\r\n<td class="xl69" style="text-align: center;"><br /></td>\r\n<td class="xl70" style="text-align: center;">от 4 000<br /></td>\r\n</tr>\r\n<tr height="40">\r\n<td class="xl72" height="40">Дод Мороз в окно</td>\r\n<td class="xl73" style="text-align: center;">&nbsp;</td>\r\n<td class="xl74" style="text-align: center;">от 10 000</td>\r\n</tr>\r\n</tbody>\r\n</table>');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `back_left`, `back_center`, `alias`, `for_price`) VALUES
(13, 'Мойка окон', 3, 3, 4, '2012-07-13 11:20:25', 1, 0, '<p style="text-align: justify;">Чистые окна и витрины &ndash; это лицо здания, поэтому <strong>стекломой</strong> &ndash; один из самых популярных видов работ на сегодняшний день в сфере промышленного альпинизма.<br />Мойка окон подразумевает не только мытье стекол, но и мытье откосов, подоконников и самих оконных рам с применением специальных очищающих и моющих средств, не оставляющих разводов, а также предотвращающих запыление и загрязнение уже чистой поверхности на длительный срок.<br />Технологии промышленного альпинизма широко применяются также при мойке зданий с панорамным остеклением, например торгово-развлекательных комплексов, облицованных помещений складов, стеклянных крыш переходов, витражей и зеркальных куполов и многих других объектов недвижимости.</p>\r\n<p style="text-align: justify;">Мойка остекленных поверхностей может быть осуществлена <span style="text-decoration: underline;">тремя способами</span>.</p>\r\n<div>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ручная мойка</strong></span> предполагает использование моющего средства, скребка, шубки и сгона (склиза). Данный вид мытья применяется при небольшой площади работ и невысокой степени загрязнения.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Автоматизированная мойка</strong></span> производится с помощью мобильного аппарата высокого давления (АВД) при работе с большими объемами остекленных поверхностей. В аппарате струя воды подается из шланга под давлением, что позволяет очистить стеклянную поверхность легко и быстро не только от грязи и пыли, но также и от остатков скотча, краски, клея и т.д.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Мойка окон с помощью автовышки</strong></span> проводится в том случае, когда стандартная мойка не доступна с земли, или у альпинистов нет возможности добраться до очищаемой поверхности сверху (например, при мойке поверхностей с углом наклона в сторону фасада здания). Аренда автовышки позволяет ускорить ход работ за счет быстроты ее установки и перемещения и, безусловно, создает более безопасные условия труда для мойщиков, находящихся в люльке.</p>\r\n</div>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,  руководствуясь наработанным опытом, подберут для Вас оптимальное  решение по применяемым технологиям, согласуют график работ, обсудят  детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em></em><strong><em> - </em></strong><span style="font-size: medium;"><strong>бесплатно!</strong></span><strong><em>&nbsp;</em></strong><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'e15153f73f81181d1b013bdbcd25654d.jpg', NULL, NULL, NULL, ''),
(14, 'Мойка фасадов', 3, 5, 6, '2012-01-11 00:14:04', 1, 0, '<p style="text-align: justify;">В крупном городе воздух всегда загрязнен пылью, копотью, выхлопами, которые оседают на стенах домов. Кроме этого со временем на фасадах появляются высолы, ускоряющие разрушение здания.<br /><strong>Мойка фасада</strong> - одна из наиболее распространенных услуг, оказываемых промышленными альпинистами. Фасад &ndash; это лицо здания, поэтому его внешнему виду следует уделять особое внимание. Мойка здания обязательно выполняется перед ремонтными работами на фасаде. При помощи технологий промальпа можно очистить стены здания даже в труднодоступных местах.</p>\r\n<p style="text-align: justify;">Мойка фасадов производится <span style="text-decoration: underline;">следующими способами</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Химическая ручная мойка</strong></span> применяется, прежде всего, для устранения высолов. Чтобы через небольшой промежуток времени соли не выступили вновь и мойку фасада не пришлось повторять, рекомендуется провести гидрофобизацию здания. Стены, обработанные специальным составом, будут устойчивы к проникновению влаги и способны отторгать грязь.<span style="color: #198cc2;">&nbsp;</span></p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Автоматизированная мойка </strong></span>с использованием аппарата высокого давления (АВД) в короткие сроки избавит поверхность здания от въевшейся грязи, копоти, городского смога. Особенно это актуально для зданий и сооружений, находящихся вблизи оживленных дорог. Автоматизированная мойка незаменима в случае, если фасад необходимо подготовить к дальнейшей покраске. Подаваемая под большим давлением вода зачистит стены от плохо держащейся штукатурки или полностью удалит ее. С помощью автомойки производится также разделка и зачистка межплитных швов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Мойка фасадов с применением автовышки </strong></span>производится в том случае, если выполнить работу только силами промышленных альпинистов не представляется возможным, например, на фасадах со сложной архитектурой (козырьки, колонны, крышные надстройки, лепнина).</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,   руководствуясь наработанным опытом, подберут для Вас оптимальное   решение по применяемым технологиям, согласуют график работ, обсудят   детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'ab0fa9d47bd31829108a34f6800b5c81.jpg', NULL, NULL, NULL, ''),
(15, 'Очистка фасада', 3, 9, 10, '2012-01-11 00:16:56', 1, 0, '<p style="text-align: justify;"><strong>Очистка фасада</strong> &ndash; это та необходимая услуга, которая позволит поддержать привлекательность здания и одновременно поможет отодвинуть время проведения его ремонта. Говоря об очистке фасада, важно понимать, что она представляет собой целый комплекс отдельно взятых работ по приведению внешнего вида здания в надлежащее состояние.</p>\r\n<p style="text-align: justify;">В перечень фасадных работ по очистке <span style="text-decoration: underline;">входят следующие работы</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Пескоструйная чистка</strong></span> основана на обработке различных поверхностей абразивными материалами, подаваемыми из сопла под давлением воздушного потока. Преимущество пескоструйного аппарата в том, что он эффективно и быстро удаляет любые виды загрязнений и покрытий (например, лакокрасочные материалы, окалину, ржавчину) с любого типа поверхностей (кирпичная стена, металлоконструкции, бетон и проч.). Недостаток этой технологии заключается в том, что ее применение невозможно на исторических зданиях, работы с которыми приравниваются к реставрационным.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Удаление грибкового налета, плесени</strong></span> представляет собой лечение и защиту поверхности фасада от заражения спорами. Подобные меры позволяют сохранить прочность стен и в дальнейшем предотвратить их разрушение.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Удаление графитти</strong></span> подразумевает нанесение специального состава на испачканную поверхность, который способен провести глубокую очистку даже сильно пористых материалов. Дополнительная химическая антивандальная обработка стен в дальнейшем не позволит краске закрепиться на обработанной поверхности и поможет предотвратить проникновение красителя в структуру фасада.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Удаление высолов</strong></span> одна из наиболее востребованных услуг в сфере промышленного альпинизма. Размытые белесые пятна выступающей соли на поверхности фасада не только портят его внешний вид, но и могут стать причиной разрушения части конструкции здания. Удаление кристаллизованных солевых пятен производится жесткими металлическими щетками с применением определенных химических средств. Для предотвращения их повторного появления желательно проводить гидрофобизацию фасада.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Гидрофобизация</strong></span> &ndash; это обработка поверхности специальными составами, благодаря которым ей придаются водоотталкивающие свойства. Такая обработка способствует увеличению прочности стен, уменьшению оседания пыли и грязи, появлению эффекта самоочищения, так как осевшая грязь легко смывается дождевой водой.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,     руководствуясь наработанным опытом, подберут для Вас оптимальное     решение по применяемым технологиям, согласуют график работ, обсудят     детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '60f56c8ade9d90c4545fcf7c778a08ca.jpg', NULL, NULL, NULL, ''),
(16, 'Ремонт фасада', 3, 11, 12, '2012-01-11 00:17:31', 1, 0, '<p style="text-align: justify;">Любой фасад стареет и разрушается под воздействием многочисленных негативных факторов, со временем на стенах появляются сырые пятна, отшелушивается краска, могут образовываться трещины. Своевременный <strong>ремонт фасада</strong> поможет продлить сроки эксплуатации всего здания в целом, что существенно увеличит долговечность постройки.</p>\r\n<p style="text-align: justify;">Ремонтные работы на фасаде различаются, прежде всего, по <span style="text-decoration: underline;">типам фасадов</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ремонт вентилируемого фасада</strong></span> начинается с демонтажа декоративной плитки, демонтажа утеплителя, регулировки направляющих или замены отдельных частей крепежной системы. Сборка ветфасада производится в обратном порядке &ndash; сначала осуществляется монтаж металлических конструкций фасадной системы, затем на стену крепится утеплитель (если это предусмотрено). По окончании на металлическую основу монтируется декоративная облицовка.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Ремонт &laquo;мокрого&raquo; фасада</strong></span> подразумевает, прежде всего, демонтаж старой штукатурки и краски. Если на стенах имеются трещины, необходимо провести их расшивку и заделку специальным химическим составом на силиконовой основе. Далее происходит оштукатуривание стены (обычное или по сетке). Следующим слоем укладывается шпаклевка, после чего производится зачистка и огрунтовка поверхности. Последним слоем на подготовленный фасад наносится краска (обычно в 2 слоя).</p>\r\n<p style="text-align: justify;">Стоит отметить, что монтажные работы на вентфасадах можно проводить круглый год, тогда как штукатурные и малярные работы на &laquo;мокрых&raquo; фасадах возможно проводить лишь при благоприятных погодных условиях при отсутствии осадков.</p>\r\n<p style="text-align: justify;">Сложность ремонта фасада зависит от степени его изношенности. Выделяют <span style="text-decoration: underline;">два вида ремонта фасада</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Капитальный ремонт фасада</strong></span> проводится в том случае, если разрушения составляют от 30% от общей площади поверхности здания. Такие фасадные работы носят, как правило, длительный характер и делятся на большое количество отдельных этапов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Косметический ремонт фасада</strong></span> заключается, прежде всего, в реставрации фасадного покрытия, покраске, восстановлении рисунка на фасаде здания и т.п.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,      руководствуясь наработанным опытом, подберут для Вас оптимальное      решение по применяемым технологиям, согласуют график работ, обсудят      детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">&nbsp; Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'bc6c7edd073326e3e6f65b2a78b40725.jpg', NULL, NULL, NULL, ''),
(17, 'Обслуживание мостов', 3, 35, 36, '2012-05-14 13:25:05', 1, 0, '<p style="text-align: justify;">Мосты &ndash; неотъемлемая часть любого населенного пункта, от маленькой деревни до огромного мегаполиса. <strong>Обслуживание мостов</strong> требует особого внимания, так как эти сооружения должны быть не только функциональными, но и абсолютно надежными, будь то транспортные путепроводы или торгово-пешеходные строения.<br />Работы, проводимые силами промышленных альпинистов на мостовых конструкциях, можно разбить на <span style="text-decoration: underline;">следующие блоки</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Антикоррозийная защита и покраска мостов</strong></span> начинается с тщательной очистки поверхности металлических частей путем механической зачистки или с помощью пескоструйного аппарата. Далее производится огрунтовка поверхности и ее покраска специальными лакокрасочными эмалями, которые не только способны защитить металлические поверхности от ржавчины, но и будут препятствовать в дальнейшем оседанию грязи и пыли, образованию окалины при взаимодействии с остатками горюче-смазочных материалов. Бетонные части конструкций мостов также нуждаются в обслуживании. Появившиеся швы и трещины заделываются герметиками, отдельно проводится процедура по уплотнению и гидроизоляции бетона с помощью специальных пропиток.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Сварочные работы на мостах</strong></span> надежно соединяют металлоконструкции пролетных строений путепроводов. Они могут быть выполнены с использованием современных технологий ручной, полуавтоматической и автоматической сварки под флюсом.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Остекление мостов</strong></span> позволяет, прежде всего, обеспечить безопасность передвижения пешеходов. Такие мосты обладают морозо- и теплоустойчивостью, высокой пожаробезопасностью, отличными звукоизоляционными свойствами. Последующее обслуживание (мойка, покраска) остекленных поверхностей мостов и пешеходных сходов даст возможность надолго сохранить внешний вид этих сооружений в надлежащем виде и продлит срок их службы.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Экспертиза технического состояния мостов</strong></span> может производиться как на постоянной основе (<strong><em>исследовательский мониторинг</em></strong>), так и внепланово (<strong><em>контрольный мониторинг</em></strong>). При контрольном мониторинге решается задача по предупреждению возникновения аварийных состояний конструктивных элементов и сооружения в целом, в частности проводится экспертиза сварочных швов, обследование болтов в местах соединений металлоконструкций, производится прогнозирование развития возможных дефектов. При регулярном осмотре выявляются места коррозии материала, трещины в бетонных частях мостов, места возможной концентрации напряжений, протечки воды и т.п. При этом производится измерение параметров отмеченных дефектов с замером длины и ширины раскрытия трещин, площади и толщины продуктов коррозии, площади протечек и т.п.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Установка датчиков</strong></span> является несомненным преимуществом при определении различных параметров, влияющих на эксплуатационные характеристики путепроводов. С помощью полученной и своевременно проанализированной информации могут быть предотвращены возможные разрушения. Установленные датчики помогут избежать опасного повышения скорости вибрации, контролировать даже большие трещины, рассчитать подъем и оседание опорных конструкций, измерить уровень деформации бетона или металла. На основе таких данных можно вести последующие проектирования.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,      руководствуясь наработанным опытом, подберут для Вас оптимальное      решение по применяемым технологиям, согласуют график работ, обсудят      детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">&nbsp;Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'faeedbacc878195473c10925014cdd28.jpg', NULL, NULL, NULL, ''),
(18, 'Обслуживание гидросооружений', 3, 37, 38, '2012-05-14 13:27:20', 1, 0, '<p style="text-align: justify;">Судоходный шлюз &mdash; это гидротехническое сооружение, позволяющее обеспечить переход судов между водными пространствами с различной глубиной. Взаимодействие с водой, солевые туманы, промышленные выбросы и атмосферные явления &ndash; все это неблагоприятные факторы, влияющие на долговечность и продуктивность работы шлюзов. Регулярное <strong>обслуживание гидросооружений</strong> такого типа сохранит их от преждевременного выхода из строя и разрушений.</p>\r\n<p style="text-align: justify;">Ремонтные работы на шлюзах начинаются после откачки воды в резервуарах с помощью насосов. По своей сути стенки камеры шлюза &ndash; это тот же фасад, лишь уходящий вниз, а не стремящийся ввысь. А значит, ремонт невозможен без привлечения специалистов, способных выполнять свою работу на высоте. Услуги промышленных альпинистов помогут провести целый <span style="text-decoration: underline;">комплекс мероприятий</span> по выявлению и предотвращению технических неисправностей на гидросооружениях.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Очистка шлюза</strong></span> должна производиться на регулярной основе, так как водоросли иловые отложения способны ускорить процесс разрушения железобетонных шлюзовых камер. Такие работы проводятся с помощью гидроструйных аппаратов высокого давления.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Антикоррозийная защита шлюза</strong></span> начинается с очистки оголенной арматуры от ржавчины механическим способом при помощи шлифовальных машинок и щеток. Поверх наносится слой грунтовки по металлу. После этого производится нанесение на металлические части лакокрасочных покрытий, препятствующих образованию ржавчины. Взаимодействие с водой также вредно и для бетонных частей шлюзовых ворот. При замерзании расширяющаяся вода способна разрыхлить бетонные плиты. На бетонную часть конструкции, в свою очередь, наносится отдельный состав, предотвращающий разрушение шлюзовых камер.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Покраска и штукатурка камер шлюза</strong></span> способствует продлению сроков службы шлюза. Поверхности тщательно очищаются и обезжириваются. Наносимые поверх специальные покрытия устойчивы к истиранию, к агрессивному воздействию воды, а также предотвращают воздействие разбавленных кислот, щелочей и алифатических углеводородов, как, например, бензин, моторное масло и дизельное топливо.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Установка оборудования на шлюз</strong></span> включает в себя демонтаж и монтаж винтовых и закладных гальсбантов с установкой новых конструктивных элементов, замену насосов и запорной арматуры камер шлюзов, ремонт закладных частей и пятовых устройств и проч.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,      руководствуясь наработанным опытом, подберут для Вас оптимальное      решение по применяемым технологиям, согласуют график работ, обсудят      детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">&nbsp; Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'e828dfaa9676c3998568d60858322ed4.jpg', NULL, NULL, NULL, ''),
(19, 'Бытовые работы', 3, 65, 66, '2012-03-26 14:26:51', 1, 0, '<p style="text-align: justify;">Промышленный альпинизм незаменим там, где речь идет об улучшении качества жизни людей, о благоустройстве жилища, о комфорте и удобстве. Многие <strong>бытовые работы</strong> могут быть проведены только с помощью специалистов, работающих на высоте. Потребность в выполнении таких работ может возникнуть в <span style="text-decoration: underline;">разных ситуациях</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Утепление квартир</strong></span> является достаточно частым заказом для промышленных альпинистов. Герметизация межпанельных швов позволит сохранить тепло в доме, снизит затраты на отопление, избавит Вашу квартиру от сырости и промерзания стен. Наружное утепление фасада с использованием теплоизоляционных плит станет дополнительным шагом на пути к сокращению потери тепла, особенно в зимний период.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Установка спутниковых антенн</strong></span> часто сопряжена с необходимостью укрепления самой тарелки в таком месте, куда не добраться без помощи соответствующего специалиста. В том случае, если антенна монтируется непосредственно рядом с окном или балконом квартиры, необходимо произвести надежное крепление оборудования. Если тарелка крепится на крыше, то провода, ведущие от крыши здания непосредственно в квартиру, закрепляются на всей протяженности стены здания жгутами на анкера.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Установка кондиционеров</strong></span> бывает невозможна без привлечения специалистов, способных работать на высоте. Монтаж наружных блоков не должен производиться изнутри, как иногда это происходит, так как это очень опасно.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Устройство крыш на балконе</strong></span> начинается с монтажа металлического каркаса. Затем на собранные металлические фермы монтируется основание кровли, производится ее герметизация, сверху крепится кровельное покрытие. Обшивка наружной стороны балкона может быть дополнительно укреплена и утеплена по желанию заказчика. После этого уже возможна установка окон.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Подъем грузов</strong></span> с привлечением промышленных альпинистов производится в том случае, если доставка до квартиры обычным способом невозможна. Например, в дверные проемы не всегда проходит светозвуковое оборудование, дорогая крупная мебель, ванны для джакузи или большой холодильник. Правильно организованные такелажные работы помогут решить эту проблему.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '0d87c13569cb444f2f7f7237c1484db3.jpg', '95cef8bf2c7373e110e9c5fc418a45da.jpg', NULL, NULL, ''),
(20, 'Цветы в окно', 3, 67, 68, '2012-03-26 14:26:51', 1, 0, '<p style="text-align: justify;"><span style="color: #198cc2;"><strong>8 марта и не только.</strong></span><br />Любая девушка, конечно же, всегда мечтает о романтике, об особенных знаках внимания, о красивых поступках. Обычных цветов, конфет, плюшевых мишек уже недостаточно. А значит, мужчины должны соответствовать - нужно становиться рыцарями, совершать безумные поступки, проявлять чудеса находчивости и изобретательности.</p>\r\n<p style="text-align: justify;">Что же &ndash; мы готовы вам в этом помочь!</p>\r\n<p style="text-align: justify;">Букет в окно &ndash; такой сюрприз удивит даже самую взыскательную красотку! Да-да, букет будет передан из рук в руки! Вы только представьте себе степень ее удивления, когда она получит букет цветов с Вашей визиткой и пожеланиями, ниспосланный ей прямо с неба. Вам в этой ситуации лучше находиться где-нибудь поблизости, ведь растроганная девушка не сможет устоять перед таким проявлением чувств и, скорее всего, упадет к Вам в объятия. <br /> А если пока еще Ваша любимая не знает о Ваших чувствах, то самое время рассказать ей об этом таким нестандартным и оригинальным способом!</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,      руководствуясь наработанным опытом, подберут для Вас оптимальное      решение по применяемым технологиям, согласуют график работ, обсудят      детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '253d042b8655a20af24d35847af22acf.jpg', '66d8ac24b8eb444ac23f383b3c59d015.jpg', NULL, NULL, '');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `back_left`, `back_center`, `alias`, `for_price`) VALUES
(21, 'Новогоднее поздравление от Деда Мороза', 3, 69, 70, '2012-03-26 14:26:51', 1, 0, '<p style="text-align: justify;"><span style="color: #198cc2;"><strong>Новогоднее поздравление от Деда Мороза.</strong></span><br /> Пока мы дети, мы верим в чудеса. Становясь взрослыми, мы с улыбкой&nbsp; вспоминаем те мгновения счастья и радости, которые были нам подарены в детстве.<br /> Как обрадовать своего ребенка, поддержав в нем веру в чудо? Чем можно приятно удивить его, учитывая огромное разнообразие выбора в сфере развлечений?</p>\r\n<p style="text-align: justify;">Новый год делает нас всех немного волшебниками. В это время чудес мы хотим подарить вам и вашим детям маленькую сказку. Пригласите в гости нашего волшебного посыльного от Деда Мороза, чтобы вызвать улыбку на лице Вашего малыша.<br /> Дед Мороз непременно должен перемещаться по воздуху на волшебных санях, запряженных крылатыми оленями, и не заходить в дом через дверь, как папа и мама. И все его помощники тоже. Наш посыльный именно такой &ndash; он появится из ниоткуда за Вашим окном, вручит подарок Вашему малышу, поздравит его от имени Деда Мороза и оставит после себя восторг и удивление всей Вашей семьи.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,        руководствуясь наработанным опытом, подберут для Вас оптимальное        решение по применяемым технологиям, согласуют график работ,  обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'e0c2a95d3145b9f6fd434051010488e3.jpg', 'e57e1f443c82406d36465fd779800c68.jpg', '4ac7dc4c85d0cff1de1123aaf18d42ab.png', NULL, ''),
(22, 'Замена кирпичей', 3, 13, 14, '2012-01-11 00:18:29', 1, 0, '<p style="text-align: justify;"><strong>Замена кирпичей</strong> чаще всего обуславливается усадкой здания после постройки. Усадка здания происходит неравномерно, на наружных стенах здания могут образовываться трещины. Также причиной растрескивания может стать проникающая внутрь вода, которая при замерзании вызывает эрозию кирпича. К сожалению, нередко причиной разрушения кирпичей является некачественный материал. Со временем высыхает и цементная смесь, с помощью которой сцепляется кирпичная кладка. Вероятность падения кирпичей на тротуар или проезжую часть в такой ситуации многократно возрастает.</p>\r\n<p style="text-align: justify;">С помощью технологий промышленного альпинизма можно произвести ремонт несущих стен здания, который осуществляется <span style="text-decoration: underline;">двумя способами</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Восстановление кирпичной кладки</strong></span> выполняется в несколько этапов. С помощью зубила и кувалды поврежденный кирпич вынимается из кладки, в очищенное отверстие вставляется новый кирпич с нанесенным на него раствором. Лишний выступивший раствор удаляется, делается выравнивание шва.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Армирование стены</strong></span> производится в том случае, если демонтаж кирпичной кладки невозможен. Стены укрепляются с помощью стеклосетки и клеевого раствора. После этого на высохшую поверхность наносится штукатурка, грунт и производится покраска стены.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,      руководствуясь наработанным опытом, подберут для Вас оптимальное      решение по применяемым технологиям, согласуют график работ, обсудят      детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'c0b0df0900db4671d00d6f9ade1894b1.jpg', NULL, NULL, NULL, ''),
(23, 'Декоративная отделка фасада', 3, 15, 16, '2012-01-11 00:19:07', 1, 0, '<p style="text-align: justify;"><strong>Декор фасада</strong> &ndash; это отличная возможность оформить здание в оригинальном стиле, сделать его внешне привлекательным и неповторимым.</p>\r\n<p style="text-align: justify;">В зависимости от вида фасада его отделка может быть выполнена <span style="text-decoration: underline;">разными способами</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Облицовка фасада</strong></span> различными материалами выполняется на вентилируемых фасадах. Для нее отлично подойдет технология сайдинга. Это металлические профили сложной формы, включающие в себя сразу и элементы крепления. Облицованный таким способом фасад очень прочен и не горюч. Другой тип металлического покрытия фасада - металлические панели, которые крепятся поверх фасадной системы. Вместо металла могут быть использованы панели из искусственного камня, керамогранита или стекла. Особенно часто такого рода декор используется в облицовке офисных зданий, складских помещений, торговых центров.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Покраска фасада</strong></span> &ndash; один из недорогих и оригинальных способов отделки &laquo;мокрых&raquo; фасадов. Покраска производится специальными фасадными красками, устойчивыми к атмосферным явлениям. В летний период это один из наиболее востребованных типов работ в сфере промышленного альпинизма, так как большое количество школ и детских садов обновляет внешний вид зданий.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Декоративная штукатурка</strong></span> способна воплощать в жизнь любые решения дизайнеров и сделать любое здание поистине уникальным. Одновременно с этим нанесенная на стену она визуально скрывает неровности поверхности.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Лепнина</strong></span> является одним из самых заметных и благородных элементов декора фасада. Однако, лепнина выполненная из гипса, с течением времени изнашивается и разрушается, так как гипс сам по себе очень хрупкий и недолговечный материал. Реставрационные работы по восстановлению лепнины требуют особого тщательного подхода, внимательности и аккуратности.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Декоративные элементы из пенопласта</strong></span> могут быть выполнены в самых разнообразных формах и стилях. Старинные колонны, пилястры, арки или современные отделки балконов, наличники и карнизы &ndash; все это может быть вырезано из пенополистирола. Благодаря своей легкости, изделия из пенопласта легко монтируются. Сверху такие элементы декора покрываются защитным слоем штукатурки и краски, , что позволяет им сохранить долговечность, не уступая в этом отделке из гипса или бетона.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,      руководствуясь наработанным опытом, подберут для Вас оптимальное      решение по применяемым технологиям, согласуют график работ, обсудят      детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '10afe30c5413cba9bed51b8995816986.jpg', NULL, NULL, NULL, ''),
(24, 'Утепление фасада', 3, 17, 18, '2012-01-11 00:19:24', 1, 0, '<p style="text-align: justify;">Кроме непосредственно ремонтных фасадных работ по желанию заказчика также производится <strong>утепление фасада</strong>. Теплоизоляционная система способна защитить строение от разрушений и перепадов температур, что позволит значительно увеличить срок его эксплуатации. Утепление стен современными материалами позволит не только сократить теплопотери и сэкономит средства на обогрев, но и повысит звукоизоляцию здания.</p>\r\n<p style="text-align: justify;">Утепление фасада можно разделить на <span style="text-decoration: underline;">две категории по видам фасадов</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Утепление вентфасада</strong></span> осуществляется по принципу &laquo;сэндвича&raquo;. После установки крепежной фасадной системы на несущую стену наклеиваются плиты утеплителя. Затем вся конструкция закрывается защитным слоем из облицовочного материала. Таким образом создается наружная декоративная стена. Облицовочные панели крепятся к фасадной системе специальными заклепками, кляймерами или видимыми снаружи анкерами. Декоративный экран может быть изготовлен из различных материалов: металлических пластин, керамогранита, облицовочного камня, стекла и т.д.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Утепление &laquo;мокрого&raquo; фасада</strong></span> начинается с подготовки стены к работам. Производится зачистка поверхности фасада, обработка проникающей грунтовкой, предназначенной для предохранения стен от загнивания. Затем на стены наносится специальный клей, на которой крепится термоизолирующая плита из минеральной ваты или пенополистирола с дополнительной фиксацией с помощью анкеров. После высыхания клея утепляющий материал закрывается слоем выравнивающей штукатурки (по сетке или без). Далее штукатурный слой выравнивается, огрунтовывается и покрывается краской.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '2f62b1c1e89400082d2200171dbfb044.jpg', NULL, NULL, NULL, ''),
(25, 'Герметизация швов', 3, 19, 20, '2012-01-11 00:19:48', 1, 0, '<p style="text-align: justify;">В любой бетонной конструкции наличие межпанельных швов обязательно. При осадке здания и при естественном расширении строительного материала при смене температур нужно свободное пространство, чтобы стены не разрушились. Однако, наличие межпанельных швов становится причиной для проникновения в помещение влаги, сырости, ветра, а иногда даже понижения температур до отрицательных значений. <strong>Герметизация межпанельных швов</strong> призвана защитить дом от холодного воздуха. Совместить теплоизоляцию и гибкость помогут эластичные герметики на силиконовой основе.</p>\r\n<p style="text-align: justify;">Существуют <span style="text-decoration: underline;">две основные технологии</span> заделки швов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Открытый шов (первичная герметизация открытых стыков).</strong></span> Этот термин применятся, когда необходимо вскрыть старый шов и провести новую герметизацию. Для этого отслуживший и потрескавшийся герметик удаляют и зачищают полость от старого утеплителя. Затем шов покрывается монтажной пеной, пена служит для заполнения пустот и уплотнения шва. Поверх пены закладывается вилатерм &ndash; специальный утепляющий материал. После этого производится конечная обработка эластичным герметиком, который служит для гидроизоляции межпанельного шва.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Шов закрыт (вторичная герметизация или ремонт шва).</strong></span> При данном виде работы вскрытие шва не предполагается, а производится вторичная промазка трещин. По желанию заказчика в швах могут быть засверлены отверстия, через которые внутренняя полость шва дополнительно утепляется монтажной пеной, после чего накладывается эластичная мастика, как и в случае с первичной герметизацией.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '2aef23b0c913ce991db2647ec03a388c.jpg', NULL, NULL, NULL, ''),
(26, 'Монтаж кровли', 3, 23, 24, '2012-01-11 00:20:20', 1, 0, '<p style="text-align: justify;">Надежность и долговечность крыши, прежде всего, обеспечивает правильно выполненный <strong>монтаж кровли. </strong>Главной частью всей конструкции кровли является стропильная система. Стропила служат опорой для самой кровли и защитой от давления снега и ветра. Стропильную систему конструируют индивидуально под каждый проект, просчитывая все параметры: какой кровельный материал будет использоваться, в каких климатических условия будет эксплуатироваться крыша и т.п. Все внутренние элементы кровли &ndash; паро- и гидроизоляция, акустическая, тепловая и пожарная изоляция &ndash; должны учитывать тип строения, его дизайн, обеспечивать надежную защиту от теплопотерь и образования конденсата, достаточную вентиляцию подкровельного пространства. Герметизация и обустройство водосточной системы также являются необходимыми этапами в работе по монтажу кровли. Завершает монтаж кровли настил предварительно выбранного кровельного покрытия.</p>\r\n<p style="text-align: justify;">Монтаж кровель можно условно разделить по типу кровельных покрытий на <span style="text-decoration: underline;">два больших блока</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Монтаж жесткой кровли</strong></span> представляет собой наборное (штучное, листовое) покрытие крыши. Это оптимальный вариант для создания качественного и долговечного кровельного покрытия, не требующего специального ухода и частого ремонта. К жестким кровлям относятся профнастил, фальцевая кровля, металлочерепица, еврошифер, кровля из оцинкованной стали и т.д. Жесткое кровельное покрытие широко применяется в малоэтажном строительстве домов коттеджного типа, многоэтажных жилых и общественных зданий, а также для производственных сооружений, в том числе для крыш со сложной формой.</p>\r\n<p style="text-align: justify;"><strong><span style="color: #198cc2;">2. Монтаж мягкой кровли</span><em> -</em></strong> это условное название конструкции водоизоляционного ковра, для устройства которого применяются рулонные материалы, полимерные мембраны, различные мастики. Эти варианты кровли идеально подходят для плоских крыш. Здесь кровельный материал раскатывается на предварительно подготовленное основание. Для скатных крыш часто используется гибкая кровельная плитка (мягкая битумная черепица).</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'cd389c646911d8bf9fdbb80169fbb05d.jpg', NULL, NULL, NULL, ''),
(27, 'Ремонт кровли', 3, 25, 26, '2011-12-23 14:42:28', 1, 0, '<p style="text-align: justify;">По прошествии определенного времени любому зданию или сооружению может потребоваться <strong>ремонт кровли</strong>. Преждевременный износ и разрушение кровли могут быть связаны как с естественными причинами (воздействие окружающей среды), так и с повреждениями кровельного покрытия механическим путем (например, во время зимней уборки снега). Кровля также может деформироваться в силу того, что при ее монтаже мог быть допущен брак, или неверными оказались расчеты конструкции кровли, в результате чего она несла нагрузки, превышающие допустимые нормы прочности материала.</p>\r\n<p style="text-align: justify;">В зависимости от силы повреждений может быть произведен различный по типу <span style="text-decoration: underline;">ремонт кровли</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Капитальный ремонт кровли</strong></span> предусматривает демонтаж старого износившегося покрытия и замену его на новое, ремонт и замену стяжки, гидроизоляцию кровли, ее утепление.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Текущий ремонт кровли</strong> </span>(местный или точечный ремонт) предусматривает установку заплат с частичной заменой кровельного материала, окраску и герметизацию поверхности кровли.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Аварийный ремонт кровли</strong></span> производится чаще всего для устранения локальных протечек и подержания кровли в нормальном для эксплуатации состоянии. При ремонте кровли возможна также замена водоприемных воронок, восстановление и замена карнизных свесов и покрытий парапетов.</p>\r\n<p style="text-align: justify;"><span style="color: #000000;"><strong><em>Ремонт жесткой кровли</em></strong></span> очень часто связан не просто с заменой листов или установкой заплаток, но и с частичной заменой материалов кровельного &laquo;пирога&raquo;, так как при деформации внешнего металлического покрытия возможно повреждение внутренних слоев теплоизолятора и нарушение герметизации. Деформация кровли может и не повлечь за собой протечку, однако на кровлях из металла может возникнуть ржавчина. В этом случае производится зачистка листов с их последующей оцинковкой и покраской.</p>\r\n<p style="text-align: justify;"><span style="color: #000000;"><strong><em>Ремонт мягкой кровли</em></strong></span> предусматривает устранение трещин и вздутий, механических повреждений и порывов покрытия, вскрытие пузырей и воздушных мешков, ремонт мест примыканий к элементам конструкций здания при отслоении материала, огрунтовку старого кровельного ковра и укладку новых слоев кровельного материала.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '1d30fa86df1727f6a95446fecaa29e4d.jpg', NULL, NULL, NULL, ''),
(28, 'Герметизация кровли', 3, 27, 28, '2012-01-11 00:23:01', 1, 0, '<p style="text-align: justify;"><strong>Герметизация кровли</strong> является одним из самых важных этапов в процессе ее укладки, особенно в местах соединений кровельного полотна и на стыках кровли с деталями крыши (дымоходом, системой вентиляции, антенной). При эксплуатации крайне важна надежная защита от протеканий, так как кровля постоянно подвергается влиянию атмосферных осадков, ультрафиолетовых лучей, ветра.</p>\r\n<p style="text-align: justify;">Герметизация кровли происходит в несколько этапов в зависимости от вида кровельного покрытия, масштаба разрушения кровли, уровня сложности крыши. Прежде всего, происходит осмотр типов повреждений или мест протечки, затем производится частичный демонтаж кровельного покрытия, зачистка ржавчины, очистка поверхности крыши от остатков краски, грязи, пыли. После на очищенную поверхность наносятся специальные герметики и мастики, возможно также использование фольгированной ленты.</p>\r\n<p style="text-align: justify;"><span style="color: #000000;"><strong><em>Кровельный герметик</em></strong></span> или <span style="color: #000000;"><strong><em>герметизирующая мастика</em></strong></span> широко применяются для уплотнения мягкого кровельного покрытия &ndash; толи, гибкой черепицы и т.д. Такая бесшовная герметизация имеет ряд преимуществ: высокая эластичность, быстрое холодное нанесение, хорошие звукоизоляционные свойства, устойчивость к резким перепадам температур, устойчивость к кислотам и щелочам, возможность работы по влажному основанию, долговечность.</p>\r\n<p style="text-align: justify;">Мы оказываем <span style="text-decoration: underline;">следующие услуги</span> по герметизации кровли.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Герметизация жесткой кровли</strong></span> необходима чаще всего в случаях негерметичного сопряжения отдельных элементов кровли. Гидроизоляция жестких кровельных покрытий требует применения особых материалов - пластичных, не подверженных растрескиванию и выкрашиванию, а также стойких к атмосферным явлениям. Отдельное внимание уделяется тщательной подготовке поверхности кровли под герметизацию, так как важно, чтобы в дальнейшем герметик не отслаивался.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Герметизация мягкой кровли</strong></span> возможна без применения дополнительных герметиков. Технология ремонта заключается в прогреве кровельного ковра до поверхности стяжки термоспекателями (тепловой поток без применения открытого огня), с удалением вздутий, водяных пузырей, трещин, разрывов и т.д. и превращения его в единый монолитный слой.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Наливная кровля</strong></span> &ndash; очень хороший вариант для гидроизоляции плоской кровли. Это покрытие позволяет качественно и на долгий срок обеспечить защиту кровли от проникновения воды. После застывания мастики покрытие выглядит как монолитный, резиновый ковер. Наливная кровля паропроницаема, устойчива к ультрафиолету, агрессивным средам и большим перепадам температур.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'c2d0a07b633f2b38041808b5f407c400.jpg', NULL, NULL, NULL, ''),
(29, 'Безопасность кровли', 3, 29, 30, '2012-01-11 00:27:04', 1, 0, '<p style="text-align: justify;">При эксплуатации кровли необходимость выхода на крышу возникает достаточно часто (для очистки от снега и наледи, установки и обслуживания антенн, чистки дымоходов, водосточной и вентиляционной системы, для выполнения ремонтных работ и т.п.). Поэтому очень важно иметь возможность легко и беспрепятственно перемещаться по всей ее поверхности. Каждый такой выход сопряжен с вероятностью падения людей. <strong>Элементы безопасности кровли </strong>помогут сократить риск при работе на высоте и обеспечат сохранность и длительность эксплуатации кровли.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ограждение кровли</strong></span> является обязательным элементом для любых типов крыш (плоские или скатные). Главное требование &ndash; это прочность и надежность, так как в случае критической ситуации кровельное ограждение должно будет выдержать значительную нагрузку, чтобы предотвратить несчастный случай.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Кровельные лестницы</strong></span> используются для обеспечения доступа к каминным и печным трубам и антеннам. <strong><em>Лестницы на скат</em></strong> позволяют передвигаться вверх и вниз по кровле. <strong><em>Пристенные лестницы</em></strong> предназначены для безопасного подъема на кровлю. В том месте, где пристенная лестница переходит в кровельную, обязательно устанавливаются поручни.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Лестницы на купол</strong></span> представляют собой специальную мобильную систему, которая крепится на опорных округлых рельсах и может перемещаться вдоль всей поверхности купола на прорезиненных катках. Использование такой системы идеально для надземных переходов, атриумов или зданий с площадками панорамного обозрения. Они облегчат выполнение текущих монтажных и ремонтных работ, связанных с остеклением, электрификацией, кондиционированием и т.д.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Переходные мостики</strong></span> значительно упрощают перемещение по скатным крышам. Они могут быть установлены вдоль всей кровли параллельно карнизу. Установка переходных мостиков способна предотвратить деформацию и повреждения кровельного покрытия, что, несомненно, поддержит гидроизоляционные свойства кровли.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Снегозадержатели</strong></span> на кровле нужны для того, чтобы в период таяния снега предотвратить его лавинообразный сход. Они могут быть закреплены на кровле в ряд или в шахматном порядке &ndash; в зависимости от интенсивности выпадения снега в конкретном регионе. Обязательно устанавливать снегозадержатели над пешеходными дорожками, в местах парковки автотранспорта, над крыльцом или козырьком здания, над мансардными окнами.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'e3f351e3f625f2acbf1e974d4f543721.jpg', NULL, NULL, NULL, '');
INSERT INTO `category` (`id`, `title`, `depth`, `lft`, `rgt`, `date_update`, `is_published`, `is_system`, `text`, `icon`, `back_left`, `back_center`, `alias`, `for_price`) VALUES
(30, 'Замена желобов', 3, 31, 32, '2012-01-11 00:32:31', 1, 0, '<p style="text-align: justify;"><strong>Замена желобов</strong> и ремонт водостока может понадобиться как новом доме, так и в давно построенном. Листья и другой мусор попадают в желоба, засоряя воронки и водосточные трубы. Это может нарушить работу всей водосточной системы, если желоба провиснут, и течение воды замедлится, произойдет застой воды. В свою очередь это может вызвать разгерметизацию или даже повреждение желобов. Кроме того опасность представляет зимнее намерзание наледи на кромки водосточных желобов и водостоков, так как это создает дополнительные нагрузки на крепежную систему.</p>\r\n<p style="text-align: justify;">При нарушении целостности водосточной трубы ее элементы подлежат замене. Ремонт желобов может производиться как полностью, так и частично. Тип ремонтных работ зависит от материала, из которого собрана водоотводная система.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Ремонт металлических желобов </strong></span>чаще всего бывает спровоцирован появлением ржавчины. Для удаления небольших пятен используются жесткие проволочные щетки, для защиты от расширения пятен ржавчины используются специальные ингибиторы. После очистки на желоба наносится слой грунтовки и краски. Если речь идет о замене секции водоотводов, то новые металлические отрезки желобов соединяются между собой болтами и гайками, после чего стыки герметизируются с помощью эпоксидных материалов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Ремонт пластиковых желобов </strong></span>производится с помощью специального клея, который надежно спаивает части поврежденной конструкции между собой. Одно из главных преимуществ установки пластиковой системы водостока заключается в ее исключительной долговечности &ndash; такая система не подвержена влиянию температурных перепадов и выдерживает длительное воздействие ультрафиолетовых лучей.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '4d20f5d04f7f90d55e594be821a2ee90.jpg', NULL, NULL, NULL, ''),
(31, 'Монтаж оборудования', 3, 41, 42, '2012-05-14 13:32:27', 1, 0, '<p style="text-align: justify;">Существует огромное разнообразие всевозможных технических устройств, окружающих нас в современном мире. Они не видны нам, но без них мы не смогли бы пользоваться сотовой связью, смотреть телевизор, посещать развлекательные мероприятия. Находятся они зачастую в таких местах, куда без специального снаряжения просто не добраться. <strong>Монтаж оборудования</strong> в таких условиях представляет собой сложную техническую задачу, требующую профессионализма и допуска к выполнению такого рода работ.</p>\r\n<p style="text-align: justify;">Оборудование, которое нуждается в установке, можно условно разбить на <span style="text-decoration: underline;">группы</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Вышки сотовой связи </strong></span>могут быть смонтированы на крышах домов с привлечением автокранов. Отдельные детали будут подняты на кровлю, где в дальнейшем их соединят между собой в единое целое. Если речь идет о сборке башни сотовой связи как отдельно стоящего сооружения, в этом случае к работам может быть привлечена вертолетная техника. Задача высотников заключается в том, чтобы надежно и прочно закрепить все элементы конструкции. Кроме этого, при обслуживании вышек сотовой связи производится их покраска, антикоррозийная обработка, установка дополнительного светоограждающего оборудования.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Телевизионные антенны</strong></span>, устанавливаемые на крыши домов, должны быть закреплены в отдалении от вентиляционных и дымовых труб, так как воздействие загрязненного воздуха будет разрушать материал, из которого изготовлена антенна.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Оборудование для сцен</strong></span> представляет собой отдельные элементы в виде металлических ферм, монтируемых в сценический комплекс. Такого рода конструкции легко собираются и разбираются, могут быть подняты на любую от земли высоту, монтируются и комплектуются в зависимости от желаний заказчика. Элеваторные крыши защитят от погодных явлений как подвесное оборудование самой сцены, так и зрителей, размещенных на мобильных трибунах. Для закрепления акустических систем устанавливаются специальные башни, используемые в качестве несущих конструкций.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Датчики</strong></span> любых типов могут быть установлены на любых видах сооружений с целью контроля за изменениями тех или иных параметров. Если установка датчиков необходима в труднодоступных местах, то для выполнения этих работ разумно разовое привлечение специалистов промышленного альпинизма.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'badc44646b212c759e564cc26ed0ceb9.jpg', NULL, NULL, NULL, ''),
(32, 'Металлоконструкции', 3, 43, 44, '2012-05-14 16:40:29', 1, 0, '<p style="text-align: justify;">Термином &laquo;<strong>металлоконструкции</strong>&raquo; может быть обозначено огромное разнообразие соединенных между собой металлических деталей, связанных в единый объект. В сферу интересов промышленных альпинистов, конечно, попадают те из них, работа с которыми проводится в безопорном пространстве. Железнодорожные и автомобильные мосты, ограждения крыш, пожарные лестницы, решетки балконов и балконный сайдинг, металлические фермы и рамы для зимних садов и мансард, каркасы складских помещений, ангары гаражного типа, помещения автостоянок &ndash; эти и многие другие металлоконструкции нуждаются в обслуживании, выполняемом с применением альпинистских технологий.</p>\r\n<p style="text-align: justify;">Работы, выполняемые на металлоконструкциях, можно разделить на <span style="text-decoration: underline;">следующие типы</span>.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Пескоструйные работы</strong></span> выполняются с помощью абразивных аппаратов и являются подготовительным этапом по очистке металлоконструкций от нагара, остатков нефтепродуктов, старой краски и грязи. Аппарат воздействует на поверхность потоком смеси воздуха и абразива под большим давлением. Предварительная чистка обязательна перед последующей покраской, в противном случае вновь нанесенный слой краски будет недолговечным. Очистка металлоконструкций может производиться также и вручную, с помощью шкурок или же механическими шлифовальными машинками.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Обеспыливание</strong></span> потолочных конструкций представляет собой удаление пыли с балок при помощи ранцевых пылесосов, с использованием гидроподъемного оборудования (строительные мачтовые подъемники, люльки, краны) или же штанговым оборудованием с насадками.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Антикоррозийная обработка</strong></span> позволяет увеличить срок эксплуатации металлоконструкций и существенно сократить затраты на восстановление отдельных элементов, узлов и систем в целом. Места вздутия краски на поверхности вскрываются (так называемые &laquo;жучки&raquo;, когда под пузырем образуется ржавчина) и тщательно зачищаются. Ошкуренная поверхность более приспособлена к агдезии с лакокрасочными материалами. После этого на поверхность металлоконструкции наносится грунт (чаще всего используется сурик).</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Покраска металлоконструкций </strong></span>является следующим этапом обработки. Она может быть выполнена как вручную с помощью валиков и кистей, так краскопультом. Выбор вида финального покрытия зависит от условий, в которых эксплуатируются металлоконструкции (наружная или внутренняя эксплуатация, агрессивность среды, наличие влаги в помещении и т.д.). Также возможно применение краски &laquo;3 в одном&raquo;, которая состоит из преобразователя ржавчины, грунт и собственно краску.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Сварочные работы</strong></span> необходимы для соединения частей металлоконструкции между собой. Все кромки деталей, которые необходимо сварить, стачиваются под определенным углом. Правильная разделка обеспечивает наименьшую степень деформации после сварки, а так же высокую прочность сварочного шва.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>6. Остекление зимнего сада</strong></span> в наше время становится признаком статуса и престижа его владельца. Зимний сад представляет собой светопрозрачную конструкцию, используемую в качестве оранжереи, веранды, бассейна и т.п. Зимний сад может иметь форму купола или пирамиды, быть сопряженным с несущей стеной основной постройки или располагаться отдельно. Наклонное остекление купола оснащается открывающимися элементами (окна, фрамуги). В современных домах зимние сады часто устраивают на последних этажах многоквартирных домов или на утепленных лоджиях квартир.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '8a2c138b587f6589d45f68853ae05efc.jpg', NULL, NULL, NULL, ''),
(34, 'Трубы', 3, 45, 46, '2012-05-14 16:42:53', 1, 0, '<p style="text-align: justify;">Различные <strong>трубы</strong> применяются в разных сферах и востребованы на многих объектах. По мере увеличения сроков их эксплуатации все острее встает вопрос контроля за техническим состоянием и проведением своевременного ремонта. Так, металлические, железобетонные или кирпичные трубы должны быть обязательно разобраны при выведении из эксплуатации. Зачастую проведение такого рода работ бывает сопряжено с техническими трудностями. Близкое расположение строений вокруг, разрушенное состояние самой трубы &ndash; все это может представлять опасность для людей. Технологии промышленного альпинизма существенно облегчают выполнение этих задач.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Покраска труб</strong></span> должна производиться специальными красками, способными выдержать большие перепады температур. Маркировочная окраска с чередованием широких белых и цветных полос обязательна. В зависимости от того, из какого материала сделана труба (кирпич, бетон, металл), выбирается и тип краски. Перед этим выполняется необходимый комплекс подготовительных работ к окрашиванию (очистка от старой краски, огрунтовка поверхности и т.д.)</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Ремонт труб</strong></span> представляет собой комплекс различных работ, связанных, прежде всего, с укреплением всей конструкции. Для кирпичных труб бывает необходима переборка оголовка, шпатлевка и штукатурка, замена стяжных колец. На железобетонных трубах могут появляться микротрещины. Устранить их помогут сухие стяжки, а специальный состав защитит арматуру. Металлические трубы, как правило, выходят из строя по причине повреждения ржавчиной. Для предотвращения разрушения производится антикоррозийная защита. Также проводится ремонт фундамента трубы, делается усиление фланцевых соединений основания. Помимо непосредственно ремонтных работ на трубы устанавливается система молниезащиты, производится монтаж сигнальных фонарей.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Демонтаж труб</strong></span> является одной из самых сложных работ в сфере промышленного альпинизма. Перед проведением этой операции необходимо тщательно проанализировать состояние трубы, определиться с технологией проведения работ. Демонтаж металлических труб осуществляется с помощью болгарки и методом кислородной резки. Секции трубы спускаются на землю на веревках или снимаются с помощью автокрана. Демонтаж железобетонных труб может быть проведен с использованием гидроклина. Демонтаж кирпичной трубы методом разбора можно проводить со сбросом обломков наружу или вовнутрь трубы. Разбор трубы вовнутрь с подмостей на кронштейнах возможен, если стяжные кольца достаточно крепкие. В противном случае разбор производится с подвесной площадки, расположенной внутри сносимого столба.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'e50a0419525c06053090f9d53fdcdd65.jpg', NULL, NULL, NULL, ''),
(39, 'Уличная подсветка', 3, 53, 54, '2012-03-26 14:26:51', 1, 0, '<p style="text-align: justify;">Ночь преображает города. Исчезают архитектурные изыски зданий, незаметной становится красота городских пейзажей. <strong>Уличная подсветка</strong> является простым и эффективным способом придать городу новый облик. Одновременно с этим создаваемое дополнительное освещение играет немаловажную роль в достижении безопасности людей.</p>\r\n<p style="text-align: justify;"><span style="text-decoration: underline;">Типы уличного освещения</span> весьма разнообразны. Освещение улиц может быть организовано по инициативе города или же использоваться коммерческими фирмами как эффективный рекламный ход. Установка и подключение оборудования, используемого при уличном освещении, осуществляется с привлечением специалистов промальпа, так как большая часть рекламных объектов расположена на высоте, куда добраться без помощи специального снаряжения бывает невозможно.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Подсветка зданий</strong></span> придает каждому зданию оригинальность и неповторимость. При помощи художественной декоративной подсветки можно выделить отдельные детали и элементы украшения фасадов. Используемая в коммерческих целях подсветка ресторанов и кафе подчеркнет статус и респектабельность заведения. Подсвеченные торговые центры и кинотеатры получат возможность привлечь к себе дополнительное количество посетителей.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Подсветка деревьев</strong></span> способна придать парку или аллее привлекательный вид круглый год вне зависимости от погодных условий. Светодиодные гирлянды и фонарики крепятся на высоте между веток деревьев. Такая подсветка превращает деревья в сказочные элементы. Особенно актуальным данный тип освещения становится в период новогодних праздников.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Подсветка мостов</strong></span> должна соответствовать стилю и общему дизайну архитектурных сооружений, зданий, располагающихся вблизи моста. В период праздников украшение мостов гирляндами и флагами придает городу нарядный вид, а кроме этого дополнительно освещает улицы.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>4. Подсветка прожекторами и софитами</strong></span> может быть организована на совершено разных объектах. Подкрышная подсветка стоянок, монтаж светового освещения на стадионе, устройство освещения на складских территориях, подсветка плакатов, рекламных щитов или брандмауэров, закрепленных на фасадах зданий &ndash; эти и многие другие типы подсветок могут быть организованы с помощью услуг промышленных альпинистов.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>5. Световые вывески</strong></span> бывают совершенно разных видов. <span style="color: #000000;"><strong><em>Световые короба</em></strong></span> представляют собой сборную конструкцию, имеющую плоскую поверхность с нанесенной информацией, под которой находятся лампы. <span style="color: #000000;"><strong><em>Объемные буквы</em></strong></span> состоят из независимых элементов, что позволяет размещать их на поверхностях со сложным рельефом. <span style="color: #000000;"><strong><em>Крышные установки</em></strong></span> могут соединять в себе элементы световых коробов и отдельно монтируемых объемных букв.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '82d6b182d74140d27434a7360ee9c5c7.jpg', NULL, NULL, NULL, ''),
(40, 'Декор', 3, 55, 56, '2012-03-26 14:26:51', 1, 0, '<p style="text-align: justify;">Сейчас каждый день происходят самые различные рекламные выставки, акции, презентации. Привлекающий внимание <strong>декор</strong> и грамотное оформление такого рода мероприятий способны подчеркнуть уникальность и индивидуальность каждой из участвующих в них компаний.</p>\r\n<p style="text-align: justify;">Для технической реализации подобных событий часто привлекаются специалисты с опытом работы на высоте, так как многие элементы декорирования крепятся под потолок, а на выставочных мероприятиях большое количество аппаратуры также располагается высоко от пола.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Оформление выставок</strong></span> &ndash; это не только возведение отдельных стендов, но и общее оформление выставочных площадей. Многообразие оборудования, размещаемого на выставках, требует аккуратной сборки и монтажа в условиях ограниченного пространства. Технологии промышленного альпинизма могут помочь в реализации дизайнерских задумок с технической точки зрения. Крепеж светового оборудования, установка разделительных перегородок, протяжка кабелей к осветительным приборам &ndash; эти и многие другие задачи могут быть с легкостью реализованы.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Украшение интерьеров</strong></span> к празднику или по случаю проведения тех или иных торжеств в последнее время становится приятной традицией. Торговые центры стремятся привлечь покупателей красиво оформленными площадями. Элементами декора могут выступать рекламные плакаты, потолочные подвесы, большие декорированные елки. При организации праздников, шоу-мероприятий, корпоративов становится популярным украшение помещения шарами. Промышленные альпинисты способны безопасно перемещаться под потолком по металлоконструкциям, проводя монтаж тех или иных элементов декора по желанию заказчика.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 'dfdf4c66ad77bd1e09298d0770f47a76.jpg', NULL, NULL, NULL, ''),
(38, 'Электромонтаж', 3, 51, 52, '2012-03-26 15:55:12', 1, 0, '<p style="text-align: justify;"><strong>Электромонтажные работы</strong> считаются одними из самых опасных видов работ, так как они сопряжены с большими рисками для жизни и здоровья людей. Именно поэтому монтаж электрооборудования должен производиться только профессионалами. Доверьте нам работы по сборке и установке электромонтажного оборудования, и мы соберем электрошкаф в Вашем офисе, сможем организовать современное освещение в Вашем торговом павильоне, устраним неполадки в электроповодке в Вашем доме или квартире.</p>\r\n<p style="text-align: justify;">Мы проводим работу с нашими заказчиками как на инженерно-проектном уровне (т.е. непосредственно помогаем Вам разработать всю электросистему), так и на этапе составления схем с последующим монтажом по уже имеющимся у заказчика проектам.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>1. Сборка электрических щитов любой сложности (офисные и квартирные щиты)</strong></span> производится в строгом соответствии с правилами устройства электроустановок и, конечно, со строгим соблюдением техники безопасности.&nbsp;Офисные, промышленные и квартирные щиты (ПР, ЩР, ВРУ, ГРЩ), щиты с автоматикой , системами контроля и управления собираются на коплектующих как российских, так и зарубежных производелей.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>2. Электромонтажные работы</strong></span> включают в себя прокладку электролиний, установку электротехнических приборов и устройств, подключение системы, а также обязательное зазмеление и молниезащиту оборудования.</p>\r\n<p style="text-align: justify;"><span style="color: #198cc2;"><strong>3. Пуско-наладочные работы </strong></span>представляют собой целый комплекс отдельных мероприятий, связанных с проверкой и подтоговкой всей электросистемы к дальнейшей работе.&nbsp;Специалисты производят замеры сопротивления изоляции, замеры сопротивления петли "фаза-ноль", прогрузку автоматических выключателей и т.д. Одним из важнейших условий является монтаж релейной защиты. По итогам замеров производится составление технических расчетов.</p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,       руководствуясь наработанным опытом, подберут для Вас оптимальное       решение по применяемым технологиям, согласуют график работ, обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', '948305512112ad5fa657288bd8ae99c0.jpg', NULL, NULL, NULL, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

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
(197, '20', 'Gallery', '023.jpg', 'files', '023.jpg', NULL, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `is_published`, `order`) VALUES
(1, '02.07.2011 Покраска, школа №1000, Солнцево', 1, 1),
(2, '27.07.2011 Покраска, детский сад, ул. Ак. Анохина', 1, 2),
(4, '15.08.2011               Помывка, Ленком', 1, 3),
(5, '01.09.2011 Помывка и покраска здания, Солянка', 1, 4),
(6, '05.10.2011 Помывка и покраска здания, Земляной вал', 1, 5),
(7, '14.12.2011 Замена фасадного остекления, Одинцово', 1, 6),
(8, '16.01.2012 Сборка и установка электромонтажного оборудования', 1, 7),
(9, '20.02.2012 Монтаж отливов, герметизация швов, жилое здание', 1, 8),
(14, '04.04.2012 Москва-Сити, полировка', 1, 10),
(13, '22.03.2012 Мойка окон офисного здания', 1, 9),
(15, '23.04.2012 Аэропорт Якутска, мойка фасадного остекления', 1, 11),
(16, '05.05.2012 Московская областная Дума, мойка фасада', 1, 12),
(17, '11.05.2012 Мойка окон и мойка фасада, Солянка', 1, 13),
(18, '16.05.2012 Гидрофобизация фасада 1650 кв.м.', 1, 14),
(19, '02.07.2012 Монтаж кровли балкона квартиры, установка отливов', 1, 16),
(20, '14.06.2012 Герметизация швов, оранжерея 18 век, элитный пос.Довиль, Одинцовский район', 1, 15);

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
(1, 'Верхнее меню', 1),
(2, 'Главное меню', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `menu_links`
--

INSERT INTO `menu_links` (`id`, `lang`, `parent_id`, `page_id`, `menu_id`, `title`, `url`, `user_role`, `not_user_role`, `order`, `is_visible`) VALUES
(1, 'ru', NULL, 1, 1, 'Главная', '/', NULL, NULL, 1, 1),
(2, 'ru', NULL, 2, 1, 'Услуги', '/service', NULL, NULL, 2, 1),
(3, 'ru', NULL, NULL, 1, 'Фото', '/photo', NULL, NULL, 3, 1),
(4, 'ru', NULL, NULL, 1, 'Отзывы', '/reviews', NULL, NULL, 4, 1),
(6, 'ru', NULL, NULL, 1, 'Цены', '/prices', NULL, NULL, 6, 1),
(13, 'ru', NULL, NULL, 1, 'Сотрудничество', '/no', NULL, NULL, 7, 1),
(23, 'ru', NULL, NULL, 2, 'Контакты', '/', NULL, NULL, 8, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Дамп данных таблицы `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `object_id`, `model_id`, `title`, `keywords`, `description`, `date_create`, `date_update`) VALUES
(5, 2, 'Page', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм, высотные работы, крыша сосульки, очистка кровли от наледи, очистка кровли от снега, очистка крыши от снега, сброс снега, уборка крыши снег, чистка снега кровля, сбить сосульку', 'ПромАльпГруппа "ВертикАльП" собрала под своим именем профессионалов, работающих в сфере промышленного альпинизма.', '2011-10-19 17:25:04', '2011-12-29 14:59:25'),
(7, 1, 'Page', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'фасадные работы, мойка фасада, мойка окон, покраска фасада, ремонт фасада, мойка фасадов', 'ПромАльпГруппа "ВерикАльП". Высотные работы широкого профиля. Оптимальное решение. Быстро. Экономично. Опыт и квалификация, профессиональный подход и ответственность за результат. Выезд специалиста на объект - БЕСПЛАТНО!', '2011-10-19 17:25:29', '2012-07-03 21:46:25'),
(8, 3, 'News', 'zzzz', 'keyww', 'oppp', '2011-10-20 13:10:13', '2011-10-20 13:12:40'),
(9, 20, 'Page', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм, высотные работы, выезд для осмотра объекта бесплатно', 'Телефон +7(495)226-77-96. Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.  Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы  - бесплатно! Руководитель проектов Худик Александр.', '2011-12-26 20:54:15', '2012-06-28 20:33:07'),
(10, 21, 'Page', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм сотрудничество, высотные работы, сотрудничество в промышленном альпинизме, промышленный альпинизм генподряд, промышленный альпинизм субподряд, промышленный альпинизм работа, нужны промышленные альпинисты, промышленный альпинизм работа', 'Сотрудничество с организациями: генподряд или субподряд. Сотрудничаем с event-агентствами и рекламными компаниями. Необычные поздравления, доставка букета в окно. Выполним разовые работы в соответствии с вашими пожеланиями. Нанимаем промышленных альпинистов, работа для промышленных альпинистов.', '2011-12-26 21:04:36', '2012-01-10 23:54:31'),
(11, 22, 'Page', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм цены, уборка снега цена, очистка снега с крыш, сбить сосульку цена, покраска фасада цена, мойка окон цена, мойка фасада цена, штукатурка фасада цена, покраска фасада цена, покраска металлоконструкций цена', 'В этом разделе вы можете ознакомиться с примерными ценами на наши услуги. Мы рады предложить нашим постоянным клиентам СКИДКИ за большой объем выполняемых работ и комплексное сотрудничество по различным направлениям нашей деятельности.', '2011-12-28 20:49:51', '2012-01-10 23:51:28'),
(12, 2, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'мойка окон, мойка фасада, мытье окон, мытье фасада, помыть фасад, помыть окна, промышленный альпинизм, ремонт фасада, фасада, мойка фасадов, мойка стекол, мойка окон цены, покраска фасада', 'В крупных городах услуги по мойке окон и мойке фасадов являются крайне востребованными. Для выполнения таких работ привлекаются промышленные альпинисты. Мойка окон и мойка фасадов поможет привести облик любого здания в надлежащий вид.', '2011-12-29 15:09:29', '2012-03-25 23:41:33'),
(36, 38, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'электромонтаж, электромонтажные работы, монтаж рекламы, электроработы', 'Сборка электрических щитов любой сложности , квартирные щиты, Пуско-наладочные работы: замеры сопративления изоляции, релейная защита, пуско-наладочные работы.', '2012-03-26 14:13:11', '2012-03-26 15:55:12'),
(38, 40, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'украшение помещений шарами, декор помещений, подвесы, украшение бассейнов, украшение шарами, оформление выставок, возведение стендов', 'Украшение интерьеров, оформление выставок, декорирование к празднику. Промышленный альпинизм может быть успешно применен не только при выполнении уличных работ, промальп технологии также успешно используются для различных работ внутри помещений, таких как рекламные кампании, украшение к праздникам.', '2012-03-26 14:14:27', '2012-03-26 14:25:54'),
(14, 13, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'мойка окон, мойка фасадов, мойка стекол, стекломой, помыть окна, помыть здание, мытье окон, мытье фасадов, клининг, промышленный альпинизм клининг, промышленный альпинизм мойка окон, промышленный альпинизм помыть окна, автоматизированная мойка, мойка окон под давлением, вертикальп, клининг цены', 'Чистые окна и витрины – это лицо здания, поэтому стекломой – один из самых популярных видов работ на сегодняшний день в сфере промышленного альпинизма. Технологии промышленного альпинизма широко применяются при мойке зданий с панорамным остеклением, складских помещений, зданий ТРЦ.', '2011-12-29 15:19:36', '2012-07-13 11:20:25'),
(15, 14, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'мойка фасада, мойка окон, мойка фасадов, помыть стекла альпинисты, очистка фасада, очистка фасада от краски, пескоструйная очистка, промышленный альпинизм, высотные работы, мойка фасада под давлением, очистить фасад от краски, мойка фасадов зданий, отмыть фасад цена, очистить фасад, вертикальп', 'Мойка фасада - одна из наиболее распространенных услуг, оказываемых промышленными альпинистами. Мойка здания обязательно выполняется перед ремонтными работами на фасаде. При помощи технологий промальпа можно очистить стены здания даже в труднодоступных местах.', '2011-12-29 15:22:04', '2012-01-11 00:14:04'),
(16, 3, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'фасадные работы, шпатлевка стен, шпаклевка стен, очистка фасада, расшивка трещин, герметизация швов, реставрация лепнины, покраска лепнины, реставрация фасада, покрасить фасад, восстановление балкона, балкон ремонт, облицовочные работы, покраска фасада, декоративные элементы фасада, вентфасад', 'Очистка фасада, штукатурные работы, шпатлевка, покраска, облицовочные работы, устройство цоколя, установка дополнительных декоративных элементов, реставрация лепнины, восстановление балконов, герметизация швов – все это и многое другое входит в понятие «фасадные работы».', '2011-12-29 15:42:48', '2012-01-11 00:14:38'),
(17, 15, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'очистка фасада, чистка фасада, удаление высолов, высолы на кирпичной кладке, мойка фасада под давлением, удаление граффити, очистка фасадов зданий, очистка стен от краски, плесень на стенах удаление, грибок на стенах удаление, промышленный альпинизм, вертикальп, высотные работы, промальп', 'Очистка фасада – это та необходимая услуга, которая позволит поддержать привлекательность здания и одновременно поможет отодвинуть время проведения его ремонта. Пескоструйная чистка. Удаление плесени, грибка, устранение высолов. Очистка от граффити.', '2011-12-29 15:56:54', '2012-01-11 00:16:56'),
(18, 16, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'ремонт фасада, капитальный ремонт фасада, косметический ремонт фасада, штукатурка фасада, шпаклевка фасада, покраска фасада, покрасить фасад, расшивка трещин, вентилируемый фасад ремонт, вентфасад, мокрый фасад ремонт, ремонт мокрого фасада, ремонт вентилируемого фасада, облицовка фасада, вертикальп', 'Ремонт фасада. Ремонт "мокрого" фасада. Ремонт вентилируемый фасад. Капитальный ремонт фасада. Косметический ремонт фасада.', '2011-12-29 16:00:54', '2012-01-11 00:17:31'),
(19, 22, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'замена кирпичей, восстановление кирпичной кладки, армирование стены, выпадение кирпичей из стены, кирпичная стена, восстановление кирпичей, высолы на кирпичной кладке, шпаклевка стены, штукатурка фасада, вертикальп', 'Замена кирпичей. Восстановление кирпичной кладки. Армирование стены.', '2011-12-29 16:03:24', '2012-01-11 00:18:29'),
(20, 23, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'покраска фасада, декор фасада, декорирование фасада, украшение на фасаде, лепнина, восстановление лепнины, декор из пенопласта, фасад декор, покраска разноцветная, разноцветная покраска стен, декоративная штукатурка, покраска лепнины, облицовка фасада, облицовочные панели замена, фасадный декор', 'Декор фасада – это отличная возможность оформить здание в оригинальном стиле, сделать его внешне привлекательным и неповторимым. Декоративная отделка фасада, лепнина, покраска, облицовка.', '2011-12-29 16:07:56', '2012-01-11 00:19:07'),
(21, 24, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'утепление фасада, утепление здания, утепление мокрого фасада, утепление вентфасада, утепление вентилируемого фасада, герметизация швов, звукоизоляция здания, сэндвич панели, термоплита, минеральная вата, утепление внешней стены, утеплитель на стене, штукатурка фасада, покраска фасада, вертикальп', 'Утепление фасада. Теплоизоляционная система защитит строение от разрушений и перепадов температур. Увеличение срока эксплуатации здания. Утепление стен современными материалам, сокращение теплопотери, экономия.', '2011-12-29 16:11:37', '2012-01-11 00:19:24'),
(22, 25, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'герметизация швов, герметизация межпанельных швов, герметик силиконовый, открытый шов, герметизация открытый шов, закрытый шов, герметизация закрытый шов, первичная герметизация, вторичная герметизация, вкрыть старый шов, герметизация стены, фасадные работы, декор фасада, вертикальп, промальп', 'Герметизация межпанельных швов призвана защитить дом от холодного воздуха. Совместить теплоизоляцию и гибкость помогут эластичные герметики на силиконовой основе.', '2011-12-29 16:14:35', '2012-01-11 00:19:48'),
(23, 8, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'очистка кровли от наледи, очистка кровли от снега, очистка крыши от снега, сброс снега, уборка крыши снег, очистка крыши от наледи, наледь очистка, очистка крыши от сосулек, почистить крышу, очистка крыш от снега, уборка снега с кровли, уборка снега с крыш, чистка снега, вертикальп, промальп', 'Очистка кровли от снега и наледи. Разовый выезд, Абонентское обслуживание. Очистка снега по периметру на расстоянии 1,5 метров от края кровли. Полная очистка поверхности крыши от снега. Удаление сосулек.', '2011-12-29 16:18:02', '2012-05-14 13:19:28'),
(24, 10, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж кондиционеров, демонтаж кондиционеров, наружный блок кондиционера, промышленный альпинизм, высотные работы, кондиционер в квартиру, кондиционер замена, кондиционер ремонт, монтаж наружных блоков кондиционеров', 'Кондиционеры. Монтаж, обслуживание, ремонт. Замена очистителя. Демонтаж кондиционеров. Помывка кондиционеров.', '2011-12-29 16:20:23', '2012-05-14 13:04:39'),
(25, 11, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'кронирование, кронирование деревьев, обрезка деревьев, обрезка веток, удаление дерева, удаление дерева по частям, удаление дерева целиком, спил деревьев, спилить дерево, порубочный билет, удаление части дерева, стрижка деревьев', 'Спил деревьев может проводиться как в декоративных, так и в практических целях. Удаление дерева целиком. Удаление дерева по частям. Кронирование деревьев.', '2011-12-29 16:25:28', NULL),
(26, 12, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'утепление квартиры, утепление квартир, утепление стены, герметизация швов, швы в стенах, дует из стены, заделать щель в стене, дует снаружи, установить антенну, промышленный альпинизм, крыша на балкон, поздравление в окно, необычные поздравления в окно, доставка букета в окно, дед мороз в окно', 'Промышленный альпинизм частным заказчикам. Утепление квартир. Герметизация межпанельных швов. Установка крыши на балкон. Устарнение протечек в крыше.', '2011-12-29 16:29:11', '2011-12-29 16:38:03'),
(27, 19, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'утепление квартиры, утепление квартир, утепление стены, герметизация швов, швы в стенах, дует из стены, заделать щель в стене, дует снаружи, установить антенну, промышленный альпинизм, крыша на балкон, поздравление в окно, необычные поздравления в окно, доставка букета в окно, дед мороз в окно', 'Промышленный альпинизм частным заказчикам. Утепление квартир. Герметизация межпанельных швов. Установка крыши на балкон. Устарнение протечек в крыше.', '2011-12-29 16:31:47', NULL),
(28, 20, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'утепление квартир, герметизация швов, дует из стены, дует снаружи, установить антенну, промышленный альпинизм, крыша на балкон, поздравление в окно, необычные поздравления в окно, доставка букета в окно, дед мороз в окно, 8 марта необычные поздравления, нестандартное поздравление, поздравить любимую', 'Промышленный альпинизм частным заказчикам. Нестандартные поздравления в окно - порадуйте своих любимых необычным подарком. Удиви своих близких!', '2011-12-29 16:35:15', NULL),
(29, 21, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'промышленный альпинизм, поздравление в окно, необычные поздравления в окно, доставка букета в окно, дед мороз в окно, 8 марта необычные поздравления, нестандартное поздравление, поздравить любимую, новогоднее поздравление от деда мороза в окно, нестандартный подарок в окно, букет в окно', 'Промышленный альпинизм частным заказчикам. Нестандартные поздравления в окно - порадуйте своих любимых необычным подарком. Удиви своих близких! Закажи услугу "Новогоднее поздравление от Деда Мороза"!', '2011-12-29 16:37:42', NULL),
(30, 4, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'ремонт кровли, протечки на кровле, герметизация кровли, ремонт крыши, протекает крыша, кровельное полотно, монтаж кровли, монтаж кровельного покрытия, кровельные материалы, кровельный пирог, устройство кровельного пирога, гидроизоляция кровли, пароизоляция кровли, устройство кровли, вертикальп', 'Кровельные работы. Правильно подобранные кровельные материалы и технология устройства кровли обеспечат надежность крыши и долговечность ее эксплуатации. Монтаж кровли, герметизация кровли. Устройство кровельного пирога.', '2012-01-11 00:05:13', '2012-01-11 00:20:08'),
(31, 26, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж кровли, монтаж мягкой кровли, монтаж жесткой кровли, герметизация кровли, защита кровли, ремонт кровельного полотна, покрытие кровли, гидроизоляция кровли, покрытия для крыши, кровля, теплоизоляция кровли, кровля цены, кровля мягкая, кровельные материалы, промышленный альпинизм, вертикальп', 'Надежность и долговечность крыши, прежде всего, обеспечивает правильно выполненный монтаж кровли. Выполняем монтаж мягкой кровли, монтаж жесткой кровли.', '2012-01-11 00:08:31', '2012-01-11 00:20:20'),
(32, 28, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'герметизация кровли, ремонт кровли, монтаж кровли, пароизоляция кровли, гилроизоляция кровли, ремонт кровельного полотна, наливная кровли, мягкая кровля, жесткая кровля, вертикальп, промышленный альпинизм, кровля ремонт, ремонт кровельного полотна, герметизация швов, очистка кровли от снега', 'Герметизация кровли в местах соединений кровельного полотна и на стыках кровли с деталями крыши. Герметизация мягкой кровли. Герметизация жесткой кровли. Кровельная мастика. Наливная кровля.', '2012-01-11 00:23:01', NULL),
(33, 29, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'защита кровли, кровельные мостики, ограждения кровли, кровля цены, кровельные лестницы, снегозадержатели, снегоудержатели, очистка кровли от снега, уборка снега с крыши, вертикальп, промышленный альпинизм, очистка крыши от снега, сброс снега, сбить сосульку, элементы безопасности кровли', 'Элементы безопасности кровли. Кровельные ограждения. Кровельные мостики. Лестницы на скат. Лестницы на купол. Снегозадержатели.', '2012-01-11 00:27:04', NULL),
(34, 30, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'кровельные работы, монтаж водостоков, замена желобов, покраска желобов, герметизация кровли, желоб водосточный, вертикальп, промышленный альпинизм, высотные работы, монтаж водостоков, монтаж водостоков цена, водосточный желоб, водосточная система, ремонт металлических желобов, ремонт желобов', 'Замена желобов и ремонт водостока. Листья и другой мусор попадают в желоба, засоряя воронки и водосточные трубы. Промышленный альпинизм - работы по замене и ремонту водостоков. Ремонт металлических желобов. Ремонт пластиковых желобов.', '2012-01-11 00:32:31', NULL),
(37, 39, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'подсветка на улице, уличная подсветка, фонари, монтаж рекалмы, украшение улиц, подсветка улиц, световая реклама', 'Световая реклама на улицах. Подсветка зданий, декорирование деревьев, украшение мостов. Световые вывески, световые короба, объемные буквы, крышные установки.', '2012-03-26 14:14:10', '2012-03-26 14:18:36'),
(39, 7, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж наружной рекламы, монтаж рекламы, монтаж баннера, установка баннера, наружная реклама, реклама внутри помещений', 'Реклама - одни из самых эффективных способов привлечения внимания. Она является залогом успешного бизнеса. Наружная реклама очень разнообразна. Это и световые короба, объемные буквы, крашыне установки. Промальп поможет также в организации рекламы внутри помещений.', '2012-03-26 14:29:40', '2012-05-14 12:52:45'),
(40, 9, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж рекламы, монтаж баннера, крышная установка, монтаж вывесок, билборд, рекламные перетяжки', 'Монтаж наружной рекламы включает в себя огромное количество работ, зависящих от видов рекламы. Чтобы грамотно провести монтаж объектов рекламы, необходимо учитывать множество факторов: близость от линий электропередач, состояние фасада здания, наличие на стене кондиционеров, спутниковых антенн.', '2012-03-26 14:32:35', NULL),
(41, 5, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'обслуживание мостов, обслуживание гидросооружений, украшение мостов, покраска гидросооружений, шлюзовые работы, шлюзовые ворота, антикоррозийная защита моста, ремонт путепровода, ремонт мостов', 'Обслуживание мостов и гидросооружений. Покраска мостов. Гидрофобизация мостовых конструкций.', '2012-05-14 13:22:45', NULL),
(42, 17, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'обслуживание мостов, антикоррозийная защита мостов, украшение моста флагами, установка датчиков на мосты, сварочные работы на мосту, покраска мостов', 'Обслуживание мостов. Антикоррозийная защита мостов. Установка датчиков. Сварочные работы на мостах. Остекление мостов.', '2012-05-14 13:25:05', NULL),
(43, 18, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'обслуживание гидросооружений, очистка шлюза, покраска шлюза, штукатурка камер шлюза, установка оборудования на шлюз, антикоррозийная защита шлюза', 'Обслуживание гидросооружений. Покраска шлюза. Обслуживание шлюзовых камер. Покраска и штукатурка шлюзовых камер. Антикоррозийная защита.', '2012-05-14 13:27:20', NULL),
(44, 6, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж оборудования на высоте, монтаж кондиционера, обслуживание кондиционеров, покраска металлоконструкций, стальные фермы, обеспыливание металлических ферм, сооружение сцены, монтаж электрооборудования', 'Монтаж оборужования. Металлоконструкции любых типов. Оборудование для сцен, монтаж осветительного оборудования.', '2012-05-14 13:30:24', NULL),
(45, 31, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж вышек сотовой связи, монтаж телевизионной антенны, оборудования для сцен, установка датчиков, промышленный альпинизм, монтаж кондиционеров, монтаж освещения, монтаж рекламы, наружнее освещение здания', 'Монтаж оборужования. Монтаж оборудования для сцен. Монтаж кондиционеров. Монтаж рекламы.', '2012-05-14 13:32:27', NULL),
(46, 32, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'монтаж металлоконструкций, монтаж оборудования для сцен, монтаж выставочного оборудования, выставочные павильоны монтаж, пескоструйная очистка поверхности, остекление зимнего сада, сварочные работы на металлоконструкциях, антикоррозийная обработка, металлические фермы покраска, обеспылевание  ', 'Монтаж металлоконструкций. Монтаж оборудования для сцен. Монтаж выставочного оборудования. Пескоструйная очистка. Остекление зимнего сада. Сварочные работы на металлоконструкциях. Антикоррозийная обработка.', '2012-05-14 13:32:44', '2012-05-14 16:40:29'),
(47, 34, 'Category', 'ВертикАльП - промышленный альпинизм, любые виды высотных работ', 'покраска трубы, очистка трубы, разбор трубы, демонтаж трубы, установка светового оборудования на трубу, антикоррозийная обработка трубы, укрепление фундамента трубы, кирпичные трубы, бетонные трубы, металлические трубы', 'Ремонт труб. Покраска, антикоррозийная обработка труб. Монтаж и демонтаж труб. Установка освещения на верхушке трубы.', '2012-05-14 16:42:53', NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `lang`, `title`, `url`, `text`, `is_published`, `date_create`, `back_left`, `back_center`) VALUES
(1, 'ru', 'Главная страница', '/', '<p style="text-align: center;"><strong style="font-size: xx-large;"><span style="color: #ff6600;">ДОБРО ПОЖАЛОВАТЬ!&nbsp;</span></strong></p>\r\n<p style="text-align: center;"><span style="font-size: medium;"><strong>ПромАльпГруппа "ВертикАльП" рада приветствовать Вас на своем сайте.</strong></span></p>\r\n<p style="text-align: center;"><span style="font-size: small;">Основная специализация компании &ndash; <span style="font-size: small;">высотные работы самого широкого профиля</span>.<br /><strong>Промышленный альпинизм</strong> уже давно стал привычным атрибутом нашего времени,<br />зачастую он является самым быстрым, экономичным и удобным способом решить поставленные задачи.</span></p>\r\n<h3 style="text-align: center;"><span style="font-size: small;">Спектр наших услуг не ограничивается представленными на сайте разделами.<br />Мы рады помочь нашим клиентам в реализации их идей.</span></h3>\r\n<p style="text-align: center;"><span style="font-size: medium;"><span style="font-size: small;">Позвоните нам, и мы подробно расскажем о нашей работе,<br />учтем все Ваши пожелания, обсудим цены и сроки исполнения Вашего заказа.<br />Полученные <a href="../../../../reviews">рекомендации</a> - свидетельство качества нашей работы.</span></span></p>\r\n<p style="text-align: center;">У нас в команде работает постоянная слаженная бригада.<br />Опыт и  квалификация, профессиональный подход и ответственность за результат &ndash;  мы всегда придерживаемся этих принципов в достижении наших целей.<strong>&nbsp;</strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong>Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;, руководствуясь наработанным опытом, подберут для Вас оптимальное решение по применяемым технологиям, согласуют график работ, обсудят детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong><strong><em>&nbsp;</em></strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>\r\n<p style="text-align: center;"><em><!-- Gismeteo informer START --> </em></p>\r\n<div id="gsInformerID-w31vc3Ai" class="gsInformer" style="width: 240px; height: 243px;"><em>\r\n<div class="gsIContent">\r\n<div id="cityLink" style="text-align: left;"><a href="http://www.gismeteo.ru/city/daily/4368/" target="_blank">Погода в Москве</a></div>\r\n<div class="gsLinks">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>\r\n<div class="leftCol" style="text-align: left;"><a href="http://www.gismeteo.ru" target="_blank"><img title="Gismeteo" src="http://www.gismeteo.ru/static/images/informer2/logo-mini2.png" border="0" alt="Gismeteo" align="absmiddle" /><span>Gismeteo</span></a></div>\r\n<div class="rightCol" style="text-align: left;"><a href="http://www.gismeteo.ru/city/weekly/4368/" target="_blank">Прогноз на 2 недели</a></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</em></div>\r\n<p><em>\r\n<script src="http://www.gismeteo.ru/ajax/getInformer/?hash=w31vc3Ai" type="text/javascript"></script>\r\n<!-- Gismeteo informer END --></em></p>\r\n<p>&nbsp;</p>', 1, '2011-06-25 16:23:15', '33d90fb838a8d51456a36d3d7eec2357.jpg', '9f3d5addafa49517f3fcfe146286e06b.jpg'),
(22, 'ru', 'Цены', 'prices', '<p style="text-align: center;"><strong>В ЭТОМ РАЗДЕЛЕ ВЫ МОЖЕТЕ ОЗНАКОМИТЬСЯ С ПРИМЕРНЫМИ ЦЕНАМИ НА НАШИ УСЛУГИ.</strong></p>\r\n<p style="text-align: left;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="text-decoration: underline;">На окончательное формирование цены могут влиять следующие факторы:</span><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&bull;<span> </span>ограниченное время или срочность работы (например, работа возможна только ночью или в выходные дни)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&bull;<span> </span>этажность здания и сложная конфигурация фасада (большие козырьки, нависания, выступающие конструкции)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&bull;<span> </span>угол наклона крыши, отсутствие мест креплений на крыше и ограждений на кровле<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&bull;<span> </span>большая проходимость людей т.п.</p>\r\n<p style="text-align: center;"><strong>Мы рады предложить нашим постоянным клиентам <span style="color: #ff9900; font-size: medium;">СКИДКИ</span> за большой объем выполняемых работ<br />и комплексное сотрудничество по различным направлениям нашей деятельности.</strong></p>', 1, '2011-12-28 20:49:51', NULL, NULL),
(2, 'ru', 'О нас', '', '<p>ПромАльпГруппа "ВертикАльП" собрала под своим именем профессионалов, работающих в сфере промышленного альпинизма.</p>', 1, '2011-09-10 17:11:25', NULL, NULL),
(20, 'ru', 'Контакты', 'contacts', '<p style="text-align: center;"><span style="text-decoration: underline; font-size: medium;"><strong><br />НАШИ ТЕЛЕФОНЫ:</strong></span></p>\r\n<p style="text-align: center;">ОФИС С 10-00 ДО 20-00<span style="font-size: medium;"><br /><br /><span style="font-size: large;">+7 (499) 390-15-57</span></span></p>\r\n<p style="text-align: center;"><br /><strong>ФАСАДНЫЕ, КРОВЕЛЬНЫЕ РАБОТЫ, ПРОМЫШЛЕННЫЙ АЛЬПИНИЗМ</strong></p>\r\n<p style="text-align: center;"><span style="font-size: large;">+7 (925) 777-09-50<br />+7 (964) 594-85-51</span><span style="font-size: medium;"><br /></span><span style="font-size: medium;">контактное лицо - Александр<br /><br /></span></p>\r\n<p style="text-align: center;"><strong>ЭЛЕКТРОМОНТАЖ</strong><span style="font-size: medium;">&nbsp;</span></p>\r\n<p style="text-align: center;"><span style="font-size: medium;"><span style="font-size: large;">+7 (495) 645-77-91</span><br /><span style="font-size: large;">+7 (905) 75-76-722</span></span><span style="font-size: medium;"><br /></span><span style="font-size: medium;">контактное лицо - Алексей</span><span style="font-size: medium;">&nbsp;</span></p>\r\n<p style="text-align: center;"><strong>E-mail:</strong></p>\r\n<p style="text-align: center;"><span style="font-size: medium;">vertikalp@list.ru</span></p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,        руководствуясь наработанным опытом, подберут для Вас оптимальное        решение по применяемым технологиям, согласуют график работ,  обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 1, '2011-12-12 20:43:55', NULL, NULL),
(21, 'ru', 'Сотрудничество', 'cooperation', '<p style="text-align: center;"><strong><span style="font-size: medium;">ПромАльпГруппа &laquo;Вертик<em>А</em>льП&raquo; рада предложить</span><br /> <span style="color: #ff6600; font-size: x-large;">СОТРУДНИЧЕСТВО</span><br /><span style="font-size: medium;">как юридическим, так и физическим лицам.</span></strong><br /><br /><strong>В разделе&nbsp;</strong><strong><a href="../../../../page/contacts">Контакты</a> </strong><strong>Вы можете выбрать наиболее удобный способ связи с нами.</strong></p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><span style="color: #ff6600;"><strong>1. Юридическим лицам.</strong></span> Сотрудничество с организациями предполагает работу на условиях генподряда или субподряда. Мы также охотно сотрудничаем с event-агентствами и рекламными компаниями, занимающимися необычными поздравлениями.<br /><span style="text-decoration: underline;"><em><strong>Для выполнения работ в качестве генподрядчика</strong></em></span> наши сотрудники детально ознакомятся с вашим проектом, в случае необходимости дадут совет по использованию тех или иных материалов, согласуют применяемые технологии, обсудят сроки сдачи объекта.Собственникам мы можем предложить постоянное годовое обслуживание Вашего здания &ndash; в зимний период мы проведем уборку кровли от снега и наледи, весной помоем фасад, летом выполним покраску стен, ремонт кровли, чистку кондиционеров, осенью подготовим здание к зимнему периоду путем утепления и герметизации.<br /><span style="text-decoration: underline;"><em><strong>При работе по договору субподряда</strong></em></span>&nbsp;мы будем рады сотрудничеству с клининговыми и строительными компаниями, с ТСЖ и муниципальными структурами. Если у вас горят сроки сдачи объекта, если предыдущие работники не справились с поставленной задачей или не смогли до конца выполнить свои обязательства &ndash; звоните нам, мы постараемся вам помочь.<br /><span style="text-decoration: underline;"><em><strong>Необычные поздравления.</strong></em></span> Наша компания готова предложить сотрудничество в области организации нестандартных поздравлений. Промышленные альпинисты с радостью выполнят заказ &laquo;поздравление в окно&raquo; как для взрослых (поздравление с 8-м марта), так и для детей (новогоднее поздравление от Деда Мороза).</span></p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><strong><span style="color: #00ccff;"><span style="color: #ff6600;"><strong>2. Частным заказчикам</strong></span> </span></strong>мы посвятили отдельный </span><a href="../../../../chapter/private">Раздел</a><span style="font-size: small;">. Мы с радостью выполним для вас любые разовые работы в соответствии с вашими пожеланиями. Вне зависимости от того, живете ли вы в многоквартирном доме или являетесь обладателем собственного коттеджа, вы всегда можете обратиться к нам за консультацией.</span></p>\r\n<p style="text-align: justify;"><span style="font-size: small;"><strong><span style="color: #00ccff;"><span style="color: #ff6600;"><strong>3. Физическим лицам. </strong></span></span></strong>Мы также нуждаемся в опытных специалистах своего дела, способных выполнять работу четко, профессионально, с соблюдением сроков и с учетом пожеланий заказчиков. Мы гарантируем своевременную оплату за выполненные работы. Нам нужны надежные и ответственные люди, умеющие решать нестандартные задачи. Свои резюме вы можете отправлять на наш электронный адрес, мы обязательно свяжемся с вами!</span></p>\r\n<p style="text-align: center;"><strong> </strong></p>\r\n<hr />\r\n<p style="text-align: center;"><strong> Специалисты ПромАльпГруппы &laquo;Вертик</strong><strong><em>А</em>льП&raquo;,        руководствуясь наработанным опытом, подберут для Вас оптимальное        решение по применяемым технологиям, согласуют график работ,  обсудят       детали.<br />Мы гарантируем, что результат удовлетворит все Ваши ожидания!</strong></p>\r\n<p style="text-align: center;">Оценка стоимости конкретного вида работ производится специалистом Компании после осмотра объекта.<br />Выезд специалиста на объект (Москва, ближнее Подмосковье) для осмотра и составления сметы<em>&nbsp;</em><strong><em> - </em></strong><span style="font-size: large;"><strong>бесплатно!</strong><strong><em>&nbsp;</em></strong></span><br /><em>Выезд на объекты, удаленные от Москвы на большие расстояния, осуществляется после дополнительных согласований с Заказчиком.</em></p>', 1, '2011-12-13 17:59:30', NULL, NULL);

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


-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Название',
  `is_published` tinyint(1) NOT NULL COMMENT 'Опубликована',
  `order` int(11) NOT NULL COMMENT 'Сортировка',
  `photo` varchar(250) NOT NULL COMMENT 'Скан отзыва',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `title`, `is_published`, `order`, `photo`) VALUES
(1, 'СтройИнжинирингГрупп', 1, 2, 'b2f3a188a90983fb022d715d81357d4e.jpg'),
(2, 'Престиж Строй', 1, 1, '5ca712da4053518620a25aa34ca1def3.jpg');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

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
(25, 'main', 'phone1', 'Телефон1', '<span>+7 (495)</span> 226-77-96', 'text', 0),
(26, 'main', 'phone2', 'Телефон2', '<span>+7 (925)</span> 777-09-50', 'text', 0),
(27, 'main', 'phone3', 'Телефон3', '<span>+7 (964)</span> 594-85-51', 'text', 0),
(28, 'main', 'slogan', 'Слоган', '<h2>Альпинисты <span>Москвы</span></h2>промышленный альпинизм<br/> любые виды высотных работ', 'text', 0);

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
(1, 'Светлана', 'Колбаскова', NULL, 'pravil_net@mail.ru', '+7-965-1935233', '3aa794c53774cedecd73bec7e2c3d576', '2003-05-20', 'man', 'active', '070a63ae33af0eb7986992e774dc53e8', '2011-05-21 13:18:39', NULL, NULL, '2011-05-19 03:25:50'),
(19, 'Алексей', 'Шаров', NULL, 'www.pismeco@gmail.com', NULL, 'a1268781a44027b5633fd2140da69ecb', '2000-11-30', 'man', 'active', '827ccb0eea8a706c4c34a16891f84e7b', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '2011-11-11 16:17:20');
