package br.com.ifpe.vox4t.util;

import java.util.ArrayList;
import java.util.List;

public class TratamentoPublicacao {
	
	//MÉTODO PARA CONVERTER UF PARA ESTADO
	private static String converterEst(String valor) {
		String data = valor;

		switch (valor.toUpperCase()) {

		case "AC":
			data = "Acre";
			break;
		case "AL":
			data = "Alagoas";
			break;
		case "AM":
			data = "Amazonas";
			break;
		case "AP":
			data = "Amapá";
			break;
		case "BA":
			data = "Bahia";
			break;
		case "CE":
			data = "Ceará";
			break;
		case "DF":
			data = "Distrito Federal";
			break;
		case "ES":
			data = "Espírito Santo";
			break;
		case "GO":
			data = "Goiás";
			break;
		case "MA":
			data = "Maranhão";
			break;
		case "MG":
			data = "Minas Gerais";
			break;
		case "MS":
			data = "Mato Grosso do Sul";
			break;
		case "MT":
			data = "Mato Grosso";
			break;
		case "PA":
			data = "Pará";
			break;
		case "PB":
			data = "Paraíba";
			break;
		case "PE":
			data = "Pernambuco";
			break;
		case "PI":
			data = "Piauí";
			break;
		case "PR":
			data = "Paraná";
			break;
		case "RJ":
			data = "Rio de Janeiro";
			break;
		case "RN":
			data = "Rio Grande do Norte";
			break;
		case "RO":
			data = "Rondônia";
			break;
		case "RR":
			data = "Roraima";
			break;
		case "RS":
			data = "Rio Grande do Sul";
			break;
		case "SC":
			data = "Santa Catarina";
			break;
		case "SE":
			data = "Sergipe";
			break;
		case "SP":
			data = "São Paulo";
			break;
		case "TO":
			data = "Tocantíns";
			break;
		}

		return data;
	}
	
	//MÉTODO QUE CONVERTE ABREVIAÇÕES
	private static String converterAbrev(String valor) {
		String data = valor;

		switch (valor.toUpperCase()) {

		case "R.":
			data = "rua";
			break;
		case "AV":
			data = "avenida";
			break;
		case "AV.":
			data = "avenida";
			break;
		}
		return data;
	}
	
	//METODO QUE EXECUTA A CONVERSÃO PARA A ABREVIACAO
	public static List<String> converterAbreviacao(List<String> publi) {
		
		List<String> tratados = new ArrayList<>();
		
		for(String x: publi) {
			
			String lista[] = x.split(" ");
			
			for(int i = 0; i < lista.length; i++) {
				lista[i] = converterEst(lista[i]);
				lista[i] = converterAbrev(lista[i]);
			}
			
			tratados.add(String.join(" ", lista));
		}
		
		
		return tratados;
	}
	
	

}