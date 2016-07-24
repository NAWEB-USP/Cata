package br.usp.cata.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.arabidopsis.ahocorasick.SearchResult;

import br.usp.cata.model.CheckedSegment;
import br.usp.cata.model.Keyword;
import br.usp.cata.model.Mistake;
import br.usp.cata.model.Opinion;
import br.usp.cata.model.Position;
import br.usp.cata.model.RuleInstance;
import br.usp.cata.service.OpinionService;


public class Checker {

	private ArrayList<ArrayList<CheckedSegment>> checkedText;
	private final OpinionService opinionService;
	private int numOfMistakes;

	public Checker(TextAnalyzer textAnalyzer, RulesTrees rulesTrees, OpinionService opinionService) {
		this.opinionService = opinionService;
		checkText(textAnalyzer, rulesTrees);
	}

	public ArrayList<ArrayList<CheckedSegment>> getCheckedText() {
		return checkedText;
	}

	public int getNumOfMistakes() {
		return numOfMistakes;
	}

	/**
	 * Associa regras violadas à sua posição respectiva no texto.
	 * Essa função é chamada duas vezes uma para as regras contendo exactMatching e outra para Lemmas.
	 * @param searcher Um Iterator cujos elementos são as regras que foram quebradas no texto
	 * @param starts HashMap que associa o índice de cada token no ArrayList tokenizedText com uma
	 * instancia de Position indicando a posição inicial do token no texto.
	 * @param ends HashMap que associa o índice de cada token no ArrayList tokenizedText com uma
	 * instancia de Position indicando a posição final do token no texto.
	 * @param mistakes ArrayList resultante contendo uma tupla de regras violadas, posição inicial e final no texto.
	 * @param string 
	 */
	private void addMistakes(Iterator<?> searcher, HashMap<Integer, Position> starts,
							 HashMap<Integer, Position> ends, ArrayList<Mistake> mistakes) {

		while(searcher.hasNext()) {
			SearchResult searchResult = (SearchResult) searcher.next();
			RuleInstance brokenRule = (RuleInstance) searchResult.getOutputs().iterator().next();

			int lastIndex = searchResult.getLastIndex();
			int firstIndex = lastIndex -
					brokenRule.getPatternSuggestionPair().getTokenizedPatternBytes().length;
			Position start = starts.get(firstIndex);
			Position end = ends.get(lastIndex);

			mistakes.add(new Mistake(brokenRule, start, end));
		}

	}

	private boolean isSameSegment(ArrayList<Mistake> mistakes, Mistake mistake) {
		Position start = mistake.getStart();
		for(Mistake m : mistakes) {
			if(m.getEnd().compareTo(start) >= 0)
				return true;
		}

		return false;
	}

	/**
	 * Agrupando todas as regras violadas que estão no mesmo seguimento
	 * @param mistakesList ArrayList com todas as tuplas de regras violadas e posição inicial e final no texto
	 * @param mistakes ArrayList resultante, contendo todas as regras violadas agrupadas por seguimento
	 * @param starts ArrayList informando a posição inicial de cada seguimento no texto
	 * @param ends ArrayList informando a posição final de cada seguimento no texto
	 */
	private void groupMistakes(ArrayList<Mistake> mistakesList, ArrayList<ArrayList<Mistake>> mistakes,
							   ArrayList<Position> starts, ArrayList<Position> ends) {

		Collections.sort(mistakesList);

		for(int i = 0; i < mistakesList.size();) {
			ArrayList<Mistake> segmentMistakes = new ArrayList<Mistake>();
			segmentMistakes.add(mistakesList.get(i));
			i++;

			while(i < mistakesList.size()) {
				Mistake mistake = mistakesList.get(i);
				if(isSameSegment(segmentMistakes, mistake)) {
					segmentMistakes.add(mistake);
					i++;
				}
				else
					break;
			}
			Position start = new Position(Integer.MAX_VALUE, Integer.MAX_VALUE);
			Position end = new Position(0, 0);
			for(Mistake mistake : segmentMistakes) {
				if(mistake.getStart().compareTo(start) < 0)
					start = mistake.getStart();
				if(mistake.getEnd().compareTo(end) > 0)
					end = mistake.getEnd();
			}

			mistakes.add(segmentMistakes);
			starts.add(start);
			ends.add(end);
		}
	}

