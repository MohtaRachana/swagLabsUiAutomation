package com.ui.automation.login;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestAllRunner {
	@Test
	public Karate runTest()
	{
		return Karate.run("login").relativeTo(getClass());
		//return Karate.run("selectAllProduct").relativeTo(getClass());
	}
}
