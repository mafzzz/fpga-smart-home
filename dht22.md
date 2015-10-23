# Модуль чтения данных с DHT-22 #

На вход должен быть подан тактовый сигнал 1 МГц. И сигнал 1 раз в 5 секунд для старда обмена с DHT-22.

Файл в дереве исходных кодов <a href='https://code.google.com/p/fpga-smart-home/source/browse/trunk/Humidity.v'>Humidity.v</a>

Линия Data\_H должна быть подключена к INOUT выводу ПЛИС (bidir). На MAX ii тип вывода должен быть установлен - CMOS 3.3V

<a href='https://code.google.com/p/fpga-smart-home/wiki/sht22_to_fpga'>Схема подключения датчика к ПЛИС</a>.