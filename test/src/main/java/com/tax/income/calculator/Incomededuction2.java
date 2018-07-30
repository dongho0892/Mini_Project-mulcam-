package com.tax.income.calculator;

	public class Incomededuction2 {
		
		public double inde2(double salary1) {
			
			
		if (salary1/12 <29) 
			return 29;
	
		else if (salary1/12 <= 449 & salary1/12 > 29)
			return salary1/12;
		
		else
			return 449;
}


	}