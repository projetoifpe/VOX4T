package br.com.ifpe.vox4t.converters;

import java.util.Calendar;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DataConverter implements Converter<String, Date> {
	public Date convert(String dataNascimento) {
		Calendar c = Calendar.getInstance();
		int dia = Integer.parseInt(dataNascimento.substring(0, 2));
		int mes = Integer.parseInt(dataNascimento.substring(3, 5));
		int ano = Integer.parseInt(dataNascimento.substring(6, 10));
		c.set(ano, (mes-1), (dia+1), 0, 0, 0);
		return c.getTime();
	}
}

