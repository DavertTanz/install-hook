# install-hook

Скрипт загрузки и установки хука [prepare-commit-msg](https://github.com/Davert94/prepare-commit-msg)

## Цель скрипта

Устанавливает хук _prepare-commit-msg_ в текущий репозиторий git'а.
Если до этого уже существовал данный хук, то он переименовывается в резервный (например, _prepare-commit-msg.reserve_).

## Опции

* `--out` - настройка параметра `GIT_PREPARE_COMMIT_OUT_FORMAT`
* `--template` - настройка параметра `GIT_PREPARE_COMMIT_REGEXP_BRANCH_TEMPLATE`
* `--search` - настройка параметра `GIT_PREPARE_COMMIT_REGEXP_FOR_SEARCH`

## Установка и выполнение

Пример по умолчанию:
```bash
$ cd <repository_dir>
$ wget -qO - https://raw.githubusercontent.com/Davert94/install-hook/master/install-hook.sh | bash

// Или если wget не установлен в системе
$ curl -s https://raw.githubusercontent.com/Davert94/install-hook/master/install-hook.sh | bash
```

Пример с передаваемыми параметрами:
```bash
$ cd <repository_dir>
$ wget -qO - https://raw.githubusercontent.com/Davert94/install-hook/master/install-hook.sh | bash -s -- --out="{issue #__value__}" --template="feature/\d+-?"

// Или если wget не установлен в системе
$ curl -s https://raw.githubusercontent.com/Davert94/install-hook/master/install-hook.sh | bash -s -- --out="{issue #__value__}" --template="feature/\d+-?"
```
