# Архитектура

## Высокоуровневая схема

```
Host Linux
└── QEMU (fork)
    ├── Machine model (t8030 / darwin)
    ├── AIC, AMCC, timers, UART
    ├── Partial display (IOMFB) / framebuffer
    ├── SEP stubs
    └── KVM (если host aarch64) или TCG
        └── Guest iOS
            ├── iBoot / XNU
            ├── launchd
            └── (опционально) SpringBoard
```

## Два основных направления

### 1. darwin-vm / qemu-sptm (рекомендуется для начала)
- Цель: быстрый root shell на современных iOS (включая 26/27).
- Нет GUI.
- Хорошо для изучения XNU, dyld, launchd, патчинга.

### 2. qemu-t8030 / Inferno lineage
- Цель: iPhone 11 (A13) + iOS 14.
- Исторически доходили до SpringBoard (с патчами).
- Проект в основном архивный, требует много ручной работы.

## Критические отсутствующие компоненты
- Полноценный SEP
- GPU / Metal
- Полный trust cache + AMFI без патчей
- Многие IOKit-драйверы
