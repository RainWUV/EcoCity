/// @description Inserir descrição aqui

 
if (keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left))
{
	var _len = string_length(text[text_current]);
	if (char_current < _len)
	{
		char_current = _len;
	}
	else
	{
		text_current += 1;
		if (text_current > text_last)
		{
			controleDialogo();
			instance_destroy(self);
		}
		else
		{
			show_debug_message(text_width);
			text[text_current] = string_wrap(text[text_current], text_width);
			char_current = 1;
		}
	}
}