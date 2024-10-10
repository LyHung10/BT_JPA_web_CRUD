package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.Category;

public class CategoryService implements ICategoryService{
	
	@Override
	public List<Category> findByCategoryname(String catname) {
		 return cateDao.findByCategoryname(catname);
	}
	@Override
	public List<Category> findAll() {
		 return cateDao.findAll();
	}
	@Override
	public Category findById(int cateid) {
		 return cateDao.findById(cateid);
	}

	@Override
	public void delete(int cateid) throws Exception {
		 cateDao.delete(cateid);		
	}

	@Override
	public void update(Category category) {
		 cateDao.update(category);
	}
	@Override
	public void insert(Category category) {
		 cateDao.insert(category);	
	}
}