	/**
	 * Cada palavra no texto é associada a uma regra violada se esta violar tal regra ou é associado a null se não houver violação de regra.
	 * @param textAnalyzer TextAnalyzer contendo o texto do documento enviado pelo usuário.
	 * @param mistakes ArrayList contendo todas as regras violadas agrupadas por seguimento.
	 * @param starts ArrayList informando a posição inicial de cada seguimento de regra violada no texto.
	 * @param ends ArrayList informando a posição final de cada seguimento regra violada no texto.
	 */
	private void buildCheckedText(TextAnalyzer textAnalyzer, ArrayList<ArrayList<Mistake>> mistakes,
								  ArrayList<Position> starts, ArrayList<Position> ends) {

		checkedText = new ArrayList<ArrayList<CheckedSegment>>();
		ArrayList<String> text = textAnalyzer.getText();

		int i = 0;
		int lastCharIndex = 0;
		ArrayList<CheckedSegment> checkedLine = null;
		String line = null;

		for(int lineNum = 0; lineNum < text.size();) {
			Position start = null;
			Position end = null;

			if(i < mistakes.size()) {
				start = starts.get(i);
				end = ends.get(i);

				if((lastCharIndex != 0) && (start.getLineNumber() > lineNum)) {
					checkedLine.add(
							new CheckedSegment(text.get(lineNum).substring(lastCharIndex), null));
					checkedText.add(checkedLine);
					lineNum++;
					lastCharIndex = 0;
				}
				while(start.getLineNumber() > lineNum) {
					checkedLine = new ArrayList<CheckedSegment>();
					checkedLine.add(new CheckedSegment(text.get(lineNum), null));
					checkedText.add(checkedLine);
					lineNum++;
				}

				if(lastCharIndex == 0) {
					checkedLine = new ArrayList<CheckedSegment>();
					line = text.get(lineNum);
				}

				if(start.getCharIndex() > lastCharIndex) {
					checkedLine.add(new CheckedSegment(line.substring(lastCharIndex, start.getCharIndex()), null));
					lastCharIndex = start.getCharIndex();
				}

				if(start.getLineNumber() == end.getLineNumber()) {
					checkedLine.add(new CheckedSegment(
							line.substring(start.getCharIndex(), end.getCharIndex()), mistakes.get(i)));
					lastCharIndex = end.getCharIndex();
				}
				else {
					String segment = line.substring(start.getCharIndex());
					lineNum++;
					while(lineNum < end.getLineNumber()) {
						segment += text.get(lineNum);
						lineNum++;
					}
					checkedLine.add(new CheckedSegment(
							segment + text.get(lineNum).substring(0, end.getCharIndex()), mistakes.get(i)));
				}
				i++;

				if(end.getCharIndex() != line.length())
					lastCharIndex = end.getCharIndex();
				else {
					checkedText.add(checkedLine);
					lineNum++;
					lastCharIndex = 0;
				}
			}
			else {
				if(lastCharIndex != 0) {
					checkedLine.add(new CheckedSegment(text.get(lineNum).substring(lastCharIndex), null));
					checkedText.add(checkedLine);
					lineNum++;
				}
				while(lineNum < text.size()) {
					checkedLine = new ArrayList<CheckedSegment>();
					checkedLine.add(new CheckedSegment(text.get(lineNum), null));
					checkedText.add(checkedLine);
					lineNum++;
				}
			}
		}
	}

	/**
	 * Casa todos os tokens e lemas em textAnalyzer com os rulesTrees
	 * @param textAnalyzer TextAnalyzer que contém  todos os tokens e lemas do texto enviado pelo usuário
	 * @param rulesTrees RulesTrees que contém todos as regras filtradas do banco de dados
	 */
	private void checkText(final TextAnalyzer textAnalyzer, RulesTrees rulesTrees) {
		Iterator<?> exactMatchingsSearcher =
				rulesTrees.searchExactMatchings(textAnalyzer.getTokenizedTextBytes());
		Iterator<?> lemmasSearcher =
				rulesTrees.searchLemmas(textAnalyzer.getLemmatizedTextBytes());

		ArrayList<Mistake> mistakesList = new ArrayList<Mistake>();
		addMistakes(exactMatchingsSearcher, textAnalyzer.getStartsTokenized(),
				textAnalyzer.getEndsTokenized(), mistakesList);
		addMistakes(lemmasSearcher, textAnalyzer.getStartsLemmatized(),
				textAnalyzer.getEndsLemmatized(), mistakesList);

		List<String> thisTextKeywords = textAnalyzer.getKeywords();

		// Filtrando as regras com base nas opiniões dos usuários
		// FIXME Sugestões com joinhas não aparecem no texto analisado
		if(thisTextKeywords.size() > 15) {
			ArrayList<Mistake> mistakesToRemove = new ArrayList<Mistake>();
			for(Mistake mistake : mistakesList) {
				List<Opinion> opinions = opinionService.findByPair(mistake.getBrokenRule().getPatternSuggestionPair());

				for(Opinion opinion : opinions) {
					int similarity = 0;
					if(opinion.getKeywords() != null) {
						Iterator<Keyword> keywords = opinion.getKeywords().iterator();

						while(keywords.hasNext()) {
							String keyword = keywords.next().getWord();
							if(thisTextKeywords.contains(keyword))
								similarity++;
						}

						if(similarity > (thisTextKeywords.size()/2)) {
							mistakesToRemove.add(mistake);
							break;
						}
					}
				}
			}
			for(Mistake mistake : mistakesToRemove)
				mistakesList.remove(mistake);
		}

		numOfMistakes = mistakesList.size();
		rulesTrees.updateMistakesCounter(mistakesList);

		ArrayList<ArrayList<Mistake>> mistakes = new ArrayList<ArrayList<Mistake>>();
		ArrayList<Position> starts = new ArrayList<Position>();
		ArrayList<Position> ends = new ArrayList<Position>();
		groupMistakes(mistakesList, mistakes, starts, ends);

		buildCheckedText(textAnalyzer, mistakes, starts, ends);
	}

}
