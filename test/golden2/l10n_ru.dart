import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String get hasNewVersion => 'Есть новая версия приложения';

  @override
  String get needUpdate => 'Для продолжения работы необходимо обновить приложение';

  @override
  String get language => 'Язык';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageKazakh => 'Қазақ';

  @override
  String get quantity => 'Количество';

  @override
  String get from => 'из';

  @override
  String get dateFormatYearSymbol => 'г.';

  @override
  String daysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String get today => 'Сегодня';

  @override
  String get selectHistoryPeriod => 'Выберите период';

  @override
  String get pickerPeriodMonth => 'За месяц';

  @override
  String get pickerPeriodWeek => 'За неделю';

  @override
  String get pickerPeriod6Month => 'За полгода';

  @override
  String get pickerPeriodYear => 'За год';

  @override
  String get pickerPeriod3Month => 'За 3 месяца';

  @override
  String get pickerPeriodAll => 'За всё время';

  @override
  String get pickerPeriodCustom => 'Выбрать период';

  @override
  String get selectTimezone => 'Укажите часовой пояс';

  @override
  String get version => 'Версия';

  @override
  String get error => 'Ошибка';

  @override
  String get errors => 'Ошибки';

  @override
  String get unknownError => 'Что-то пошло не так';

  @override
  String get appNetworkError => 'Ошибка соединения с серверами, проверьте настройки Интернет';

  @override
  String get appSorryError => 'Извините за временные неудобства,\n мы работаем над устранением проблемы.\n Попробуйте снова';

  @override
  String get appServiceUnavailableError => 'Сервис временно недоступен';

  @override
  String get appServiceTooManyRequestsError => 'Слишком много запросов, попробуйте позднее';

  @override
  String get appClientClosedRequestError => 'Запрос не удался. Попробуйте еще раз';

  @override
  String get appNotFoundError => 'Не найдено';

  @override
  String get appUserNotFoundError => 'Пользователь не найден';

  @override
  String get appUserNotLoggedInError => 'Пользователь не авторизован';

  @override
  String get loginError => 'Ошибка авторизации';

  @override
  String get loginWrongPassword => 'Неверное имя пользователя или пароль';

  @override
  String get bonusError => 'Не удалось загрузить бонусы';

  @override
  String get contactsImportDuplicatesError => 'При импорте контактов с вашего устройства система нашла дубликаты с совпадающим номером телефона';

  @override
  String get buttonWrite => 'Написать';

  @override
  String get buttonSave => 'Сохранить';

  @override
  String get buttonLater => 'Позже';

  @override
  String get buttonSkip => 'Пропустить';

  @override
  String get buttonOnward => 'Далее';

  @override
  String get buttonGotoMain => 'На главную';

  @override
  String get buttonLogin => 'Вход';

  @override
  String get buttonLogout => 'Выйти';

  @override
  String get buttonRegistration => 'Регистрация';

  @override
  String get infoRegistration => 'Зарегистрируйтесь на сайте,\n вернитесь в приложение и выполните вход';

  @override
  String get areYouSureToLogout => 'Вы уверены, что хотите выйти?';

  @override
  String get buttonForgotPassword => 'Забыли пароль?';

  @override
  String get buttonDetails => 'Подробнее';

  @override
  String get wait => 'Подождите ...';

  @override
  String get buttonOk => 'Ok';

  @override
  String get buttonCancel => 'Отмена';

  @override
  String get buttonApply => 'Применить';

  @override
  String get buttonConfirm => 'Подтвердить';

  @override
  String get buttonReset => 'Сбросить';

  @override
  String get buttonApprove => 'Подтвердить';

  @override
  String get buttonSelect => 'Выбрать';

  @override
  String get buttonSelectAll => 'Выбрать все';

  @override
  String get editing => 'Редактирование';

  @override
  String get buttonEdit => 'Редактировать';

  @override
  String get buttonContinue => 'Продолжить';

  @override
  String get buttonTry => 'Попробовать';

  @override
  String get buttonChange => 'Изменить';

  @override
  String get buttonRetry => 'Повторить';

  @override
  String get buttonShare => 'Поделиться';

  @override
  String get buttonUse => 'Использовать';

  @override
  String get buttonView => 'Смотреть';

  @override
  String get buttonLook => 'Посмотреть';

  @override
  String get buttonCall => 'Позвонить';

  @override
  String get buttonInstall => 'Установить';

  @override
  String get buttonOrder => 'Заказать';

  @override
  String get buttonCreate => 'Создать';

  @override
  String get buttonAdd => 'Добавить';

  @override
  String get buttonRename => 'Переименовать';

  @override
  String get buttonDelete => 'Удалить';

  @override
  String get buttonClose => 'Закрыть';

  @override
  String get buttonGoto => 'Перейти';

  @override
  String get buttonLoginBiometry => 'Войти с помощью биометрии';

  @override
  String get buttonBook => 'Оформить';

  @override
  String get buttonLike => 'Нравится';

  @override
  String get buttonShow => 'Показать';

  @override
  String get buttonShowAll => 'Показать все';

  @override
  String get buttonSend => 'Отправить';

  @override
  String get buttonUpdate => 'Обновить';

  @override
  String get buttonDownload => 'Скачать';

  @override
  String get buttonMore => 'Еще...';

  @override
  String get updated => 'Обновлен';

  @override
  String get buttonAnywayContinue => 'Всё равно продолжить';

  @override
  String get buttonListen => 'Слушать';

  @override
  String get buttonOpen => 'Открыть';

  @override
  String get buttonClear => 'Очистить';

  @override
  String get buttonStart => 'Запустить';

  @override
  String get buttonYes => 'Да';

  @override
  String get buttonNo => 'Нет';

  @override
  String get buttonInvite => 'Пригласить';

  @override
  String get buttonKnowMore => 'Узнать больше';

  @override
  String get buttonImport => 'Импортировать';

  @override
  String get buttonCancelMarathon => 'Отменить программу';

  @override
  String get month => 'месяц';

  @override
  String get year => 'год';

  @override
  String get weekend => 'Выходной';

  @override
  String get time => 'Время';

  @override
  String get otpSmsTitle => 'SMS подтверждение';

  @override
  String otpSmsText(String number) {
    return 'Введите 4 цифры которые были отправлены на номер $number';
  }

  @override
  String get otpWrongSmsCode => 'Вы ввели неверный код из SMS';

  @override
  String get otpNoCode => 'Не пришел код? ';

  @override
  String get otpRepeatCode => 'Отправить повторно';

  @override
  String otpAllowRepeatCode(String count) {
    return 'через $count сек.';
  }

  @override
  String get clipboardCopy => 'Скопировано в буфер обмена';

  @override
  String get tabHomeLabel => 'Главная';

  @override
  String get tabProfileLabel => 'Профиль';

  @override
  String get tabProgramsLabel => 'Библиотека программ';

  @override
  String get tabContentLibraryLabel => 'Библиотека контента';

  @override
  String get tabContactsLabel => 'Контакты';

  @override
  String get tabCalendarLabel => 'Календарь';

  @override
  String get loginTitle => 'Выполните вход';

  @override
  String get loginDescription => 'Чтобы получить доступ ко всем функциям';

  @override
  String get searchNotFound => 'Ничего не найдено';

  @override
  String get searchFieldHint => 'Поиск';

  @override
  String get notificationDefaultChannelName => 'Основные уведомления';

  @override
  String get notificationDefaultChannelDescription => 'Вы можете настроить уведомления в профиле';

  @override
  String notificationsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'уведомлений',
      few: 'уведомления',
      one: 'уведомление',
    );
    return '$_temp0';
  }

  @override
  String get libraryCategories => 'Категории';

  @override
  String get libraryFilesGroup => 'Файлы';

  @override
  String get libraryVideoGroup => 'Видео';

  @override
  String get libraryAudioGroup => 'Аудио';

  @override
  String get libraryFilters => 'Фильтры';

  @override
  String get libraryCategoriesAll => 'Все категории';

  @override
  String get libraryResults => 'Результаты';

  @override
  String get libraryLanguagesAll => 'Все языки';

  @override
  String get programRecommendations => 'Рекомендации';

  @override
  String get programComposition => 'Состав программы';

  @override
  String get programDay => 'День';

  @override
  String get programStart => 'Запуск программы';

  @override
  String get programCancel => 'Отмена программы';

  @override
  String get programAreYouSureToCancel => 'Вы уверены, что хотите отменить программу?';

  @override
  String get programActionTypePost => 'Пост';

  @override
  String get programActionTypeInstruction => 'Рекомендация для организатора';

  @override
  String get programSelectDateTitle => 'Выберите дату';

  @override
  String get programSelectDateDescription => 'Укажите дату начала программы.\nОранжевым будут отображены дни подготовки.';

  @override
  String get programStartPublicationTitle => 'Публикация постов';

  @override
  String get programStartPublicationAutoDescription => 'Контент программы публикуется автоматически в отдельном telegram-канале';

  @override
  String get programStartPublicationManualDescription => 'Контент программы публикуется самостоятельно';

  @override
  String get programStartPublicationTypeAuto => 'Автоматическая публикация';

  @override
  String get programAutoMarathonTitle => 'Телеграм-бот';

  @override
  String get programAutoDescription => 'Вы выбрали программу с публикацией контента  автоматически. Посты будут размещаться системой через телеграм-бот.';

  @override
  String get programInviteToMarathonButton => 'Пригласить участников';

  @override
  String get programManualMarathonTitle => 'Публикация контента';

  @override
  String get programManualMarathonDescription => 'Вы выбрали программу с публикацией контента самостоятельно. Не забывайте ежедневно размещать посты для участников.';

  @override
  String get programManualMarathonComplete => 'Пост опубликован';

  @override
  String get programPreparingPostForSharing => 'Подготовка поста для публикации ...';

  @override
  String get programViewProgramsButton => 'Посмотреть программы';

  @override
  String get savingTitle => 'Сохранение';

  @override
  String get downloadError => 'Ошибка загрузки';

  @override
  String get downloading => 'Скачивание';

  @override
  String get downloaded => 'Скачано';

  @override
  String files(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'файлов',
      few: 'файлов',
      one: 'файла',
    );
    return '$_temp0';
  }

  @override
  String get homeGuestHeaderTitle => 'Добро пожаловать!';

  @override
  String get homeGuestHeaderText => 'Присоединяйтесь к Amway Start, чтобы делиться контентом и улучшать навыки маркетинга';

  @override
  String get profilePhoneNumber => 'Номер телефона';

  @override
  String get profileEmail => 'Email';

  @override
  String get profileEmailWrong => 'Неверный формат email';

  @override
  String get profileCity => 'Город';

  @override
  String get profileAmwayNumber => 'Номер Amway';

  @override
  String get profileBirthday => 'Дата рождения';

  @override
  String get profileStatus => 'Статус';

  @override
  String get profilePickStatus => 'Выберите статус';

  @override
  String get profileHobbies => 'Интересы';

  @override
  String get profilePickHobbies => 'Выберите интересы';

  @override
  String get profileConnectUs => 'Свяжитесь с нами';

  @override
  String get profileHelpAndSupport => 'Помощь и поддержка';

  @override
  String get profileAboutApp => 'О приложении';

  @override
  String get profileLegalInfo => 'Юридическая информация';

  @override
  String get profileProductInfo => 'Информация о продукте';

  @override
  String get profileUseConditions => 'Условия использования';

  @override
  String get profilePrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get profileMakePhoto => 'Сделать фото';

  @override
  String get profilePickPhoto => 'Выбрать из галереи';

  @override
  String get profileFirstName => 'Имя';

  @override
  String get profileLastName => 'Фамилия';

  @override
  String get profileAboutText1 => 'Amway Start — это официальное приложение от Компании Amway. В него включена обширная база знаний и методик, а также интерактивные инструменты для построения успешного индивидуального бизнеса. Здесь вы можете обучаться сами, собирать клиентскую базу и помогать развиваться партнерам.';

  @override
  String get profileAboutTitle2 => 'С приложением Amway Start вы сможете:';

  @override
  String get profileAboutText2 => '• Освоить принципы построения индивидуального бизнеса\n• Получить полезные знания в смежных сферах: диджитал-маркетинг, коммуникация, организация мероприятий\n• Проверить свои собственные знания с помощью заданий и тестов\n• Собрать интерактивную базу контактов клинетов и партнеров';

  @override
  String get profileAboutText3 => 'Для зарегистрированных пользователей открывается возможность углубленного изучения с помощью обучающих материалов на портале\nRubilix от Amway Академии. Со временем функционал приложения будет расширяться и включать в себя новые инструменты, полезные в формировании индивидуального бизнеса.';

  @override
  String get profileView => 'Посмотреть профиль';

  @override
  String get profileDelete => 'Удалить аккаунт из приложения';

  @override
  String get profileDeleteConfirm => 'Ваши личные данные будут полностью удалены с устройства.\n\nДля удаления личных данных с сервера обратитесь в службу поддержки\nhttps://www.kz.amway.com/contact-us\n';

  @override
  String get instruments => 'Инструменты';

  @override
  String get instrumentsIncomeCalculatorTitle => 'Калькулятор дохода и структуры';

  @override
  String get instrumentsIncomeCalculatorButton => 'Рассчитать доход';

  @override
  String get instrumentsRubilixTitle => 'Amway Academy';

  @override
  String get instrumentsRubilixText => 'Онлайн обучение';

  @override
  String get challengesCollapsedTitle => 'Активно';

  @override
  String programs(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'программ',
      few: 'программы',
      one: 'программа',
    );
    return '$_temp0';
  }

  @override
  String get myPrograms => 'Мои программы';

  @override
  String get challengesActive => 'Активные';

  @override
  String get challengesArchived => 'Архив';

  @override
  String get challengesArchivedEmpty => 'У вас нет завершенных программ';

  @override
  String get challengesActiveEmpty => 'У вас нет запущенных программ';

  @override
  String get challengePublicationTypeAuto => 'Авто';

  @override
  String get challengePublicationTypeManual => 'Вручную';

  @override
  String get challengeStatusFinished => 'Завершено';

  @override
  String get challengeStart => 'Cтарт';

  @override
  String get challengeEnd => 'Окончание';

  @override
  String get challengeParticipants => 'Участники';

  @override
  String get challengeInviteTitle => 'Пригласить участников';

  @override
  String get challengeInviteInputNameTitle => 'Введите имя';

  @override
  String get challengeInviteInputNameHint => 'Имя участника';

  @override
  String get challengeInviteGenerateLink => 'Сгенерировать ссылку';

  @override
  String get challengeParticipantsActive => 'Активные';

  @override
  String get challengeParticipantsInactive => 'Нет ответа';

  @override
  String get challengeParticipantsActiveDescription => 'Пользователи получившие приглашение и подтвердившие участие в программе';

  @override
  String get challengeParticipantsInactiveDescription => 'Пользователи, просмотревшие приглашение, но не зарегистрировавшиеся в программе';

  @override
  String participantsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'участников',
      few: 'участника',
      one: 'участник',
    );
    return '$_temp0';
  }

  @override
  String get challengeParticipantEditNameTitle => 'Изменить имя участника';

  @override
  String get areYouSureToDeleteParticipant => 'Вы уверены, что хотите удалить участника?';

  @override
  String get contactsCreateButton => 'Создать контакт';

  @override
  String get contactsImportButton => 'Импортировать контакты';

  @override
  String get contactsImportTitle => 'Импорт контактов';

  @override
  String contactsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'контактов',
      few: 'контакта',
      one: 'контакт',
    );
    return '$_temp0';
  }

  @override
  String contactsImportDuplicatesCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Найдено',
      few: 'Найдено',
      one: 'Найден',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дубликатов',
      few: '$count дубликата',
      one: '$count дубликат',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String get contactsPickTitle => 'Выберите контакт';

  @override
  String get contactsNewNoteTitle => 'Новая заметка';

  @override
  String get contactsNewNoteDate => 'Дата';

  @override
  String get contactsNewNoteTime => 'Время напоминания';

  @override
  String get contactsNewNoteContact => 'Присвоить контакту';

  @override
  String get contactsNewNoteTextHint => 'Введите текст заметки';

  @override
  String get contactsFullNoteTitle => 'Описание';

  @override
  String get contactsDeleteNoteConfirm => 'Вы уверены, что хотите удалить заметку?';

  @override
  String get contactsDeleteConfirm => 'Вы уверены, что хотите удалить контакт?';

  @override
  String get contactsNotes => 'Заметки';

  @override
  String get contactsAddNote => 'Добавить заметку';

  @override
  String get calendarTitle => 'События';

  @override
  String get calendarNoEventsTitle => 'Нет событий';

  @override
  String get calendarNoEventsDescriptionSelectEvent => 'Выберите ближайшую дату с событием';

  @override
  String get calendarNoEventsDescriptionOrNewEvent => ' или нажмите на плюс, чтобы добавить новое';

  @override
  String get calendarEventTypeNote => 'Заметка';
}
