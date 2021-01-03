package com.fridgeCare.fri.joo;

import java.io.File;
import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.web.multipart.MultipartFile;

import com.fridgeCare.fri.joo.vo.*;

public class JFileUtil {
	public String rename(String path, String oldName) {
		int count = 0;
		String savename = oldName;
		
		String tmp = oldName;
		File file = new File(path, savename);
		
		int len = tmp.lastIndexOf('.');
		String fileName = tmp.substring(0, len); // 파일 이름
		String fileExt = tmp.substring(len + 1); // 확장자
		
		while(file.exists()) {
			count++;
			savename = fileName + "(" + count + ")." + fileExt;
			file = new File(path, savename);
		}
		
		return savename; // 최종 저장 이름....
	}
	
	public ArrayList<JRecipeVO> saveProc(MultipartFile[] file, String dir) throws Exception{
		ArrayList<JRecipeVO> list = new ArrayList<JRecipeVO>();
		
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources" + dir;
		System.out.println(file[0].getOriginalFilename());
		for (int i = 0; i < file.length; i++) {
			JRecipeVO jrVO = new JRecipeVO();
			String oriName = "";
			oriName = file[i].getOriginalFilename();
			String savename = "";
			try{
				savename = rename(path, oriName);
			} catch(Exception e) {
				System.out.println("############### error");
			}
			
			if(oriName == null || oriName.length() == 0) {
			} else {
				jrVO.setOriname(oriName);
				jrVO.setSavename(savename);
				jrVO.setDir(dir);
				File tmp = new File(path, savename);
				file[i].transferTo(tmp);
			}
		
			list.add(jrVO);
		}
		
		return list;
	}
	
	public JTumbVO saveProc(MultipartFile file, String dir) throws Exception{
		JTumbVO jtVO = new JTumbVO();
		
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources" + dir;
		
		String oriName = file.getOriginalFilename();
		
		if(oriName == null || oriName.length() == 0) {
			System.out.println("썸네일이 인식되지 않았다. 원인을 찾아야 한다");
			return null;
		}	
		
		StringTokenizer st = new StringTokenizer(oriName);
		oriName = "";
		while(st.hasMoreTokens()) {
			oriName += st.nextToken();
		}
		String savename = rename(path, oriName);
		jtVO.setTname(savename);
		jtVO.setDir(path + savename);
		
		File tmp = new File(path, savename);
		file.transferTo(tmp);
		
		return jtVO;
	}
}
