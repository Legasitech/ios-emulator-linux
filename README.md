# iOS Emulator on Linux — Research Framework

**Цель проекта**: максимально близко подойти к запуску настоящей iOS на Linux (IPSW → XNU → userspace → по возможности SpringBoard).

> **Это research-проект, а не готовый эмулятор.**  
> Полноценный SpringBoard + Metal + сенсоры на чистом Linux в октябре 2026 всё ещё не существует в open-source.  
> Самое реальное, что можно получить сейчас — **root shell** на настоящем iOS-ядре (включая iOS 27).

Репозиторий: https://github.com/Legasitech/ios-emulator-linux

## Текущий реалистичный статус (19 октября 2026)

| Цель                              | Статус                                      | Лучший путь                  |
|-----------------------------------|---------------------------------------------|------------------------------|
| Boot kernel + root shell          | **Достижимо**                               | jprx/darwin-vm + qemu-sptm  |
| Современный iOS 26/27             | Да (shell)                                  | darwin-vm                   |
| Restore полного IPSW              | Частично (старые проекты)                   | qemu-t8030 / Inferno        |
| SpringBoard + базовый UI          | Research (было на iOS 14)                   | eShard + t8030 патчи        |
| Metal / нормальная графика        | Практически нет                             | —                           |
| Полноценный GUI iOS 16+           | Только Corellium / vphone (macOS)           | —                           |

## Рекомендуемый путь прямо сейчас

### 1. Самый быстрый и полезный результат — Root Shell
Используй **jprx/darwin-vm**.

Плюсы:
- Работает на самых свежих iOS (включая 27)
- Root shell за несколько секунд
- Можно патчить kernel, SPTM, dyld, launchd
- Можно запускать свои бинарники

Минусы:
- Нет графики / SpringBoard / touch
- Подготовка firmware официально требует Mac (есть Linux/WSL-порт)

### 2. Попытка до SpringBoard
Форки **qemu-t8030** / **Inferno** (iPhone 11 / A13 + iOS 14).  
Исторически eShard доводили до SpringBoard, но с тяжёлыми патчами и software-рендерингом.

## Структура репозитория

```
ios-emulator-linux/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── known-projects.md
│   ├── darwin-vm-guide.md      ← подробный гайд
│   ├── limitations.md
│   └── next-steps.md
├── scripts/
│   ├── 00-install-deps.sh
│   ├── 01-clone-research.sh
│   ├── 02-extract-ipsw.sh
│   └── 03-build-qemu-sptm.sh
└── LICENSE
```

## Быстрый старт (на нормальной машине)

**Требования:**
- Linux (Ubuntu 22.04/24.04 предпочтительно)
- **минимум 16 ГБ RAM** (лучше 32+)
- 20+ ГБ свободного места
- Желательно aarch64-хост (KVM), иначе только TCG (очень медленно)

```bash
git clone https://github.com/Legasitech/ios-emulator-linux.git
cd ios-emulator-linux

bash scripts/00-install-deps.sh
bash scripts/01-clone-research.sh

# Дальше читай:
# docs/darwin-vm-guide.md
# docs/next-steps.md
```

## Важно про авторские права

- Этот репозиторий содержит **только** скрипты, документацию и обвязку.
- Firmware Apple (IPSW, kernelcache, ramdisk и т.д.) — собственность Apple.
- Скачивай и используй только то, на что у тебя есть законное право.

## Что я (Grok) могу делать дальше в этом репо

- Добавлять скрипты и улучшения
- Писать подробные гайды по патчам
- Разбирать конкретные ошибки boot
- Помогать с обвязкой под Linux

Пиши, что делать следующим шагом.
