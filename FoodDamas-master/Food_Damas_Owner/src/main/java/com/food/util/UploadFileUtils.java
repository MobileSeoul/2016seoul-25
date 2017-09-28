package com.food.util;


import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData)throws Exception{

	    UUID uid = UUID.randomUUID();
	    //������ ����� ���� �̸�
	    String savedName = uid.toString() +"_"+originalName;
	    //����� ��� //c:/zzz/upload/��/��/�� + (uuid+���������̸�)
	    String savedPath = calcPath(uploadPath);
	    logger.info("savedName="+savedName);
	    File target = new File(uploadPath +savedPath,savedName);
	    //�������� �����ϴ� �κ�
	    FileCopyUtils.copy(fileData, target);
	    
	    //���� ������ Ȯ����
	    String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
	    
	    String uploadedFileName = null;
	 
	    //���� �̹��� �����̸� ����Ϸ� �����ְ� 
	    if(MediaUtils.getMediaType(formatName) != null){
	      uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
	    }else{//�ƴϸ� �����ܰ���� ���弼��
	      uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
	    }
	    
	    return uploadedFileName;
	}
	
	 private static  String makeIcon(String uploadPath, 
		      String path, 
		      String fileName)throws Exception{

		    String iconName = 
		        uploadPath + path + File.separator+ fileName;
		    
		    return iconName.substring(
		        uploadPath.length()).replace(File.separatorChar, '/');
		  }

	 // /��/��/�� �������� ���糯¥ �޾ƿ���
	private static String calcPath(String uploadPath){
		    
		    Calendar cal = Calendar.getInstance();
		    
		    String yearPath = File.separator+cal.get(Calendar.YEAR);
		    
		    String monthPath = yearPath + 
		        File.separator + 
		        new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);

		    String datePath = monthPath + 
		        File.separator + 
		        new DecimalFormat("00").format(cal.get(Calendar.DATE));
		    
		    makeDir(uploadPath, yearPath,monthPath,datePath);
		    
		    logger.info(datePath);
		    
		    return datePath;
		  }
		//���� �������ִ� ��
	 private static void makeDir(String uploadPath, String... paths){
		    
		    if(new File(paths[paths.length-1]).exists()){
		      return;
		    }
		    for (String path : paths) {
		      File dirPath = new File(uploadPath + path);
		      
		      if(! dirPath.exists() ){
		        dirPath.mkdir();
		      } 
		    }
	  }
	 
	 private static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception{
		 //BufferedImage->�޸� ���� �̹��� ���������� �޸𸮻����� �ε��ϰ�, ������ ũ�⿡ �°� ���� �̹��� ���Ͽ� �����̹����� ����
		 BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path, fileName));
		// BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		 
		 //����� ���ϸ��� s_�� �����ϵ���
		 String thumnailName = uploadPath+path+ File.separator+ fileName;
		 
		 File newFile = new File(thumnailName);
		 String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		 
		// ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		 return thumnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	 }
	 
	 
	  
	 
}
