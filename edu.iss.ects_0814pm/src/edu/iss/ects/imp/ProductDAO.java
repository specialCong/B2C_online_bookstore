package edu.iss.ects.imp;

import edu.iss.ects.entity.Entity;
import edu.iss.ects.entity.Product;
import edu.iss.ects.exception.ManagerProductException;
import edu.iss.ects.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;

/**
 * @author Microwind
 * 
 */
public class ProductDAO {
	// 增加产品的 SQL 语句
	private String addSql = "INSERT INTO  product (name,description,price,category_id,author,publish,pages, image) "
			+ "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);";
	private String updateSql = "update product set name=?,author=?,publish=?,pages=?,image=?,price=?,category_id=?where product_id=?";
	private String deleteSql = "delete from product where product_id=?";

	private String selectByID = "select * from product where product_id=?";
	private String selectByName = "select * from product where name=?";
	private String selectByAuthor = "select * from product where author=?";
	private String selectByPublish = "select * from product where publish=?";
	
	private String selectAll = "select * from product";
	private String selectCount = "select count(*) as count from product";
	private String selectNameCount = "select count(*) as count from product where name=?";
	private String selectAuthorCount = "select count(*) as count from product where author=?";
	private String selectPublishCount = "select count(*) as count from product where publish=?";
	//分页查询使用 mySQL 的 limit 属性
	/*
	LIMIT子句可以用来限制由SELECT语句返回过来的数据数量，它有一个或两个参数: 
	第一个参数指定返回的第一行在所有数据中的位置，从0开始（注意不是1），
	第二个参数指定最多返回行 数。
	例如： 
	select * from table LIMIT 5,10; #返回第6-15行数据 
	select * from table LIMIT 5; #返回前5行 
	select * from table LIMIT 0,5; #返回前5行 
	*/
	private String selectAllPage = "select * from product limit ?,?";
	private String selectNamePage = "select * from product where name=? limit ?,?";
	private String selectAuthorPage = "select * from product where author=? limit ?,?";
	private String selectPublishPage = "select * from product where publish=? limit ?,?";
	/**
	 * 在数据库中增加新的产品
	 * 
	 * @param product
	 *            要添加到数据库中的产品信息
	 * @throws 抛出专门处理
	 *             product 类型的异常
	 */
	public void add(Product product) throws ManagerProductException {
		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			// 预处理 SQL 语句
			ps = conn.prepareStatement(addSql);

			// 给 SQL 语句中的 ? 赋值
			ps.setString(1, product.getName());
			ps.setString(2, product.getDescription());
			ps.setDouble(3, product.getPrice());
			ps.setInt(4, product.getCategory().getCategoryId().intValue()); // 类型 id
			ps.setString(5, product.getAuthor());
			ps.setString(6, product.getPublish());
			ps.setInt(7, product.getPages()); // 页数
			ps.setString(8, product.getImage());

			boolean b = ps.execute();

			System.out.println("插入数据的结果 :" + b);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

	}

	/**
	 * 删除数据库中一个产品
	 * 
	 * @param product
	 *            要删除的产品信息
	 * @throws 抛出专门处理
	 *             product 类型的异常
	 */
	public void delete(Product product) throws ManagerProductException {
		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();
			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.deleteSql);
			// delete from product where product_id=?
			// 给 SQL 语句中的 ? 赋值
			ps.setInt(1, product.getProductId().intValue());

			boolean b = ps.execute();

