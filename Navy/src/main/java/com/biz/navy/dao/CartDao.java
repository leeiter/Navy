package com.biz.navy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.biz.navy.domain.CartVO;

public interface CartDao {
 
	// 장바구니 보기용 SELECT
	@Select("select C.bk_id, P.p_code, P.p_name, C.username, C.bk_p_oprice, C.bk_p_qty from tbl_cart C"
			+ " LEFT JOIN tbl_product P ON C.bk_p_code = P.p_code "
			+ " where username = #{username} AND p_status = 'CART' ")
	public List<CartVO> selectCart(@Param("username")String username);

	// 관리자가 현재 카트에 몇건이나 담겨있는지 조회할 때
	@Select("select count(*) from tbl_cart where p_status = 'CART' ")
	public int countCart();

	// 주문완료 후 배송중 SELECT
	@Select("select * from tbl_cart where username = #{username} AND p_status = 'DELIV' ")
	public List<CartVO> selectDelivery(@Param("username")String username);
	
	// 관리자가 현재 배송중인 상품이 몇건이나 되는지 조회할 때 
	@Select("select count(*) from tbl_cart where p_status = 'DELIV' ")
	public int countDelivery();
	
	@Update("UPDATE tbl_cart set p_qty = #{p_qty} where seq = #{seq} ")
	public int qty_update(@Param("seq")long seq, @Param("p_qty")int p_qty) ;

	public int cart_list_delete(List<String> strSeqList);

	public int cart_to_delivery(List<String> buyList);
	

}
