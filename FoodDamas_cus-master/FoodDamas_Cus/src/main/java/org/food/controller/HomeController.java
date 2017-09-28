package org.food.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.food.domain.PositionVO;
import org.food.service.TruckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   @Inject
   TruckService service;
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   @RequestMapping(value = "/home", method = RequestMethod.GET)
   public String home(Model model) {
      logger.info("home connected....");
      return "home";
   }

   @CrossOrigin
   @ResponseBody
   @RequestMapping(value = "/home/distance/{page}", method = RequestMethod.GET)
   public Map<String, Object> listGET(@PathVariable Integer page, double lat, double lng, String orderBy) throws Exception {
	  logger.info("distance connected....");
	  logger.info("page: " + page + " lat: " + lat+" lng: " + lng);
      Map<String, Object> result = new HashMap<>();
      PositionVO vo = new PositionVO();
      vo.setLat(lat);
      vo.setLng(lng);
      vo.setPage(page);
      logger.info(vo.toString());
      int distanceLength = service.distanceLength(vo);
      System.out.println("길이: "+service.distanceLength(vo));
      if (page > distanceLength) {
         return null;
      }
      result.put("result", service.orderByDistance(vo));
      result.put("totalLength", distanceLength);
      return result;
   }

   @CrossOrigin
   @ResponseBody
   @RequestMapping(value = "/home/grade/{page}", method = RequestMethod.GET)
   public Map<String, Object> gradeList(@PathVariable Integer page, double lat, double lng, String orderBy) throws Exception {
      logger.info("grade connected....");
      logger.info("page: " + page + " lat: " + lat+" lng: " + lng);
      Map<String, Object> result = new HashMap<>();
      PositionVO vo = new PositionVO();
      vo.setLat(lat);
      vo.setLng(lng);
      vo.setPage(page);
      logger.info(vo.toString());
      int distanceLength = service.gradeLength(vo);
      System.out.println("길이: "+distanceLength);
      if (page > distanceLength) {
         return null;
      }
      result.put("result", service.orderByGrade(vo));
      result.put("totalLength", distanceLength);
      return result;
   }

   @CrossOrigin
   @ResponseBody
   @RequestMapping(value = "/home/review/{page}", method = RequestMethod.GET)
   public Map<String, Object> reviewList(@PathVariable Integer page, double lat, double lng, String orderBy) throws Exception {
      System.out.println(orderBy);
      logger.info("review connected....");
      logger.info("page: " + page + " lat: " + lat+" lng: " + lng);
      Map<String, Object> result = new HashMap<>();
      PositionVO vo = new PositionVO();
      vo.setLat(lat);
      vo.setLng(lng);
      vo.setPage(page);
      logger.info(vo.toString());
      int distanceLength = service.reviewLength(vo);
      System.out.println("길이: "+distanceLength);
      if (page > distanceLength) {
         return null;
      }
      result.put("result", service.orderByReview(vo));
      result.put("totalLength", distanceLength);
      return result;
   }
}