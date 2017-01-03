package com.clik2fix.otp;

import java.util.Random;

public class OTPGenerator {
	
	public static int generateOTP() {
		Random randomGenerator = new Random();
        int randomInt = randomGenerator.nextInt(10000);		
        return randomInt;
	}
	
}
