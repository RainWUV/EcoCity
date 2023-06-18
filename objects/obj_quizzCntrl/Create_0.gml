/// @description Inserir descrição aqui
randomize();

//Variáveis de controle
prgntAtiva = false;
pontos = 0;
global.respCntrl = false;
quizzEnd = false;
listaCntrl = false;
qtdPrgnt = 0;

//Textos
pergunta = "";
resp1    = "";
resp2	 = "";
resp3	 = "";
resp4	 = "";


// Controle de Dialogo
if (global.quizzCmpltd = false)
{
	var _inst = instance_create_layer(0, 0, "Dialog", obj_dialog);
	with(_inst)
	    {
			global.dialogoCntrl  = true;
			rmOrigem = "Quizz";
		    texto[0] = "Esse é um texto para testar a quebra de linha dos textos feitos no objeto que tem o proposito de criar textos e quebrar a linha quando necessário";
		    texto[1] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor. ";
		    texto[2] = "magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
		    texto[3] = "I talk too much!";
		    text_last = 3;
		    text_width = 870;
		    text_x = 270;
		    text_y = 480;
			sprPersonagem = spr_chatPedro;
	    }
}

//Iniciando lista de perguntas

criaLista = function()
{
	lista_prgnts = ds_list_create();

	// Adiciona os valores de 1 a 5 à lista 
	for (var i = 1; i <= 4; i++) { ds_list_add(lista_prgnts, i); }
	ds_list_shuffle(lista_prgnts);
}



//Base de perguntas e respostas
escPrgnt = function()
{
	if (ds_list_size(lista_prgnts) > 0) 
	{
		var _valor = ds_list_find_value(lista_prgnts, 0);

	}
	else quizzEnd = true; 
	
	
	if (!quizzEnd)
	{
		ds_list_delete(lista_prgnts, 0);
		switch(_valor)
		{
			case 1:
				pergunta = "O que é energia renovável?";
				resp1    = "Energia gerada a partir de combustíveis fósseis.";
				resp2	 = "Energia gerada a partir de fontes inesgotáveis, como o sol, o vento e a água.";
				resp3	 = "Energia gerada a partir de reações nucleares.";
				resp4	 = "Energia gerada a partir da queima de resíduos.";
				respCrt  = 2;
			break;
			case 2:
				pergunta = "O que é a pegada de carbono?";
				resp1    = "Impressão digital de uma pessoa relacionada à sustentabilidade";
				resp2	 = "Medida da quantidade de carbono liberada na atmosfera por uma atividade humana";
				resp3	 = "Tamanho físico de um carbono";
				resp4	 = "Unidade de medida de energia limpa";
				respCrt  = 2;
			break;	
			case 3:
				pergunta = "Qual é a importância da preservação das florestas para a sustentabilidade?";
				resp1    = "As florestas são importantes para a manutenção do equilíbrio do clima e a conservação da biodiversidade";
				resp2	 = "As florestas não têm relação direta com a sustentabilidade";
				resp3	 = "As florestas são importantes apenas para a indústria madeireira";
				resp4	 = "As florestas são importantes para aumentar a poluição do ar";
				respCrt  = 1;
			break;
			case 4:
				pergunta = "Qual é o objetivo principal da reciclagem?";
				resp1    = "Reduzir o consumo de energia";
				resp2	 = "Maximizar os lucros das empresas de reciclagem";
				resp3	 = "Diminuir a poluição do ar";
				resp4	 = "Reduzir a quantidade de resíduos e promover a reutilização de materiais";
				respCrt  = 4;
			break;

		}
	}
}

//Criar pergunta e respostas
criaPrgnt = function()
{
	//debug

	if (prgntAtiva = false && !quizzEnd)
	{
		escPrgnt();
		if (!quizzEnd)
		{
			qtdPrgnt++;
			var _prgnt = instance_create_layer(160, 32, "Instances", obj_prgnt);	
			_prgnt.text[0] = pergunta;
		
			var _resp1 = instance_create_layer(159, 380, "Instances", obj_resp);
			_resp1.text[0] = resp1;
		
			var _resp2 = instance_create_layer(658, 380, "Instances", obj_resp);
			_resp2.text[0] = resp2;
		
			var _resp3 = instance_create_layer(159, 544, "Instances", obj_resp);
			_resp3.text[0] = resp3;
		
			var _resp4 = instance_create_layer(658, 544, "Instances", obj_resp);
			_resp4.text[0] = resp4;

			switch (respCrt)
			{
				case 1:
					_resp1.resCerta = true;
				break;
			
				case 2:
					_resp2.resCerta = true;
				break;
			
				case 3:
					_resp3.resCerta = true;
				break;
			
				case 4:
					_resp4.resCerta = true;
				break;
			}
		
			prgntAtiva = true;
		}
		else 
		{
			global.start = false;
			listaCntrl   = false;
			quizzEnd	 = false;
			pontos		 = 0;
			qtdPrgnt	 = 0;
		}
	}
}