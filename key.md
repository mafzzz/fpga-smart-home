# Схема подключения кнопки #

Обычная кнопка, требующая одного входа ПЛИС.

<img src='https://sites.google.com/site/analogsynthdiy/_/rsrc/1410552253065/sobstvennye-razrabotki/sintezator-na-baze-plis/11---vvod-vyvod/1-4-knopka/key.png?height=400&width=345'>

ВАЖНЫЙ МОМЕНТ. При чтении с кнопки обязательна буферизация/обработка ввода, иначе на линии может оказаться сигнал, отличающийся от 1 или 0, что приведет к ошибкам в работе модулей, причину которых будет очень трудно понять.<br>
<br>
ВАЖНЫЙ МОМЕНТ №2. Вход инвертированый: при нажатой кнопке, на входе будет 0.<br>
<br>
Примеры работы.<br>
<pre>
//трех битный буфер<br>
reg [2:0] gate_buff;<br>
<br>
always @ (posedge clk50M)<br>
gate_buff <= {gate_buff[1:0],~key0};<br>
<br>
//буфферизированное значение<br>
assign GATE_D = (gate_buff == 3'b111);<br>
<br>
//положительный фронт<br>
assign GATE_POSEDGE = (gate_buff == 3'b011);<br>
<br>
//отрицательный фронт<br>
assign GATE_NEGEDGE = (gate_buff == 3'b110);<br>
<br>
</pre>