# Ограничения и честный взгляд

## Почему нельзя просто "сделать эмулятор iOS"

1. **Secure Enclave / SEP**  
   Криптография, ключи, biometric, Secure Boot. Полной открытой эмуляции нет.

2. **GPU + Metal**  
   С iOS 14+ software rendering сильно ограничен. Полноценный Metal → host GL/Vulkan bridge — огромная работа.

3. **Code Signing + Trust Cache + AMFI + SPTM/TXM**  
   Современные iOS очень жёстко проверяют подписи. Без патчей/подмены trust cache ничего не запускается.

4. **IOKit + проприетарные драйверы**  
   Display (IOMFB), touch, power management, cellular и т.д. — всё закрыто.

5. **Юридические риски**  
   Распространение firmware Apple — нарушение. Research на своём оборудовании — серая зона.

## Что реально можно получить open-source в 2026

- Root shell на XNU (darwin-vm) — **да**
- Отладка ядра / SPTM — **да**
- Запуск своих CLI-программ — **да**
- SpringBoard на старых iOS (14) с патчами — **частично (research)**
- Полноценный современный iPhone с UI — **нет** (только Corellium или vphone на Mac)

## Ресурсы, которые нужны для серьёзной работы

- 16–32+ ГБ RAM
- Много CPU (сборка QEMU + эмуляция)
- Предпочтительно ARM64 host
- Терпение и готовность читать исходники QEMU + XNU
