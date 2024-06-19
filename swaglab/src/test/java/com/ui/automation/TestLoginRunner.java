package com.ui.automation;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestLoginRunner {
	@Test
	public Karate runTest()
	{
		return Karate.run("login").relativeTo(getClass());
		
	}
}
