extends CanvasLayer

@onready var nome_input = $MarginContainer/Panel/MarginContainer/VBoxContainer/Panel2/VBoxContainer/Panel/MarginContainer/VBoxContainer/NomeInput
@onready var pontos_input = $MarginContainer/Panel/MarginContainer/VBoxContainer/Panel2/VBoxContainer/Panel/MarginContainer/VBoxContainer/PontosInput
@onready var verifcar = $MarginContainer/Panel/MarginContainer/VBoxContainer/Panel2/VBoxContainer/Panel/MarginContainer/VBoxContainer/Verifcar

@onready var resultado = $MarginContainer/Panel/MarginContainer/VBoxContainer/Panel2/VBoxContainer/Panel2/Resultado

var numeros="0123456789"

@onready var vitorias = $MarginContainer/Panel/MarginContainer/VBoxContainer/Panel2/VBoxContainer/Panel/MarginContainer/VBoxContainer/Vitorias
@onready var derrotas = $MarginContainer/Panel/MarginContainer/VBoxContainer/Panel2/VBoxContainer/Panel/MarginContainer/VBoxContainer/Derrotas


@onready var rank_btn = $MarginContainer/Panel/MarginContainer/VBoxContainer/Panel2/VBoxContainer/Panel/MarginContainer/VBoxContainer/RankBtn



func _ready():

	verifcar.button_up.connect(verificarTudo)
	rank_btn.button_up.connect(verificarRank)


func verificarTudo():
	var rank=""
	if nome_input.text.is_empty():
		return
	if pontos_input.text.is_empty():
		return
	
	
	#var temLetra=false
	for c in pontos_input.text:
		var temNumero=false
		
		for n in numeros:
			if n==c:
				temNumero=true
				break
		
		if !temNumero:
			resultado.text="Ponto Invalido"
			return
		

	var tempPontos:int=pontos_input.text.to_int()
	
#Se XP for menor do que 1.000 = Ferro
#Se XP for entre 1.001 e 2.000 = Bronze
#Se XP for entre 2.001 e 5.000 = Prata
#Se XP for entre 5.001 e 7.000 = Ouro
#Se XP for entre 7.001 e 8.000 = Platina
#Se XP for entre 8.001 e 9.000 = Ascendente
#Se XP for entre 9.001 e 10.000= Imortal
#Se XP for maior ou igual a 10.001 = Radiante
	
	if tempPontos < 1001:
		rank = "Ferro"
	elif tempPontos < 2001:
		rank = "Bronze"
	elif tempPontos < 5001:
		rank = "Prata"
	elif tempPontos < 7001:
		rank = "Ouro"
	elif tempPontos < 8001:
		rank = "Platina"
	elif tempPontos < 9001:
		rank = "Ascendente"
	elif tempPontos < 10001:
		rank = "Imortal"
	elif tempPontos >= 10001:
		rank = "Radiante"
	
	if tempPontos==null:
		resultado.text="Somente Numeros em XP"
		return
	
	resultado.text="O Herói de nome "+nome_input.text+" está no nível de " + rank + " com: " + pontos_input.text +" XP."



func verificarRank():
	var rank:String
	
	
	if vitorias.text.is_empty():
		return
	if derrotas.text.is_empty():
		return
	
	for c in derrotas.text:
		var temNumero=false
		
		for n in numeros:
			if n==c:
				temNumero=true
				break
		
		if !temNumero:
			resultado.text="Numero Invalido"
			return
	
	
	
	for c in vitorias.text:
		var temNumero=false
		
		for n in numeros:
			if n==c:
				temNumero=true
				break
		
		if !temNumero:
			resultado.text="Numero Invalido"
			return
	
	var vitoriasInt=vitorias.text.to_int()
	var derrotasInt=derrotas.text.to_int()
	
	var saldo=vitoriasInt-derrotasInt
	
#Se vitórias for menor do que 10 = Ferro
#Se vitórias for entre 11 e 20 = Bronze
#Se vitórias for entre 21 e 50 = Prata
#Se vitórias for entre 51 e 80 = Ouro
#Se vitórias for entre 81 e 90 = Diamante
#Se vitórias for entre 91 e 100= Lendário
#Se vitórias for maior ou igual a 101 = Imortal
	
	
	if vitoriasInt<=10:
		rank="Ferro"
	elif vitoriasInt<=20:
		rank="Bronze"
	elif vitoriasInt<=50:
		rank="Prata"
	elif vitoriasInt<=80:
		rank="Ouro"
	elif vitoriasInt<=90:
		rank="Diamante"
	elif vitoriasInt<=100:
		rank="Lendário"
	elif vitoriasInt>100:
		rank="Imortal"
	
	resultado.text="O Herói tem de saldo de "+str(saldo)+" está no nível de " + rank
	
	pass
