:: -g generate debug information
:: -c compile only
cls
"D:\Arduino\arduino_1.8.3\hardware\tools\avr/bin/avr-gcc" -c -g -Os -w -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10801 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR .\code\main.c -o main.o
"D:\Arduino\arduino_1.8.3\hardware\tools\avr/bin/avr-gcc" -mmcu=atmega328p -o main.elf main.o -lm -emain
"D:\Arduino\arduino_1.8.3\hardware\tools\avr/bin/avr-objcopy" -O ihex -R .eeprom  main.elf main.hex