			System.out.println("删除数据的结果 :" + b);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}
	}

	/**
	 * 更新数据库中一个用户的信息
	 * 
	 * @param product
	 *            要修改的产品信息
	 * @throws 抛出专门处理
	 *             product 类型的异常
	 */
	public void update(Product product) throws ManagerProductException {
		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.updateSql);

			// 给 SQL 语句中的 ? 赋值
			ps.setString(1, product.getName());
			ps.setString(2, product.getAuthor());
			ps.setString(3, product.getPublish());
			ps.setInt(4, product.getPages()); // 页数
			ps.setString(5, product.getImage());
			ps.setDouble(6, product.getPrice());
			ps.setInt(7, product.getCategory().getCategoryId().intValue()); // 类型 id
			ps.setInt(8, product.getProductId().intValue());

			boolean b = ps.execute();

			System.out.println("修改数据的结果 :" + b);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}
	}

	/**
	 * 根据 id ，查找产品
	 * 
	 * @param id
	 *            要查找的产品的 id
	 * @return Product 查找到的产品对象
	 * @throws 抛出专门处理
	 *             product 类型的异常
	 */
	public Product findById(Integer id) throws ManagerProductException {
		Product p = null;

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectByID);
			ps.setInt(1, id.intValue());

			rs = ps.executeQuery();

			while (rs.next()) {
				p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return p;
	}

	/**
	 * 查找全部产品
	 * 
	 * @return 返回保存查找到的所有产品的集合对象
	 * @throws 抛出专门处理
	 *             product 类型的异常
	 */
	public Collection findAll() throws ManagerProductException {
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectAll);

			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));

				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return list;
	}

	
	
	
	
	/**
	 * 得到数据库表中产品记录的总条数
	 * 
	 * @return int 记录总条数
	 * @throws ManagerProductException
	 */
	public int getTotal() throws ManagerProductException {
		int count = 0;

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectCount);

			rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return count;
	}

	/**
	 * 根据给定的产品对象，该对象中封装了部分产品信息， 查找数据库中所有满足条件的数据并返回
	 * 
	 * @return Collection 保存查询结果的集合
	 * @throws 抛出专门处理
	 *             product 类型的异常
	 */
	public Collection find(Product product) throws ManagerProductException {
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			String sql = "";
			if (product.getAuthor().equals("")) {
				sql = "select * from product where author like '%'";
			} else {
				sql = "select * from product where author like '%"
						+ product.getAuthor() + "'";
			}
			if (product.getName().equals("")) {
				sql = "select * from product where name like '%'";
			} else {
				sql = "select * from product where name like '%"
						+ product.getName() + "'";
			}
			if (product.getPublish().equals("")) {
				sql = "select * from product where publish like '%'";
			} else {
				sql = "select * from product where publish like '%"
						+ product.getPublish() + "'";
			}

			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));

				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return list;
	}

	
	/**
	 * 分页查询方法
	 * @param start 查询结果的开始下标
	 * @param max   查询结果的个数
	 */
	public Collection find(int start, int max) throws ManagerProductException {
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectAllPage);
			ps.setInt(1, start);
			ps.setInt(2, max);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));

				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return list;
	}
	
	public Collection findByName(String name) throws ManagerProductException {
		System.out.println("开始在数据库中查询 findByName：............");
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectByName);
			ps.setString(1, name);

			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));
				
				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}
		System.out.println("按书名查询得到list："+list);
		return list;
	}
	
	public Collection findByAuthor(String author) throws ManagerProductException {
		System.out.println("开始在数据库中查询 findByAuthor：............");
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectByAuthor);
			ps.setString(1, author);

			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));
				
				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}
		System.out.println("按作者名查询得到list："+list);
		return list;
	}
	
	public Collection findByPublish(String pub) throws ManagerProductException {
		System.out.println("开始在数据库中查询 findByPublish：............");
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectByPublish);
			ps.setString(1, pub);

			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));
				
				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}
		System.out.println("按出版社名查询得到list："+list);
		return list;
	}
	
	public int getNTotal(String name) throws ManagerProductException {
		int count = 0;

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectNameCount);
			ps.setString(1, name);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return count;
	}
	
	public int getATotal(String author) throws ManagerProductException {
		int count = 0;

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectAuthorCount);
			ps.setString(1, author);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return count;
	}
	
	public int getPTotal(String publish) throws ManagerProductException {
		int count = 0;

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectPublishCount);
			ps.setString(1, publish);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return count;
	}
	
	/**
	 * 按name查询 分页显示结果
	 * @param start 查询结果的开始下标
	 * @param max   查询结果的个数
	 */
	public Collection nFind(String name,int start, int max) throws ManagerProductException {
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectNamePage);
			ps.setString(1, name);
			ps.setInt(2, start);
			ps.setInt(3, max);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));

				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return list;
	}
	
	/**
	 * 按author查询 分页显示结果
	 * @param start 查询结果的开始下标
	 * @param max   查询结果的个数
	 */
	public Collection aFind(String author,int start, int max) throws ManagerProductException {
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectAuthorPage);
			ps.setString(1, author);
			ps.setInt(2, start);
			ps.setInt(3, max);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));

				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return list;
	}
	
	/**
	 * 按publish查询 分页显示结果
	 * @param start 查询结果的开始下标
	 * @param max   查询结果的个数
	 */
	public Collection pFind(String publish,int start, int max) throws ManagerProductException {
		List list = new ArrayList();

		// 定义数据库连接操作所需要的对象
		Connection conn = null;
		PreparedStatement ps = null;
		DBConnection dbc = null;
		ResultSet rs = null;

		// 定义数据库连接类对象，用于连接数据库
		try {
			dbc = new DBConnection();
			conn = dbc.getConnection();

			// 预处理 SQL 语句
			ps = conn.prepareStatement(this.selectPublishPage);
			ps.setString(1, publish);
			ps.setInt(2, start);
			ps.setInt(3, max);
			
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();

				p.setProductId(new Integer(rs.getInt("product_id")));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPrice(rs.getDouble("price"));
				p.setPages(rs.getInt("pages"));
				p.setPublish(rs.getString("publish"));
				p.setImage(rs.getString("image"));
				p.setDescription(rs.getString("description"));

				list.add(p);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbc.closeConnection(conn);
		}

		return list;
	}
}