package com.ui.automation.completeflow;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestEntireFlowRunner {
	@Test
	public Karate runTest()
	{
		return Karate.run("entireFlow").relativeTo(getClass());
		
	}
}
