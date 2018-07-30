package com.tax.income.calculator;

public class TaxVO {
	 private static TaxVO tvo = null;				
	 double salary1 = 0; 	// 총급여액 일반
	 double inde1 = 0;	 	// 근로소득공제
	 double inde2 = 0; 		// 연금보험료 공제
	 double multirate = 0; 	// 기본세율
	 double taxcred1 = 0; 	// 근로세액공제
	 double taxcred2 = 0; 	// 표준세액공제

	 double afterinde1 = 0; // 근로소득금액
	 double afterinde2 = 0; // 종합소득과세표준
	 double aftermultirate = 0; // 산출세액
	 double finishvalue = 0; 	// 결정세액 보여줄 값
	 // 소득공제 Incomededuction // 세액공제 Tax credit
	 
	 
	 
	 
	 
	 
	 
	 
	 public static TaxVO getInstance() {
		 if(tvo==null) {
			 tvo = new TaxVO();
		 }
		 return tvo;
	 }

}
