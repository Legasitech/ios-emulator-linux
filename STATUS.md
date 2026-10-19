# Статус проекта (обновляется)

**Дата:** 19 октября 2026

## GitHub Actions

- Workflow: `Build qemu-sptm (research)`
- Ссылка: https://github.com/Legasitech/ios-emulator-linux/actions
- Цель: проверить, что `qemu-sptm` компилируется на Ubuntu 24.04 runners

## Что уже есть в репо

- [x] Структура + README
- [x] Гайд по darwin-vm (root shell)
- [x] Скрипты установки зависимостей
- [x] Клонирование research-реп
- [x] GitHub Actions для сборки QEMU
- [ ] Успешная сборка qemu-sptm в CI (в процессе)
- [ ] Локальный успешный boot до root shell (нужна твоя машина)
- [ ] Попытки в сторону SpringBoard (позже)

## Следующие шаги

1. Дождаться результата CI
2. Если OOM — уменьшить параллелизм / оптимизировать workflow
3. Ты запускаешь локально `scripts/04-local-quickstart.sh`
4. При ошибках — кидаешь логи, я чиню и пушу
