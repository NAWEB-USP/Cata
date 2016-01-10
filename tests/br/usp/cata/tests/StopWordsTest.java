package br.usp.cata.tests;

import org.junit.Before;
import org.junit.Test;

import br.usp.cata.component.keywordExtraction.StopWords;


public class StopWordsTest extends CataTestCase {
	
	public StopWordsTest(String name) {
		super(name);
	}

	@Before
	public void setUp() throws Exception {
		new StopWords();
	}
	
	@Test
	public void testStopWordsPT() {
		assertTrue(StopWords.getStopWordsPT().contains("também"));
	}

	@Test
	public void testStopWordsEN() {
		assertTrue(StopWords.getStopWordsEN().contains("the"));
	}
	
}
