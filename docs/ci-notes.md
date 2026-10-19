# GitHub Actions / CI notes

В репозитории есть workflow `.github/workflows/build-qemu.yml`.

## Что он делает

1. Ставит зависимости на `ubuntu-24.04`
2. Клонирует `jprx/qemu-sptm`
3. Делает `./configure --target-list=aarch64-softmmu --disable-pvg`
4. Пытается собрать (`make -j2`)
5. Если получилось — заливает `qemu-system-aarch64` как artifact

## Как запустить вручную

1. Зайди в репозиторий → вкладка **Actions**
2. Выбери workflow **Build qemu-sptm (research)**
3. Нажми **Run workflow**

Или просто сделай push в `main` (скрипты / workflow).

## Ограничения free GitHub runners

- ~7 ГБ RAM
- Сборка полного QEMU часто падает по OOM
- Даже если бинарник соберётся, **firmware (IPSW / ramdisk / bootkc)** в CI мы не качаем и не патчим — это против правил и требует много места + легальных прав

Поэтому CI — только проверка, что QEMU-форк вообще компилируется. Полноценный boot iOS делается у тебя локально.
