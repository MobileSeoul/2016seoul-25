package com.food.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import com.food.domain.MemberVO;
import com.food.services.Member.MemberService;
import com.food.util.MediaUtils;
import com.food.util.UploadFileUtils;

@Controller
@RequestMapping("/")
public class MemberController {
	
	@Resource(name="uploadPathRegister")
	private String uploadPathRegister;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void ft_registergGET(MemberVO member, Model model) throws Exception {

		logger.info("회원가입이느니라!!!");
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView ft_registerPOST(MemberVO vo /*, RedirectAttributes rttr*/) throws Exception {
		logger.info("푸드트럭 회원가입");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("login"));
		
		MultipartFile file1 = vo.getFile1();
		MultipartFile file2 = vo.getFile2();
		
		if(file1 !=null){
			logger.info("원래파일이름 :" + file1.getOriginalFilename());
			logger.info("사이즈: " + file1.getSize());
			logger.info("타입: " + file1.getContentType());
		}else if (file2 != null){
			logger.info("원래파일이름 :" + file2.getOriginalFilename());
			logger.info("사이즈: " + file2.getSize());
			logger.info("타입: " + file2.getContentType());
		}
		logger.info("---------------------------------------");
		String u_profile_img = UploadFileUtils.uploadFile(uploadPathRegister, file1.getOriginalFilename(), file1.getBytes());
		String co_doc = UploadFileUtils.uploadFile(uploadPathRegister, file2.getOriginalFilename(), file2.getBytes());
		logger.info(u_profile_img);
		logger.info(co_doc);
		vo.setU_profile_img(u_profile_img);
		vo.setCo_doc(co_doc);
		
		logger.info(vo.toString());
		service.insert(vo);
	/*	rttr.addFlashAttribute("result", "success");*/
		
		return mav;
	}
	
	@ResponseBody
    @RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public String idcheck(@RequestBody String u_id) throws Exception {
		logger.info("여기는오삼?");
	     logger.info(""+service.idcheck(u_id));
	     return service.idcheck(u_id);
	}

	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(Model model, String u_id)throws Exception{
		logger.info("회원가입 수정 화면");
		model.addAttribute("modify", service.view(u_id));
		 logger.info(""+service.view(u_id));
		return "modify";
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modifyPOST(MemberVO vo)throws Exception{
		logger.info("회원가입 수정 (update)할꺼에여");
		
			MultipartFile file = vo.getFile1();
		
		if(file != null){
			//파일다운로드 해줄꺼에요
			String u_profile_img = UploadFileUtils.uploadFile(uploadPathRegister, file.getOriginalFilename(), file.getBytes());
			//파일이 있으면, 들어간 파일 정보 알려주고, 이미지 값 넣어준다
				logger.info("원래파일이름 :" + file.getOriginalFilename());
				logger.info("사이즈: " + file.getSize());
				logger.info("타입: " + file.getContentType());
				vo.setU_profile_img(u_profile_img);
				logger.info(u_profile_img);
		}
		logger.info(vo.toString());
		service.update(vo);
	}
	
	//전송된 파일을 화면에 표시해주기 (대상 파일 데이터 읽기)
		//특정 경로의 파일을 다시 브라우저로 전송해 주는 기능
		@ResponseBody
		@RequestMapping("/displayProfile")
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
		      
		      in = new FileInputStream(uploadPathRegister+fileName);
		      
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
	

}

