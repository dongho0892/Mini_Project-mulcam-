package com.tax.income.calculator;

public class TaxCred1 {
	
	public double taxcred1(double multiresult) {
		TaxVO tvo = TaxVO.getInstance();
		double a1 = 0;
		double b1 = 0;
		double c1 = 0;
		double d1 = 0;

		
	if (multiresult <= 130) 
		return multiresult * 0.55;

	else 
		if( tvo.salary1 <= 3300 ) {
			a1 = 71.5 + (multiresult - 130) * 0.3;
			b1 = 74;
			System.out.println("     ** 근로소득공제 계산 : " + a1 );
			System.out.println("     ** 근로소득공제 한도액 : " + b1 );
			return (a1 > b1 ? b1 : a1);
		} 
		else if (tvo.salary1 <= 7000 & tvo.salary1 > 3300 ) {
			a1 = 71.5 + (multiresult - 130) * 0.3;
			c1 = 74 - (tvo.salary1 - 3300) * 8/1000;
			d1 = 66;
			b1 = (c1 > d1 ? c1 : d1);
			System.out.println("     ** 근로소득공제 계산 : " + a1 );
			System.out.println("     ** 근로소득공제 한도액 : " + b1 );
			return (a1 > b1 ? b1 : a1);
			
		}
		else
			a1 = 71.5 + (multiresult - 130) * 0.3;
			c1 = 66 - (tvo.salary1 - 7000) * 1 / 2;
			d1 = 50;
			b1 = (c1 > d1 ? c1 : d1);
			System.out.println("     ** 근로소득공제 계산 : " + a1 );
			System.out.println("     ** 근로소득공제 한도액 : " + b1 );
			return (a1 > b1 ? b1 : a1);
	}
}