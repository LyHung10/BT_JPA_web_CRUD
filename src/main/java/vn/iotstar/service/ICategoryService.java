package vn.iotstar.service;

import java.util.List;

import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.ICategoryDao;
import vn.iotstar.entity.Category;

public interface ICategoryService {

	void insert(Category category);

	void update(Category category);
	void delete(int cateid) throws Exception;
	Category findById(int cateid);
	List<Category> findAll();
	List<Category> findByCategoryname(String catname);
	ICategoryDao cateDao = new CategoryDao();

}
