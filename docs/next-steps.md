# План дальнейшей работы

## Этап 1 — Root Shell (делать первым)
1. Установить зависимости (`scripts/00-install-deps.sh`)
2. Клонировать research (`scripts/01-clone-research.sh`)
3. Пройти `docs/darwin-vm-guide.md`
4. Получить работающий root shell

## Этап 2 — Кастомизация
- Добавить свои бинарники в ramdisk
- Патчить kernel / SPTM
- Настроить SSH over UART
- Исследовать dyld shared cache

## Этап 3 — Попытка графики (сложно)
- Изучить Inferno / qemu-t8030
- Попробовать iOS 14 на t8030
- Смотреть eShard writeups по SpringBoard
- Патчить QuartzCore / отключать Metal-зависимости

## Этап 4 — Долгосрочные цели
- Улучшение display-эмуляции
- Input (touch)
- Networking
- Более полный userspace

## Что можно делать прямо в этом репозитории

Пиши задачи — я буду добавлять скрипты, документацию и разборы ошибок сюда.
