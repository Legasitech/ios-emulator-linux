# iOS Emulator on Linux — Research Starter

**Цель**: максимально приблизиться к запуску настоящей iOS (IPSW → kernel → userspace → по возможности SpringBoard) на Linux с помощью QEMU.

> Это **не** готовый эмулятор. Это каркас + план + скрипты под существующие открытые research-проекты.
> Полноценный SpringBoard + Metal на чистом Linux в 2026 году всё ещё research-уровень.

## Реалистичный статус (октябрь 2026)

| Цель | Статус |
|------|--------|
| Boot kernel + root shell | Достижимо (darwin-vm / qemu-sptm) |
| Restore IPSW | Частично (qemu-t8030 era) |
| SpringBoard + базовый UI | Было достигнуто в research (eShard + t8030, iOS 14) с тяжёлыми патчами |
| Metal / нормальная графика | Практически нет в open-source |
| Современный iOS 16–27 GUI | Только коммерческие решения (Corellium) или macOS-only (vphone) |

### Рекомендуемый путь
1. **Быстрый результат (root shell)** — `jprx/darwin-vm` + `qemu-sptm`
2. **Попытка до SpringBoard** — форки `qemu-t8030` / Inferno (iOS 14, t8030)

## Структура репозитория

```
ios-emulator-linux/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── known-projects.md
│   └── next-steps.md
├── scripts/
│   ├── 00-install-deps.sh
│   ├── 01-clone-research.sh
│   └── 02-extract-ipsw.sh
└── LICENSE
```

## Быстрый старт

```bash
# 1. Зависимости
bash scripts/00-install-deps.sh

# 2. Клонируем ключевые research-репозитории
bash scripts/01-clone-research.sh

# 3. Дальше — читай docs/next-steps.md
```

**Важно**:
- Ты сам должен предоставить свой IPSW (легально).
- Подготовка firmware для darwin-vm исторически требует Mac (или linux-apfs + ldid костыли).
- Для серьёзной работы нужно минимум 16 ГБ RAM, лучше ARM64-хост.

## Лицензия

MIT (только на код этого репозитория). Firmware Apple — собственность Apple.
