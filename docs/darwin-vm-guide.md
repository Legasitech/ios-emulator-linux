# Подробный гайд: darwin-vm (Root Shell на современном iOS)

## Что это даёт

После успешного запуска ты получаешь:

```bash
bash-5.x# whoami
root
bash-5.x# uname -a
Darwin ... xnu-... RELEASE_ARM64_T8140 ...
```

Это **настоящий** iOS kernel + минимальный userspace. Можно:
- отлаживать ядро
- патчить SPTM / TXM
- запускать свои программы
- исследовать sandbox, entitlements, dyld и т.д.

**Нет** SpringBoard, графики, Wi-Fi, камеры и т.п.

## Официальный путь (требует Mac)

1. На Mac:
   ```bash
   brew install jq ipsw
   git clone --recursive https://github.com/jprx/darwin-vm.git
   cd darwin-vm
   ./get_files.sh          # скачивает и патчит firmware
   ./fix_perms.sh firmware/ramdisk.dmg
   ./silence_logs.py firmware/bootkc   # опционально
   ```

2. Сборка QEMU:
   ```bash
   cd qemu-sptm
   mkdir build && cd build
   ../configure --target-list=aarch64-softmmu --disable-pvg
   make -j$(nproc)
   cd ../..
   ```

3. Запуск:
   ```bash
   ./run.sh
   ```

## Путь без Mac (Linux / WSL2)

Есть порт: **https://github.com/thecybersandeep/darwin-vm-windows**

Он делает подготовку firmware (APFS + codesign) на Linux с помощью linux-apfs-rw + ldid.

Рекомендуемый порядок:

```bash
# На Ubuntu 24.04 (или WSL2)
git clone https://github.com/thecybersandeep/darwin-vm-windows.git
cd darwin-vm-windows
bash scripts/install.sh
```

Скрипт сам:
- ставит зависимости
- ставит APFS-модуль
- клонирует darwin-vm
- скачивает firmware
- патчит ramdisk
- собирает QEMU

После этого можно запускать.

## Важные замечания

- По умолчанию используется iPhone 16 (iPhone17,3) + iOS 27.
- Можно менять `DEVNAME` и `URL` в `get_files.sh`.
- Для SSH смотри `TCP_TUNNELING_SSH.md` в upstream.
- На x86_64 хосте будет только TCG → очень медленно. ARM64 + KVM значительно лучше.

## Типичные ошибки

- `Path had bad ownership/permissions` → не выполнен `fix_perms.sh`
- Не хватает RAM при сборке QEMU → нужно ≥ 8–16 ГБ
- FEAT_CPA / MIE проблемы → смотри issues upstream
