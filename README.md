# ARZ FASTLOGIN
*Скрипт для удобного автологина в игру с поддержкой GAuth, специально для Arizona RP(G).*

## Возможности
При первом запуске игрового клиента скрипт создаст кофигурационный файл по пути moonloader/config/easylogin.ini с таким содержанием:

![alt-текст](https://me.rf0x3d.su/MTA4NzI%3D%3Ea3d3.png "Дефолтный файл")

Для начала работы требуется заполнить блок своими данными (никнейм, пароль, секретный код GAuth(если подключена защита) и название сервера, на котором зарегистрирован аккаунт(Phoenix, Mesa, Chandler, etc.))
> Скрипт умеет генерировать защитные коды GAuth, достаточно лишь указать секретный ключ. Такая процедура абсолютно безопасна, так как ключ хранится на локальном компьютере и процедура генерации происходит прямо в игре, без использования сторонних сервисов.

Поддерживается работа с несколькими аккаунтами, нужно скопировать блок настроек и изменить его номер (account1, account2, account3 etc.)

![alt-текст](https://me.rf0x3d.su/MTA4NzE%3D%3E7a9b.png "Поддержка мультиаккаунтов")

После сохранения данных, следующий вход в игру пройдет автоматически при нахождении одного из никнеймов, указанных в конфиге.

Теперь процедура логина на сервер будет проходить менее чем за одну секунду.


## Установка

- Переместить файлы в папку moonloader игрового клиента.

![alt-текст](https://me.rf0x3d.su/MTA4NzA%3D%3E297a.png "Как оно должно выглядеть в папке")

### Требования

- [Moonloader](https://blast.hk/threads/13305/)
- Библиотеки: SAMP.events, ini.cfg, sha1, basexx (уже присутствует в папке lib)

## История изменений

<dl>
  <dt>Версия 1.0</dt>
  <dd>Релиз.</dd>
</dl>

## Кредитс

Код: [Nishikinov](https://github.com/Nishikinov) ([GRPEasyLogin](https://github.com/Nishikinov/GRPEasyLogin))