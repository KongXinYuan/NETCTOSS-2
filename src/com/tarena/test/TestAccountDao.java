package com.tarena.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.AccountDao;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

public class TestAccountDao {
	
//	@Test
	public void testFindByDao() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		AccountPage page = new AccountPage();
		page.setStatus("1");
		page.setCurrentPage(2);
		List<Account> list = dao.findByPage(page);
		for (Account account : list) {
			System.out.println(account.getAccount_id());
			System.out.println(account.getReal_name());
			System.out.println(account.getIdcard_no());
		}
	}
	
	@Test
	public void testFindRows() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		AccountDao dao = context.getBean(AccountDao.class);
		AccountPage page = new AccountPage();
		page.setCurrentPage(2);
		int rows = dao.findRows(page);
		System.out.println(rows);
	}

}