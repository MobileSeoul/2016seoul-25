package org.food.controller;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.CartVO;
import org.food.service.CartService;
import org.food.service.TruckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

@RequestMapping("/store")
public class CartController {
	@Inject
	CartService service;
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public void cartGET(Model model, String u_id, Integer sno) {
		logger.info("cart connected....");
		
		model.addAttribute("u_id", u_id);
		model.addAttribute("sno", sno);
		

	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/cartList/{c_id}")
	public List<CartVO> cartListGet(Model model, @PathVariable String c_id) {
		System.out.println(c_id);
		logger.info("cartList connected....");
		List<CartVO> vo= service.readCart("1");	
		return vo;
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/quantity", method={RequestMethod.PUT, RequestMethod.PATCH})
	public void cartPUT(Model model,@RequestBody CartVO vo) {
		logger.info("quantity connected....");
		service.updateQuantity(vo);
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method=RequestMethod.DELETE)
	public void deleteCartDELETE(Model model,@RequestBody Integer cno) {
		logger.info("deleteCart connected....");
		
		service.deleteCart(cno);
	}
	
    @CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/menucart", method = RequestMethod.POST)
	public void menucart(CartVO vo)throws Exception{
		logger.info("menucart..............");
		System.out.println(vo);
		/*logger.info(""+Cservice.toString());*/
		service.insertCart(vo);
	}
	
	
	
	
	
	

	
}
