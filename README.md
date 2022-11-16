# AskMe

Ruby on Rails приложение. Простейший клон популярного сервиса:

![альтернативный текст](https://casts.ask.fm/assets/logo-red-b0a3a1253b93dac3050a92d9b0c225d7f85305f13614978d6bcde7bc3219e644.png 'https://ask.fm')

Пользователи приложения (реализована регистрация) могут задавать вопросы и отвечать на вопросы других пользователей или анонимов.

### Версии Ruby и Rails:

```
ruby '3.0.1'

rails '~> 7.0.2'
```

### Реализовано в приложении:

- Авторизация пользователя без использования библиотек.

- Выбор пользователем дизайн шапки профиля.

- Аватары с помощью `gravatar`

- Применены иконки библитеки `font-awesome`

- Поиск вопросов и ответов по хэштегам.

- reCAPTCHA V2 для анонимных пользователей.

### Установка приложения:

Установите `Bundler`:

```
gem install bundler
```

Склонируйте репозиторий:

```
git clone https://github.com/goodquietly/askme.git
```

Находясь в папке с игрой `cd askme`, установите библиотеки:

```
bundle install
```

Выполните миграции БД

```
bundle exec rake db:migrate
```

### Зарегистрируйте свой сайт:

```
https://developers.google.com/recaptcha/docs/settings
```

Полученные ключи добавьте в проект в файл `.env` с содержимым(см. файл примера `.env.example`):

```
RECAPTCHA_ASKME_PUBLIC_KEY = 'your_site_key'

RECAPTCHA_ASKME_PRIVATE_KEY = 'your_private_key'
```

Запустите программу:

```
bundle exec rails s
```

В браузере перейдите по ссылке:

```
http://localhost:3000
```

Посмотреть работу приложения на [HEROKU](https://askmegp.herokuapp.com/)
