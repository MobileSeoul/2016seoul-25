package com.food.controller;

import java.io.File;
import java.io.FileInputStream;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.apache.commons.io.IOUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.food.domain.MenuVO;
import com.food.services.Menu.MenuService;
import com.food.util.MediaUtils;
import com.food.util.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
 @Controller
 @RequestMapping("/")
public class MenuController {

	@Resource(name = "uploadPath")
	private String uploadPath;

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

	@Inject
	private MenuService service;

	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public void nothing() throws Exception {
		logger.info("그냥 열어주는애");
		//List<MenuVO> list = service.list();
		//System.out.println(list);
	}

	@ResponseBody
	@RequestMapping(value = "/all/{u_id}", method = RequestMethod.GET)
	public Map<String, Object> menulist(@PathVariable("u_id") String u_id) throws Exception {
		logger.info("list를 뿌려주고싶어요");
		//List<MenuVO> list = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();
		//System.out.println(u_id);
		result.put("list", service.select(u_id));
		return result;
	}

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void insertMenu(MenuVO vo, Model model) throws Exception {
		logger.info("menu를 등록할꺼에요");
		
		MultipartFile file = vo.getFile();
		
		//String m_img = vo.getFile().getOriginalFilename();
		
		//logger.info("m_img : "+ m_img);
		if(file != null){
			logger.info("원래파일이름 :" + file.getOriginalFilename());
			logger.info("사이즈: " + file.getSize());
			logger.info("타입: " + file.getContentType());
		}
		
		logger.info("----------------------------------");
		//파일 서버에 다운로드 해줄꺼에요
		String m_img = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		/////질문!!!!!!!!!!!!!!!!!!! 여기서 savedName을 어떻게 jsp에서 뿌려주나?
		//vo에 savedName을 담아서 jsp에서 뿌려주는거 아닌가요?
		logger.info(m_img);
		//String img = m_img.substring(12);
		vo.setM_img(m_img);
		logger.info("이거는옴?"+vo.getM_img());
		//vo.setSavedName(m_img);
		logger.info("-----------집어넣었을까? 이렇게 집어넣는거 맞나?---------");
		logger.info(vo.toString());
		service.insert(vo);
	}
	
	//전송된 파일을 화면에 표시해주기 (대상 파일 데이터 읽기)
	//특정 경로의 파일을 다시 브라우저로 전송해 주는 기능
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{
	    //파라미터로 브라우저에서 보고 싶은 파일의 이름을 받는다
		//결과는 실제로 파일의 데이터를 나타낸댜
	    InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    try{
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      //MediaType에서 확장자 추출하고 이미지타입일 때 MIME타입 지정 -> 확장자 추출해 주는곳!!! ->지금 나한테 필요없는거가튼데...
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      in = new FileInputStream(uploadPath+fileName);
	      
	      if(mType != null){
	        headers.setContentType(mType);
	      }else{
	        fileName = fileName.substring(fileName.indexOf("_")+1); 
	        //이미지 아닐 때 
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition", "attachment; filename=\""+ 
	          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	      }
	      	//IOUtils.toByteArray->실제로 데이터를 읽는 부분
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
	          headers, 
	          HttpStatus.CREATED);
	    }catch(Exception e){
	      e.printStackTrace();
	      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally{
	      in.close();
	    }
	      return entity;    
	  }
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void updateMenu(MenuVO vo, Model model)throws Exception{
		logger.info("update는 되는거니?");
		
		MultipartFile file = vo.getFile();
		
		if(file != null){
			//파일다운로드 해줄꺼에요
			String m_img = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			//파일이 있으면, 들어간 파일 정보 알려주고, 이미지 값 넣어준다
				logger.info("원래파일이름 :" + file.getOriginalFilename());
				logger.info("사이즈: " + file.getSize());
				logger.info("타입: " + file.getContentType());
				vo.setM_img(m_img);
			System.out.println(vo);
		}
		logger.info(vo.toString());

		service.update(vo);
	}
	
	//버튼으로 메뉴 올리는 상태
	@ResponseBody
	@RequestMapping(value="/updateState", method=RequestMethod.POST)
	public void updateState(MenuVO vo)throws Exception{
	     logger.info("on/off 버튼 누르셨어요!");
	     service.updateState(vo);
	     logger.info(vo.toString());
	   }
	
	//첨부파일 삭제
	 @ResponseBody
	  @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	  public ResponseEntity<String> deleteFile(String fileName, MenuVO vo) throws Exception{
	    logger.info("삭제!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		 //삭제할 파일 이름!!
	    logger.info("delete file: "+ fileName);
	    
	    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	    
	    MediaType mType = MediaUtils.getMediaType(formatName);
	    
	    if(mType != null){      
	      
	      String front = fileName.substring(0,12);
	      String end = fileName.substring(14);
	      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
	    }
	    
	    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
	    
		logger.info("삭제할꺼야?????");
		service.delete(vo);
		logger.info("여기도되?!!!!!!!!!!!!!!!!!!!!!!");
	    return new ResponseEntity<String>("deleted", HttpStatus.OK);
	  }
	
	
	
}
