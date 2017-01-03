package com.clik2fix.cust;

import com.clikfix.exceptions.GlobalException;

public interface ICustDao {

	boolean saveCust(String name, String email, String mobile) throws GlobalException;

	int checkCust(String email) throws GlobalException;

}
