package br.usp.cata.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import br.usp.cata.model.Languages;
import br.usp.cata.model.Position;


public class TextAnalyzer {
	
	ArrayList<String> text;
	TextAnalyzerLanguage textAnalyzerLanguage;
	/**
	 * Faz a seleção entre as formas de análise de texto por idioma,
	 * informção que é passada no parametro language, e faz a análise do texto de acordo com
	 * o idioma selecionado.
	 * @param text Um ArrayList de String cujas componentes são linhas do texto a ser analisado.
	 * @param language Um Language pode ser english ou portuguese
	 * @param servletContext
	 */
	public TextAnalyzer(ArrayList<String> text, Languages language, ServletContext servletContext) {
		this.text = text;
		if(language == Languages.ENGLISH) {
			System.out.println("English text");
			textAnalyzerLanguage = new TextAnalyzerEN();
		}
		else {
			System.out.println("Portuguese text");
			textAnalyzerLanguage = new TextAnalyzerPT(servletContext);
		}
		
		textAnalyzerLanguage.analyze(this.text);
	}

	public ArrayList<String> getText() {
		return text;
	}

	public void setText(ArrayList<String> text) {
		this.text = text;
	}

	public byte[] getTokenizedTextBytes() {
		return textAnalyzerLanguage.getTokenizedTextBytes();
	}

	public HashMap<Integer, Position> getStartsTokenized() {
		return textAnalyzerLanguage.getStartsTokenized();
	}

	public HashMap<Integer, Position> getEndsTokenized() {
		return textAnalyzerLanguage.getEndsTokenized();
	}

	public byte[] getLemmatizedTextBytes() {
		return textAnalyzerLanguage.getLemmatizedTextBytes();
	}

	public HashMap<Integer, Position> getStartsLemmatized() {
		return textAnalyzerLanguage.getStartsLemmatized();
	}

	public HashMap<Integer, Position> getEndsLemmatized() {
		return textAnalyzerLanguage.getEndsLemmatized();
	}
	
	public List<String> getKeywords() {
		return textAnalyzerLanguage.getKeywords();
	}
	
}
