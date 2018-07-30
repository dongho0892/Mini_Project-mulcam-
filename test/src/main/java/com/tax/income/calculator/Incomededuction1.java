package com.tax.income.calculator;

	public class Incomededuction1 {
		
		public double inde1(double salary1) {
			
			
		if (salary1 <= 500) 
			return salary1 * 0.7;
		
		else if (salary1 <= 1500 & salary1 > 500)
			return (350 + (salary1 - 500) * 0.4);
		
		else if (salary1 <= 4500 & salary1 > 1500)
			return (750 + (salary1 - 1500) * 0.15);

		else if (salary1 <= 10000 & salary1 > 4500)
			return (1200 + (salary1 - 4500) * 0.05);
	
		else if (salary1 > 10000)
			return (1475 + (salary1 - 10000) * 0.02);
	
		else
			System.out.println("?��?�� 값을 ?��?��?�� ?�� ?��?��?��?��.");
		return salary1;
}


	}