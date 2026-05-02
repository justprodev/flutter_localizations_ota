import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru')
  ];

  /// No description provided for @fl_ota_version.
  ///
  /// In ru, this message translates to:
  /// **'1'**
  String get fl_ota_version;

  /// No description provided for @hasNewVersion.
  ///
  /// In ru, this message translates to:
  /// **'Есть новая версия приложения'**
  String get hasNewVersion;

  /// No description provided for @needUpdate.
  ///
  /// In ru, this message translates to:
  /// **'Для продолжения работы необходимо обновить приложение'**
  String get needUpdate;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @languageRussian.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get languageRussian;

  /// No description provided for @languageKazakh.
  ///
  /// In ru, this message translates to:
  /// **'Қазақ'**
  String get languageKazakh;

  /// No description provided for @quantity.
  ///
  /// In ru, this message translates to:
  /// **'Количество'**
  String get quantity;

  /// No description provided for @from.
  ///
  /// In ru, this message translates to:
  /// **'из'**
  String get from;

  /// No description provided for @dateFormatYearSymbol.
  ///
  /// In ru, this message translates to:
  /// **'г.'**
  String get dateFormatYearSymbol;

  /// No description provided for @daysCount.
  ///
  /// In ru, this message translates to:
  /// **'{count,plural, =1{{count} день} few{{count} дня} other{{count} дней}}'**
  String daysCount(int count);

  /// No description provided for @today.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get today;

  /// No description provided for @selectHistoryPeriod.
  ///
  /// In ru, this message translates to:
  /// **'Выберите период'**
  String get selectHistoryPeriod;

  /// No description provided for @pickerPeriodMonth.
  ///
  /// In ru, this message translates to:
  /// **'За месяц'**
  String get pickerPeriodMonth;

  /// No description provided for @pickerPeriodWeek.
  ///
  /// In ru, this message translates to:
  /// **'За неделю'**
  String get pickerPeriodWeek;

  /// No description provided for @pickerPeriod6Month.
  ///
  /// In ru, this message translates to:
  /// **'За полгода'**
  String get pickerPeriod6Month;

  /// No description provided for @pickerPeriodYear.
  ///
  /// In ru, this message translates to:
  /// **'За год'**
  String get pickerPeriodYear;

  /// No description provided for @pickerPeriod3Month.
  ///
  /// In ru, this message translates to:
  /// **'За 3 месяца'**
  String get pickerPeriod3Month;

  /// No description provided for @pickerPeriodAll.
  ///
  /// In ru, this message translates to:
  /// **'За всё время'**
  String get pickerPeriodAll;

  /// No description provided for @pickerPeriodCustom.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать период'**
  String get pickerPeriodCustom;

  /// No description provided for @selectTimezone.
  ///
  /// In ru, this message translates to:
  /// **'Укажите часовой пояс'**
  String get selectTimezone;

  /// No description provided for @version.
  ///
  /// In ru, this message translates to:
  /// **'Версия'**
  String get version;

  /// No description provided for @error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get error;

  /// No description provided for @errors.
  ///
  /// In ru, this message translates to:
  /// **'Ошибки'**
  String get errors;

  /// No description provided for @unknownError.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get unknownError;

  /// No description provided for @appNetworkError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка соединения с серверами, проверьте настройки Интернет'**
  String get appNetworkError;

  /// No description provided for @appSorryError.
  ///
  /// In ru, this message translates to:
  /// **'Извините за временные неудобства,\n мы работаем над устранением проблемы.\n Попробуйте снова'**
  String get appSorryError;

  /// No description provided for @appServiceUnavailableError.
  ///
  /// In ru, this message translates to:
  /// **'Сервис временно недоступен'**
  String get appServiceUnavailableError;

  /// No description provided for @appServiceTooManyRequestsError.
  ///
  /// In ru, this message translates to:
  /// **'Слишком много запросов, попробуйте позднее'**
  String get appServiceTooManyRequestsError;

  /// No description provided for @appClientClosedRequestError.
  ///
  /// In ru, this message translates to:
  /// **'Запрос не удался. Попробуйте еще раз'**
  String get appClientClosedRequestError;

  /// No description provided for @appNotFoundError.
  ///
  /// In ru, this message translates to:
  /// **'Не найдено'**
  String get appNotFoundError;

  /// No description provided for @appUserNotFoundError.
  ///
  /// In ru, this message translates to:
  /// **'Пользователь не найден'**
  String get appUserNotFoundError;

  /// No description provided for @appUserNotLoggedInError.
  ///
  /// In ru, this message translates to:
  /// **'Пользователь не авторизован'**
  String get appUserNotLoggedInError;

  /// No description provided for @loginError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка авторизации'**
  String get loginError;

  /// No description provided for @loginWrongPassword.
  ///
  /// In ru, this message translates to:
  /// **'Неверное имя пользователя или пароль'**
  String get loginWrongPassword;

  /// No description provided for @bonusError.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось загрузить бонусы'**
  String get bonusError;

  /// No description provided for @contactsImportDuplicatesError.
  ///
  /// In ru, this message translates to:
  /// **'При импорте контактов с вашего устройства система нашла дубликаты с совпадающим номером телефона'**
  String get contactsImportDuplicatesError;

  /// No description provided for @buttonWrite.
  ///
  /// In ru, this message translates to:
  /// **'Написать'**
  String get buttonWrite;

  /// No description provided for @buttonSave.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get buttonSave;

  /// No description provided for @buttonLater.
  ///
  /// In ru, this message translates to:
  /// **'Позже'**
  String get buttonLater;

  /// No description provided for @buttonSkip.
  ///
  /// In ru, this message translates to:
  /// **'Пропустить'**
  String get buttonSkip;

  /// No description provided for @buttonOnward.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get buttonOnward;

  /// No description provided for @buttonGotoMain.
  ///
  /// In ru, this message translates to:
  /// **'На главную'**
  String get buttonGotoMain;

  /// No description provided for @buttonLogin.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get buttonLogin;

  /// No description provided for @buttonLogout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get buttonLogout;

  /// No description provided for @buttonRegistration.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get buttonRegistration;

  /// No description provided for @infoRegistration.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрируйтесь на сайте,\n вернитесь в приложение и выполните вход'**
  String get infoRegistration;

  /// No description provided for @areYouSureToLogout.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите выйти?'**
  String get areYouSureToLogout;

  /// No description provided for @buttonForgotPassword.
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль?'**
  String get buttonForgotPassword;

  /// No description provided for @buttonDetails.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get buttonDetails;

  /// No description provided for @wait.
  ///
  /// In ru, this message translates to:
  /// **'Подождите ...'**
  String get wait;

  /// No description provided for @buttonOk.
  ///
  /// In ru, this message translates to:
  /// **'Ok'**
  String get buttonOk;

  /// No description provided for @buttonCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get buttonCancel;

  /// No description provided for @buttonApply.
  ///
  /// In ru, this message translates to:
  /// **'Применить'**
  String get buttonApply;

  /// No description provided for @buttonConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get buttonConfirm;

  /// No description provided for @buttonReset.
  ///
  /// In ru, this message translates to:
  /// **'Сбросить'**
  String get buttonReset;

  /// No description provided for @buttonApprove.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get buttonApprove;

  /// No description provided for @buttonSelect.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать'**
  String get buttonSelect;

  /// No description provided for @buttonSelectAll.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать все'**
  String get buttonSelectAll;

  /// No description provided for @editing.
  ///
  /// In ru, this message translates to:
  /// **'Редактирование'**
  String get editing;

  /// No description provided for @buttonEdit.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать'**
  String get buttonEdit;

  /// No description provided for @buttonContinue.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get buttonContinue;

  /// No description provided for @buttonTry.
  ///
  /// In ru, this message translates to:
  /// **'Попробовать'**
  String get buttonTry;

  /// No description provided for @buttonChange.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get buttonChange;

  /// No description provided for @buttonRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get buttonRetry;

  /// No description provided for @buttonShare.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться'**
  String get buttonShare;

  /// No description provided for @buttonUse.
  ///
  /// In ru, this message translates to:
  /// **'Использовать'**
  String get buttonUse;

  /// No description provided for @buttonView.
  ///
  /// In ru, this message translates to:
  /// **'Смотреть'**
  String get buttonView;

  /// No description provided for @buttonLook.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть'**
  String get buttonLook;

  /// No description provided for @buttonCall.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить'**
  String get buttonCall;

  /// No description provided for @buttonInstall.
  ///
  /// In ru, this message translates to:
  /// **'Установить'**
  String get buttonInstall;

  /// No description provided for @buttonOrder.
  ///
  /// In ru, this message translates to:
  /// **'Заказать'**
  String get buttonOrder;

  /// No description provided for @buttonCreate.
  ///
  /// In ru, this message translates to:
  /// **'Создать'**
  String get buttonCreate;

  /// No description provided for @buttonAdd.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get buttonAdd;

  /// No description provided for @buttonRename.
  ///
  /// In ru, this message translates to:
  /// **'Переименовать'**
  String get buttonRename;

  /// No description provided for @buttonDelete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get buttonDelete;

  /// No description provided for @buttonClose.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get buttonClose;

  /// No description provided for @buttonGoto.
  ///
  /// In ru, this message translates to:
  /// **'Перейти'**
  String get buttonGoto;

  /// No description provided for @buttonLoginBiometry.
  ///
  /// In ru, this message translates to:
  /// **'Войти с помощью биометрии'**
  String get buttonLoginBiometry;

  /// No description provided for @buttonBook.
  ///
  /// In ru, this message translates to:
  /// **'Оформить'**
  String get buttonBook;

  /// No description provided for @buttonLike.
  ///
  /// In ru, this message translates to:
  /// **'Нравится'**
  String get buttonLike;

  /// No description provided for @buttonShow.
  ///
  /// In ru, this message translates to:
  /// **'Показать'**
  String get buttonShow;

  /// No description provided for @buttonShowAll.
  ///
  /// In ru, this message translates to:
  /// **'Показать все'**
  String get buttonShowAll;

  /// No description provided for @buttonSend.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get buttonSend;

  /// No description provided for @buttonUpdate.
  ///
  /// In ru, this message translates to:
  /// **'Обновить'**
  String get buttonUpdate;

  /// No description provided for @buttonDownload.
  ///
  /// In ru, this message translates to:
  /// **'Скачать'**
  String get buttonDownload;

  /// No description provided for @buttonMore.
  ///
  /// In ru, this message translates to:
  /// **'Еще...'**
  String get buttonMore;

  /// No description provided for @updated.
  ///
  /// In ru, this message translates to:
  /// **'Обновлен'**
  String get updated;

  /// No description provided for @buttonAnywayContinue.
  ///
  /// In ru, this message translates to:
  /// **'Всё равно продолжить'**
  String get buttonAnywayContinue;

  /// No description provided for @buttonListen.
  ///
  /// In ru, this message translates to:
  /// **'Слушать'**
  String get buttonListen;

  /// No description provided for @buttonOpen.
  ///
  /// In ru, this message translates to:
  /// **'Открыть'**
  String get buttonOpen;

  /// No description provided for @buttonClear.
  ///
  /// In ru, this message translates to:
  /// **'Очистить'**
  String get buttonClear;

  /// No description provided for @buttonStart.
  ///
  /// In ru, this message translates to:
  /// **'Запустить'**
  String get buttonStart;

  /// No description provided for @buttonYes.
  ///
  /// In ru, this message translates to:
  /// **'Да'**
  String get buttonYes;

  /// No description provided for @buttonNo.
  ///
  /// In ru, this message translates to:
  /// **'Нет'**
  String get buttonNo;

  /// No description provided for @buttonInvite.
  ///
  /// In ru, this message translates to:
  /// **'Пригласить'**
  String get buttonInvite;

  /// No description provided for @buttonKnowMore.
  ///
  /// In ru, this message translates to:
  /// **'Узнать больше'**
  String get buttonKnowMore;

  /// No description provided for @buttonImport.
  ///
  /// In ru, this message translates to:
  /// **'Импортировать'**
  String get buttonImport;

  /// No description provided for @buttonCancelMarathon.
  ///
  /// In ru, this message translates to:
  /// **'Отменить программу'**
  String get buttonCancelMarathon;

  /// No description provided for @month.
  ///
  /// In ru, this message translates to:
  /// **'месяц'**
  String get month;

  /// No description provided for @year.
  ///
  /// In ru, this message translates to:
  /// **'год'**
  String get year;

  /// No description provided for @weekend.
  ///
  /// In ru, this message translates to:
  /// **'Выходной'**
  String get weekend;

  /// No description provided for @time.
  ///
  /// In ru, this message translates to:
  /// **'Время'**
  String get time;

  /// No description provided for @otpSmsTitle.
  ///
  /// In ru, this message translates to:
  /// **'SMS подтверждение'**
  String get otpSmsTitle;

  /// No description provided for @otpSmsText.
  ///
  /// In ru, this message translates to:
  /// **'Введите 4 цифры которые были отправлены на номер {number}'**
  String otpSmsText(String number);

  /// No description provided for @otpWrongSmsCode.
  ///
  /// In ru, this message translates to:
  /// **'Вы ввели неверный код из SMS'**
  String get otpWrongSmsCode;

  /// No description provided for @otpNoCode.
  ///
  /// In ru, this message translates to:
  /// **'Не пришел код? '**
  String get otpNoCode;

  /// No description provided for @otpRepeatCode.
  ///
  /// In ru, this message translates to:
  /// **'Отправить повторно'**
  String get otpRepeatCode;

  /// No description provided for @otpAllowRepeatCode.
  ///
  /// In ru, this message translates to:
  /// **'через {count} сек.'**
  String otpAllowRepeatCode(String count);

  /// No description provided for @clipboardCopy.
  ///
  /// In ru, this message translates to:
  /// **'Скопировано в буфер обмена'**
  String get clipboardCopy;

  /// No description provided for @tabHomeLabel.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get tabHomeLabel;

  /// No description provided for @tabProfileLabel.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get tabProfileLabel;

  /// No description provided for @tabProgramsLabel.
  ///
  /// In ru, this message translates to:
  /// **'Библиотека программ'**
  String get tabProgramsLabel;

  /// No description provided for @tabContentLibraryLabel.
  ///
  /// In ru, this message translates to:
  /// **'Библиотека контента'**
  String get tabContentLibraryLabel;

  /// No description provided for @tabContactsLabel.
  ///
  /// In ru, this message translates to:
  /// **'Контакты'**
  String get tabContactsLabel;

  /// No description provided for @tabCalendarLabel.
  ///
  /// In ru, this message translates to:
  /// **'Календарь'**
  String get tabCalendarLabel;

  /// No description provided for @loginTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выполните вход'**
  String get loginTitle;

  /// No description provided for @loginDescription.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы получить доступ ко всем функциям'**
  String get loginDescription;

  /// No description provided for @searchNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get searchNotFound;

  /// No description provided for @searchFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get searchFieldHint;

  /// No description provided for @notificationDefaultChannelName.
  ///
  /// In ru, this message translates to:
  /// **'Основные уведомления'**
  String get notificationDefaultChannelName;

  /// No description provided for @notificationDefaultChannelDescription.
  ///
  /// In ru, this message translates to:
  /// **'Вы можете настроить уведомления в профиле'**
  String get notificationDefaultChannelDescription;

  /// No description provided for @notificationsCount.
  ///
  /// In ru, this message translates to:
  /// **'{count,plural, =1{уведомление} few{уведомления} other{уведомлений}}'**
  String notificationsCount(num count);

  /// No description provided for @libraryCategories.
  ///
  /// In ru, this message translates to:
  /// **'Категории'**
  String get libraryCategories;

  /// No description provided for @libraryFilesGroup.
  ///
  /// In ru, this message translates to:
  /// **'Файлы'**
  String get libraryFilesGroup;

  /// No description provided for @libraryVideoGroup.
  ///
  /// In ru, this message translates to:
  /// **'Видео'**
  String get libraryVideoGroup;

  /// No description provided for @libraryAudioGroup.
  ///
  /// In ru, this message translates to:
  /// **'Аудио'**
  String get libraryAudioGroup;

  /// No description provided for @libraryFilters.
  ///
  /// In ru, this message translates to:
  /// **'Фильтры'**
  String get libraryFilters;

  /// No description provided for @libraryCategoriesAll.
  ///
  /// In ru, this message translates to:
  /// **'Все категории'**
  String get libraryCategoriesAll;

  /// No description provided for @libraryResults.
  ///
  /// In ru, this message translates to:
  /// **'Результаты'**
  String get libraryResults;

  /// No description provided for @libraryLanguagesAll.
  ///
  /// In ru, this message translates to:
  /// **'Все языки'**
  String get libraryLanguagesAll;

  /// No description provided for @programRecommendations.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендации'**
  String get programRecommendations;

  /// No description provided for @programComposition.
  ///
  /// In ru, this message translates to:
  /// **'Состав программы'**
  String get programComposition;

  /// No description provided for @programDay.
  ///
  /// In ru, this message translates to:
  /// **'День'**
  String get programDay;

  /// No description provided for @programStart.
  ///
  /// In ru, this message translates to:
  /// **'Запуск программы'**
  String get programStart;

  /// No description provided for @programCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена программы'**
  String get programCancel;

  /// No description provided for @programAreYouSureToCancel.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите отменить программу?'**
  String get programAreYouSureToCancel;

  /// No description provided for @programActionTypePost.
  ///
  /// In ru, this message translates to:
  /// **'Пост'**
  String get programActionTypePost;

  /// No description provided for @programActionTypeInstruction.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендация для организатора'**
  String get programActionTypeInstruction;

  /// No description provided for @programSelectDateTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выберите дату'**
  String get programSelectDateTitle;

  /// No description provided for @programSelectDateDescription.
  ///
  /// In ru, this message translates to:
  /// **'Укажите дату начала программы.\nОранжевым будут отображены дни подготовки.'**
  String get programSelectDateDescription;

  /// No description provided for @programStartPublicationTitle.
  ///
  /// In ru, this message translates to:
  /// **'Публикация постов'**
  String get programStartPublicationTitle;

  /// No description provided for @programStartPublicationAutoDescription.
  ///
  /// In ru, this message translates to:
  /// **'Контент программы публикуется автоматически в отдельном telegram-канале'**
  String get programStartPublicationAutoDescription;

  /// No description provided for @programStartPublicationManualDescription.
  ///
  /// In ru, this message translates to:
  /// **'Контент программы публикуется самостоятельно'**
  String get programStartPublicationManualDescription;

  /// No description provided for @programStartPublicationTypeAuto.
  ///
  /// In ru, this message translates to:
  /// **'Автоматическая публикация'**
  String get programStartPublicationTypeAuto;

  /// No description provided for @programAutoMarathonTitle.
  ///
  /// In ru, this message translates to:
  /// **'Телеграм-бот'**
  String get programAutoMarathonTitle;

  /// No description provided for @programAutoDescription.
  ///
  /// In ru, this message translates to:
  /// **'Вы выбрали программу с публикацией контента  автоматически. Посты будут размещаться системой через телеграм-бот.'**
  String get programAutoDescription;

  /// No description provided for @programInviteToMarathonButton.
  ///
  /// In ru, this message translates to:
  /// **'Пригласить участников'**
  String get programInviteToMarathonButton;

  /// No description provided for @programManualMarathonTitle.
  ///
  /// In ru, this message translates to:
  /// **'Публикация контента'**
  String get programManualMarathonTitle;

  /// No description provided for @programManualMarathonDescription.
  ///
  /// In ru, this message translates to:
  /// **'Вы выбрали программу с публикацией контента самостоятельно. Не забывайте ежедневно размещать посты для участников.'**
  String get programManualMarathonDescription;

  /// No description provided for @programManualMarathonComplete.
  ///
  /// In ru, this message translates to:
  /// **'Пост опубликован'**
  String get programManualMarathonComplete;

  /// No description provided for @programPreparingPostForSharing.
  ///
  /// In ru, this message translates to:
  /// **'Подготовка поста для публикации ...'**
  String get programPreparingPostForSharing;

  /// No description provided for @programViewProgramsButton.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть программы'**
  String get programViewProgramsButton;

  /// No description provided for @savingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сохранение'**
  String get savingTitle;

  /// No description provided for @downloadError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки'**
  String get downloadError;

  /// No description provided for @downloading.
  ///
  /// In ru, this message translates to:
  /// **'Скачивание'**
  String get downloading;

  /// No description provided for @downloaded.
  ///
  /// In ru, this message translates to:
  /// **'Скачано'**
  String get downloaded;

  /// No description provided for @files.
  ///
  /// In ru, this message translates to:
  /// **'{count,plural, =1{файла} few{файлов} other{файлов}}'**
  String files(int count);

  /// No description provided for @homeGuestHeaderTitle.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать!'**
  String get homeGuestHeaderTitle;

  /// No description provided for @homeGuestHeaderText.
  ///
  /// In ru, this message translates to:
  /// **'Присоединяйтесь к Amway Start, чтобы делиться контентом и улучшать навыки маркетинга'**
  String get homeGuestHeaderText;

  /// No description provided for @profilePhoneNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get profilePhoneNumber;

  /// No description provided for @profileEmail.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// No description provided for @profileEmailWrong.
  ///
  /// In ru, this message translates to:
  /// **'Неверный формат email'**
  String get profileEmailWrong;

  /// No description provided for @profileCity.
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get profileCity;

  /// No description provided for @profileAmwayNumber.
  ///
  /// In ru, this message translates to:
  /// **'Номер Amway'**
  String get profileAmwayNumber;

  /// No description provided for @profileBirthday.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get profileBirthday;

  /// No description provided for @profileStatus.
  ///
  /// In ru, this message translates to:
  /// **'Статус'**
  String get profileStatus;

  /// No description provided for @profilePickStatus.
  ///
  /// In ru, this message translates to:
  /// **'Выберите статус'**
  String get profilePickStatus;

  /// No description provided for @profileHobbies.
  ///
  /// In ru, this message translates to:
  /// **'Интересы'**
  String get profileHobbies;

  /// No description provided for @profilePickHobbies.
  ///
  /// In ru, this message translates to:
  /// **'Выберите интересы'**
  String get profilePickHobbies;

  /// No description provided for @profileConnectUs.
  ///
  /// In ru, this message translates to:
  /// **'Свяжитесь с нами'**
  String get profileConnectUs;

  /// No description provided for @profileHelpAndSupport.
  ///
  /// In ru, this message translates to:
  /// **'Помощь и поддержка'**
  String get profileHelpAndSupport;

  /// No description provided for @profileAboutApp.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get profileAboutApp;

  /// No description provided for @profileLegalInfo.
  ///
  /// In ru, this message translates to:
  /// **'Юридическая информация'**
  String get profileLegalInfo;

  /// No description provided for @profileProductInfo.
  ///
  /// In ru, this message translates to:
  /// **'Информация о продукте'**
  String get profileProductInfo;

  /// No description provided for @profileUseConditions.
  ///
  /// In ru, this message translates to:
  /// **'Условия использования'**
  String get profileUseConditions;

  /// No description provided for @profilePrivacyPolicy.
  ///
  /// In ru, this message translates to:
  /// **'Политика конфиденциальности'**
  String get profilePrivacyPolicy;

  /// No description provided for @profileMakePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Сделать фото'**
  String get profileMakePhoto;

  /// No description provided for @profilePickPhoto.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из галереи'**
  String get profilePickPhoto;

  /// No description provided for @profileFirstName.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get profileFirstName;

  /// No description provided for @profileLastName.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get profileLastName;

  /// No description provided for @profileAboutText1.
  ///
  /// In ru, this message translates to:
  /// **'Amway Start — это официальное приложение от Компании Amway. В него включена обширная база знаний и методик, а также интерактивные инструменты для построения успешного индивидуального бизнеса. Здесь вы можете обучаться сами, собирать клиентскую базу и помогать развиваться партнерам.'**
  String get profileAboutText1;

  /// No description provided for @profileAboutTitle2.
  ///
  /// In ru, this message translates to:
  /// **'С приложением Amway Start вы сможете:'**
  String get profileAboutTitle2;

  /// No description provided for @profileAboutText2.
  ///
  /// In ru, this message translates to:
  /// **'• Освоить принципы построения индивидуального бизнеса\n• Получить полезные знания в смежных сферах: диджитал-маркетинг, коммуникация, организация мероприятий\n• Проверить свои собственные знания с помощью заданий и тестов\n• Собрать интерактивную базу контактов клинетов и партнеров'**
  String get profileAboutText2;

  /// No description provided for @profileAboutText3.
  ///
  /// In ru, this message translates to:
  /// **'Для зарегистрированных пользователей открывается возможность углубленного изучения с помощью обучающих материалов на портале\nRubilix от Amway Академии. Со временем функционал приложения будет расширяться и включать в себя новые инструменты, полезные в формировании индивидуального бизнеса.'**
  String get profileAboutText3;

  /// No description provided for @profileView.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть профиль'**
  String get profileView;

  /// No description provided for @profileDelete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт из приложения'**
  String get profileDelete;

  /// No description provided for @profileDeleteConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Ваши личные данные будут полностью удалены с устройства.\n\nДля удаления личных данных с сервера обратитесь в службу поддержки\nhttps://www.kz.amway.com/contact-us\n'**
  String get profileDeleteConfirm;

  /// No description provided for @instruments.
  ///
  /// In ru, this message translates to:
  /// **'Инструменты'**
  String get instruments;

  /// No description provided for @instrumentsIncomeCalculatorTitle.
  ///
  /// In ru, this message translates to:
  /// **'Калькулятор дохода и структуры'**
  String get instrumentsIncomeCalculatorTitle;

  /// No description provided for @instrumentsIncomeCalculatorButton.
  ///
  /// In ru, this message translates to:
  /// **'Рассчитать доход'**
  String get instrumentsIncomeCalculatorButton;

  /// No description provided for @instrumentsRubilixTitle.
  ///
  /// In ru, this message translates to:
  /// **'Amway Academy'**
  String get instrumentsRubilixTitle;

  /// No description provided for @instrumentsRubilixText.
  ///
  /// In ru, this message translates to:
  /// **'Онлайн обучение'**
  String get instrumentsRubilixText;

  /// No description provided for @challengesCollapsedTitle.
  ///
  /// In ru, this message translates to:
  /// **'Активно'**
  String get challengesCollapsedTitle;

  /// No description provided for @programs.
  ///
  /// In ru, this message translates to:
  /// **'{count,plural, =1{программа} few{программы} other{программ}}'**
  String programs(num count);

  /// No description provided for @myPrograms.
  ///
  /// In ru, this message translates to:
  /// **'Мои программы'**
  String get myPrograms;

  /// No description provided for @challengesActive.
  ///
  /// In ru, this message translates to:
  /// **'Активные'**
  String get challengesActive;

  /// No description provided for @challengesArchived.
  ///
  /// In ru, this message translates to:
  /// **'Архив'**
  String get challengesArchived;

  /// No description provided for @challengesArchivedEmpty.
  ///
  /// In ru, this message translates to:
  /// **'У вас нет завершенных программ'**
  String get challengesArchivedEmpty;

  /// No description provided for @challengesActiveEmpty.
  ///
  /// In ru, this message translates to:
  /// **'У вас нет запущенных программ'**
  String get challengesActiveEmpty;

  /// No description provided for @challengePublicationTypeAuto.
  ///
  /// In ru, this message translates to:
  /// **'Авто'**
  String get challengePublicationTypeAuto;

  /// No description provided for @challengePublicationTypeManual.
  ///
  /// In ru, this message translates to:
  /// **'Вручную'**
  String get challengePublicationTypeManual;

  /// No description provided for @challengeStatusFinished.
  ///
  /// In ru, this message translates to:
  /// **'Завершено'**
  String get challengeStatusFinished;

  /// No description provided for @challengeStart.
  ///
  /// In ru, this message translates to:
  /// **'Cтарт'**
  String get challengeStart;

  /// No description provided for @challengeEnd.
  ///
  /// In ru, this message translates to:
  /// **'Окончание'**
  String get challengeEnd;

  /// No description provided for @challengeParticipants.
  ///
  /// In ru, this message translates to:
  /// **'Участники'**
  String get challengeParticipants;

  /// No description provided for @challengeInviteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Пригласить участников'**
  String get challengeInviteTitle;

  /// No description provided for @challengeInviteInputNameTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите имя'**
  String get challengeInviteInputNameTitle;

  /// No description provided for @challengeInviteInputNameHint.
  ///
  /// In ru, this message translates to:
  /// **'Имя участника'**
  String get challengeInviteInputNameHint;

  /// No description provided for @challengeInviteGenerateLink.
  ///
  /// In ru, this message translates to:
  /// **'Сгенерировать ссылку'**
  String get challengeInviteGenerateLink;

  /// No description provided for @challengeParticipantsActive.
  ///
  /// In ru, this message translates to:
  /// **'Активные'**
  String get challengeParticipantsActive;

  /// No description provided for @challengeParticipantsInactive.
  ///
  /// In ru, this message translates to:
  /// **'Нет ответа'**
  String get challengeParticipantsInactive;

  /// No description provided for @challengeParticipantsActiveDescription.
  ///
  /// In ru, this message translates to:
  /// **'Пользователи получившие приглашение и подтвердившие участие в программе'**
  String get challengeParticipantsActiveDescription;

  /// No description provided for @challengeParticipantsInactiveDescription.
  ///
  /// In ru, this message translates to:
  /// **'Пользователи, просмотревшие приглашение, но не зарегистрировавшиеся в программе'**
  String get challengeParticipantsInactiveDescription;

  /// No description provided for @participantsCount.
  ///
  /// In ru, this message translates to:
  /// **'{count,plural, =1{участник} few{участника} other{участников}}'**
  String participantsCount(num count);

  /// No description provided for @challengeParticipantEditNameTitle.
  ///
  /// In ru, this message translates to:
  /// **'Изменить имя участника'**
  String get challengeParticipantEditNameTitle;

  /// No description provided for @areYouSureToDeleteParticipant.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить участника?'**
  String get areYouSureToDeleteParticipant;

  /// No description provided for @contactsCreateButton.
  ///
  /// In ru, this message translates to:
  /// **'Создать контакт'**
  String get contactsCreateButton;

  /// No description provided for @contactsImportButton.
  ///
  /// In ru, this message translates to:
  /// **'Импортировать контакты'**
  String get contactsImportButton;

  /// No description provided for @contactsImportTitle.
  ///
  /// In ru, this message translates to:
  /// **'Импорт контактов'**
  String get contactsImportTitle;

  /// No description provided for @contactsCount.
  ///
  /// In ru, this message translates to:
  /// **'{count,plural, =1{контакт} few{контакта} other{контактов}}'**
  String contactsCount(num count);

  /// No description provided for @contactsImportDuplicatesCount.
  ///
  /// In ru, this message translates to:
  /// **'{count,plural, =1{Найден} few{Найдено} other{Найдено}} {count,plural, =1{{count} дубликат} few{{count} дубликата} other{{count} дубликатов}}'**
  String contactsImportDuplicatesCount(num count);

  /// No description provided for @contactsPickTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выберите контакт'**
  String get contactsPickTitle;

  /// No description provided for @contactsNewNoteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новая заметка'**
  String get contactsNewNoteTitle;

  /// No description provided for @contactsNewNoteDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get contactsNewNoteDate;

  /// No description provided for @contactsNewNoteTime.
  ///
  /// In ru, this message translates to:
  /// **'Время напоминания'**
  String get contactsNewNoteTime;

  /// No description provided for @contactsNewNoteContact.
  ///
  /// In ru, this message translates to:
  /// **'Присвоить контакту'**
  String get contactsNewNoteContact;

  /// No description provided for @contactsNewNoteTextHint.
  ///
  /// In ru, this message translates to:
  /// **'Введите текст заметки'**
  String get contactsNewNoteTextHint;

  /// No description provided for @contactsFullNoteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get contactsFullNoteTitle;

  /// No description provided for @contactsDeleteNoteConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить заметку?'**
  String get contactsDeleteNoteConfirm;

  /// No description provided for @contactsDeleteConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить контакт?'**
  String get contactsDeleteConfirm;

  /// No description provided for @contactsNotes.
  ///
  /// In ru, this message translates to:
  /// **'Заметки'**
  String get contactsNotes;

  /// No description provided for @contactsAddNote.
  ///
  /// In ru, this message translates to:
  /// **'Добавить заметку'**
  String get contactsAddNote;

  /// No description provided for @calendarTitle.
  ///
  /// In ru, this message translates to:
  /// **'События'**
  String get calendarTitle;

  /// No description provided for @calendarNoEventsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Нет событий'**
  String get calendarNoEventsTitle;

  /// No description provided for @calendarNoEventsDescriptionSelectEvent.
  ///
  /// In ru, this message translates to:
  /// **'Выберите ближайшую дату с событием'**
  String get calendarNoEventsDescriptionSelectEvent;

  /// No description provided for @calendarNoEventsDescriptionOrNewEvent.
  ///
  /// In ru, this message translates to:
  /// **' или нажмите на плюс, чтобы добавить новое'**
  String get calendarNoEventsDescriptionOrNewEvent;

  /// No description provided for @calendarEventTypeNote.
  ///
  /// In ru, this message translates to:
  /// **'Заметка'**
  String get calendarEventTypeNote;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return L10nRu();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
