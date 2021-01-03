package com.fridgeCare.fri.juhyun;

import java.io.*;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.fridgeCare.fri.juhyun.vo.FileVO;

/**
 * 이 클래스는 파일 업로드에 필요한 기능을 처리하기 위해 만든 유틸리티 적인 클래스이다.
 * @author	전은석
 * @since	2020/12/10
 * @version	v.1.0
 *
 */
public class FileUtil {
	/*
		파일 이름이 중복되면 덮어쓰기를 하게 된다.
		따라서 혹시 같은 이름의 파일이 존재하면
		파일이름을 바꿔서 저장할 필요가 있다.
	 */
	
	// 같은 이름의 파일이 존재하면 파일의 이름을 바꿔주는 함수를 만들자.
	public String rename(String path, String oldName) {
		/*
			혹시 같은 이름의 파일이 존재하면 (번호)를 붙여서 이름을 바꾸는 형식으로 만들자.
			
			예 ]
				sample.txt		---> sample(1).txt  ---> sample(2).txt
		 */
		int count = 0;	// 뒤에 붙일 번호를 기억할 변수
		String savename = oldName; // 저장 이름 기억할 변수
		
		String tmp = oldName;	//  현재 이름을 기억할 변수
		File file = new File(path, savename);
		
		// . 을 기준으로 앞의 내용(이름)과 뒤의 내용(확장자)을 분리한다.
		int len = tmp.lastIndexOf('.');
		
//		if(len == -1) return null;
		
//		System.out.println("######### len : " + len);
		String fileName = tmp.substring(0, len); // 파일 이름
		String fileExt = tmp.substring(len + 1); // 확장자
		
		while(file.exists()) {
			// 같은 이름이 존재하는 경우가 발생하면 이름을 바꿔야 한다.
			// 붙일 번호를 증가시킨다.
			count++;
			
			// 분리된 것에 필요한 번호를 붙여서 다시 합친다.
			savename = fileName + "(" + count + ")." + fileExt;
			// 이 이름의 파일이 존재하는지 확인을 위해서
			// 다시 File 객체로 만들어 준다.
			file = new File(path, savename);
		}
		
		return savename; // 최종 저장 이름....
	}
	
	// 파일 업로드를 처리 함수
	public ArrayList<FileVO> saveProc(MultipartFile[] file, String dir) throws Exception {
		// 파일들 정보를 기억할 리스트 만들고
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		
		// 저장 경로 지정...
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources" + dir;
		
		for(int i = 0 ; i < file.length ; i++ ) {
			FileVO fVO = new FileVO();
			// 파일 원본이름을 알아낸다.
			String oriName = file[i].getOriginalFilename();
			// 만약 파일이 업로드 되지 않는 작업이라면 라면 이 파일은 지나가야 한다.
			if(oriName == null || oriName.length() == 0) { // oriName = "";
				continue;
			}
			
			// 같은 이름의 파일이 존재하는지 검사한다.
			
			String savename = rename(path, oriName);
			
			// 이제 임시로 업로드된 파일을 실제 저장경로에 저장해야 한다.
			// 그리고 이 이름은 데이터베이스에 등록할 때 사용해야 한다.
			fVO.setOriname(oriName);
			fVO.setSavename(savename);
			fVO.setLen(file[i].getSize());
			fVO.setDir(dir);
			
			File tmp = new File(path, savename);
			file[i].transferTo(tmp); // 실제 저장 경로에 저장해주는 함수
			
			list.add(fVO);
		}
		
		return list;
	}
}
