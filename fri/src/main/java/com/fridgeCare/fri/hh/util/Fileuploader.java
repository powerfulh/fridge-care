package com.fridgeCare.fri.hh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Fileuploader {
	MultipartFile files;
	String uploadpath , exportpath , noimage;
	FileInputStream input;
	FileOutputStream output;
	public Fileuploader(MultipartFile uploadtarget) {
		files = uploadtarget;
		uploadpath = this.getClass().getResource("").getPath();
		uploadpath = uploadpath.substring(0, uploadpath.indexOf("/classes")) + "/upload/";
		
		File f = new File(uploadpath);
		if(!f.exists()) {
			System.out.println("make upload dir = " + f.mkdir());
		}
//		f = new File(downloadpath);
//		if(!f.exists()) {
//			System.out.println("make download dir = " + f.mkdir());
//		}
	}
	public Fileuploader() {
		uploadpath = this.getClass().getResource("").getPath();
		uploadpath = uploadpath.substring(0, uploadpath.indexOf("/classes")) + "/upload/";
		noimage = "C:/Users/class02/git/fridgeCare/fri/src/main/webapp/resources/img/avatar/noimage.jpg";
		File f = new File(uploadpath);
		if(!f.exists()) {
			System.out.println("make upload dir = " + f.mkdir());
		}
	}
	public File upload() {
		uploadpath += files.getOriginalFilename();
		File f = new File(uploadpath);
		try {
			files.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return f;
	}
	public String rename(String oriname , int bno , int i) {
		String left = oriname.substring(0, oriname.lastIndexOf('.'));
		String right = oriname.substring(oriname.lastIndexOf('.'));
		oriname = bno + left + i + right;
		return oriname;
	}
	public File export_avt(File f , String id) {
//		String ext = f.getName().substring(f.getName().lastIndexOf('.'));
		exportpath = "C:\\Users\\hanho\\git\\fridgeCare\\fri\\src\\main\\webapp\\resources\\img\\avatar\\" + id + "_avt_" + f.getName();
//		exportpath = "C:\\Users\\class02\\git\\fridgeCare\\fri\\src\\main\\webapp\\resources\\img\\avatar\\" + id + "_avt_" + f.getName();
		File n = new File(exportpath);
		try {
			input = new FileInputStream(f);
			output = new FileOutputStream(n);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			int piece;
			while((piece = input.read()) != -1) {
				output.write(piece);
			}
			input.close();
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return n;
	}
	public File export_avt(String id) {
		exportpath = "C:\\Users\\hanho\\git\\fridgeCare\\fri\\src\\main\\webapp\\resources\\img\\avatar\\" + id + "_avt_" + "noimage.jpg";
//		exportpath = "C:\\Users\\class02\\git\\fridgeCare\\fri\\src\\main\\webapp\\resources\\img\\avatar\\" + id + "_avt_" + "noimage.jpg";
		File f = new File(noimage);
		File n = new File(exportpath);
		try {
			input = new FileInputStream(f);
			output = new FileOutputStream(n);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			int piece;
			while((piece = input.read()) != -1) {
				output.write(piece);
			}
			input.close();
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return n;
	}
}
