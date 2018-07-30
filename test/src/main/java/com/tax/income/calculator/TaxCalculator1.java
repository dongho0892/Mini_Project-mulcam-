package com.tax.income.calculator;

import java.util.Scanner;

import com.tax.income.calculator.Incomededuction1;
import com.tax.income.calculator.Incomededuction2;
import com.tax.income.calculator.Multirate;
import com.tax.income.calculator.TaxCred1;
import com.tax.income.calculator.TaxVO;

public class TaxCalculator1 {
	public static int main(int k) {
			  // int 형 반환  / 인자를 받아들임.
		TaxVO tvo = TaxVO.getInstance();
		
		System.out.println("1년치 급여를 입력해주세요.");
		tvo.salary1 = k;
		
		Incomededuction1 inde1 = new Incomededuction1();	
		double inde1result = inde1.inde1(tvo.salary1);
		double afterinde1result = tvo.salary1 - inde1result;		
//		System.out.println(tvo.salary1);
//		System.out.println(inde1result);
//		System.out.println(afterinde1result);
//		System.out.println();
//		System.out.println(afterinde1result + " = " + tvo.salary1 + "-" + inde1result);
		
		System.out.println("    총급여액   		: " + tvo.salary1);
		System.out.println(" - 근로소득공제	: " + inde1result);
		System.out.println(" = 근로소득금액		: " + afterinde1result);

		Incomededuction2 inde2 = new Incomededuction2();
		Incomededuction21 inde21 = new Incomededuction21();
		double inde2result = (inde2.inde2(tvo.salary1)*0.045);
		System.out.println( "기준월소득액:" + inde2.inde2(tvo.salary1));
		double inde21result = inde21.inde21(tvo.salary1);
		double afterinde2result = afterinde1result - inde2result - inde21result;
		
		if (afterinde2result < 0)
			afterinde2result = 0;
		
			
		System.out.println(" - 연금보험료공제   	: " + inde2result);
		System.out.println(" - 특별소득공제   	: " + inde21result);		
		System.out.println(" = 종합소득 과세표준 		: " + afterinde2result);
		
		Multirate mulrate = new Multirate();
		double multiresult = mulrate.mulrate(afterinde2result);

		System.out.println(" = 산출세액  		: " + multiresult);

		TaxCred1 taxcred1 = new TaxCred1();
		double taxcred1result = taxcred1.taxcred1(multiresult);
		
		int finishvalue = (int) (multiresult - taxcred1result - 13);
		if (finishvalue < 0)
			finishvalue = 0;
		
		
		
		System.out.println("- 근로소득세액공제	: " + taxcred1result);
		System.out.println("- 표준세액공제 	: " + 13);
		System.out.println("= 결정세액 		: " + finishvalue);
		System.out.println();
		System.out.println(" 당신이 1년에 납부하는 소득세는  " + finishvalue + "만원입니다.");
		

		return finishvalue;
	}		
}
