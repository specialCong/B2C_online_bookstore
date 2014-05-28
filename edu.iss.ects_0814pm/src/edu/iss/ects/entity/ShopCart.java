package edu.iss.ects.entity;

/**
 * @author Microwind
 *
 */
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class ShopCart {

	private Map items = new HashMap();

	public void add(Orderline line) {
		Integer product_id = line.getProduct().getProductId();
		Orderline orderLine = (Orderline) items.get(product_id);
		if (orderLine == null) {
			items.put(product_id, line);
		} else {
			orderLine.setAmount(orderLine.getAmount() + line.getAmount());
			items.put(product_id, orderLine);
		}
	}

	public void remove(Orderline line) {
		Integer product_id = line.getProduct().getProductId();
		items.remove(product_id);
	}

	public void remove(Integer id) {
		items.remove(id);
	}

	public void modify(Orderline line) {
		Integer product_id = line.getProduct().getProductId();
		items.put(product_id, line);
	}

	public double getTotal() {
		double total = 0;
		Set set = items.keySet();
		Iterator it = set.iterator();
		while (it.hasNext()) {
			Integer id = (Integer) it.next();
			Orderline line = (Orderline) items.get(id);
			total += line.getProduct().getPrice() * line.getAmount();
		}
		return total;
	}

	public int getCount() {
		int count = 0;
		Set set = items.keySet();
		Iterator it = set.iterator();
		while (it.hasNext()) {
			Integer id = (Integer) it.next();
			Orderline line = (Orderline) items.get(id);
			count += line.getAmount();
		}
		return count;
	}

	public int getSize() {
		return items.size();
	}

	public Orders getOrder() {
		Orders order = new Orders();
		Set set = new HashSet();
		Collection list = items.values();
		set.addAll(list);
		order.setOrderlines(set);
		return order;
	}

	public void clearCart() {
		items.clear();
	}

	public Map getItems() {
		return items;
	}

	public void setItems(Map items) {
		this.items = items;
	}

}
