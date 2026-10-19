# Следующие шаги

## Этап 0 — Подготовка хоста
```bash
bash scripts/00-install-deps.sh
bash scripts/01-clone-research.sh
```

## Этап 1 — Root shell (самый быстрый результат)
1. Перейди в `research/darwin-vm`
2. Следуй README upstream (нужен либо Mac для get_files.sh, либо linux-порт)
3. Собери qemu-sptm
4. Запусти `./run.sh` → должен появиться root shell

## Этап 2 — Попытка iOS 14 + SpringBoard
1. Изучи Inferno / старые wiki qemu-t8030
2. Подготовь IPSW iOS 14 для t8030-устройства
3. Извлеки kernelcache + DeviceTree + ramdisk
4. Собери форк и попробуй boot

## Этап 3 — Патчи
- Отключение/заглушка SEP-related проверок
- CommCenter
- MobileKeyBag / authentication
- Software rendering fallback (QuartzCore)

## Требования к железу
- Минимум 16 ГБ RAM (лучше 32+)
- Много места на диске (IPSW + сборки QEMU)
- Желательно aarch64 host (KVM) — иначе только TCG (очень медленно)
