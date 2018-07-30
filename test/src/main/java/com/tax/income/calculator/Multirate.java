package com.tax.income.calculator;

public class Multirate {

	public double mulrate(double afterinde2result) {

		if (afterinde2result <= 1200)
			return (afterinde2result * 0.06);

		else if (afterinde2result <= 4600 & afterinde2result > 1200)
			return (afterinde2result * 0.15) - 108;

		else if (afterinde2result <= 8800 & afterinde2result > 4600)
			return (afterinde2result * 0.24) - 552;

		else if (afterinde2result <= 15000 & afterinde2result > 8800)
			return (afterinde2result * 0.35) - 1490;

		else if (afterinde2result <= 50000 & afterinde2result > 15000)
			return (afterinde2result * 0.38) - 1940;

		else
			return (afterinde2result * 0.40) - 2940;

	}

}
