package br.usp.cata.model;

/**
 * Cada instancia da classe Position está associada a um token ou um lemma do texto de entrada no sistema.
 * O texto de entrada no sistema é armazenado em um ArrayList de String, onde cada componente
 * é uma linha do texto.
 */
public class Position implements Comparable<Position> {

	private int lineNumber;
	private int charIndex;
	/**
	 * Construtor da classe Position.
	 * @param lineNumber Um int que guarda o número da linha do token ou lemma.
	 * @param charIndex Um int que guarda o número de caracteres na linha antes do primeiro
	 * caractere do token ou guarda o número de caracteres na linha antes do último caracatere
	 * do token.
	 */
	public Position(int lineNumber, int charIndex) {
		this.lineNumber = lineNumber;
		this.charIndex = charIndex;
	}

	public int getLineNumber() {
		return lineNumber;
	}

	public void setLineNumber(int lineNumber) {
		this.lineNumber = lineNumber;
	}

	public int getCharIndex() {
		return charIndex;
	}

	public void setCharIndex(int charIndex) {
		this.charIndex = charIndex;
	}

	public int compareTo(Position p) {
		if(this.lineNumber == p.getLineNumber())
			return this.charIndex - p.getCharIndex();
		
		return this.lineNumber - p.getLineNumber();
	}
	
}
