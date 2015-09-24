package com.tarena.dao;

import java.util.List;
import java.util.Map;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Module;
import com.tarena.entity.Role;
import com.tarena.entity.page.RolePage;

@MyBatisRepository
public interface RoleDao {

	/**
	 * 查询某一页的角色数据
	 * @param page
	 * @return
	 */
	public List<Role> findByPage(RolePage page);
	
	/**
	 * 查询总行数
	 * @return
	 */
	int findRows();
	
	/**
	 * 查询全部的模块
	 * @return
	 */
	public List<Module> findAllModules();
	
	/**
	 * 新增角色
	 */
	public void save(Role role);
	
	/**
	 * 新增角色模块中间表
	 * @param roleModule
	 */
	public void saveRoleModule(Map<String, Object> roleModule);
	
	/**
	 * 删除角色
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 删除角色模块中间表
	 */
	public void deleteroleModule(int id);
	
}