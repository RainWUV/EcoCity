/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Definindo fonte, cor e posição
draw_set_font(fonte);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


var _len = string_length(text[text_current]);
if (char_current < _len)
{
	char_current += char_speed;
}

var _str = string_copy(text[text_current], 1, char_current);
draw_text_ext(text_x, text_y, _str, 30, text_width);
