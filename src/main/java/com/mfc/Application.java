package com.mfc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
	public static void main(String[] args) {
		
		/*
		 * 有些功能ajax用不了是因为权限拦截，在LoginInterceptor里面的urls添加一下不需要验证权限的url即可
		 * */
		SpringApplication.run(Application.class, args);
	}
}
