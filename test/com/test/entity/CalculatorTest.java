package com.test.entity;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculatorTest {

	@Test
	public void testAdd() {
		Calculator cal = new Calculator();
		int a = 1234;
		int b = 5678;
		
		int result = cal.add(a, b);
		
		int expected = 6912;
		
		assertEquals(expected, result);
	}

}
