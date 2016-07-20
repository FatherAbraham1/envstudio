package org.liyubo.envstudio;

import org.liyubo.db.dao.UseDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller//用来标注当前类是springmvc的控制层的类
public class Login {
	@RequestMapping("login.do")//用来访问控制层的方法的注解
	public String loginCertification(String username,String password , Model model) throws Exception{
		System.out.println("---登录验证---");
		System.out.println("用户名："+username);
		
		//解析实体类字段
		UseDao user = new UseDao();
		if(user.getPassword(username).equals(password)){
			//验证密码通过
			System.out.println("验证通过");
			return "light";
		}else{
			return "login";
		}
	}
}
