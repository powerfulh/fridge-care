package com.fridgeCare.fri.hh.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class Thumbnail {
	String ext , savepath;
	File f , t;
	int index;
	public Thumbnail(String filewhere) {
		savepath = this.getClass().getResource("").getPath();
		savepath = savepath.substring(0, savepath.indexOf("/classes")) + "/upload/";
		index = filewhere.lastIndexOf(".");
		ext = filewhere.substring(index+1);
		f = new File(filewhere);
		t = new File(savepath + "t_" + f.getName());
	}
	public File make(int w , int h) {
		BufferedImage img = null;
		try {
			img = ImageIO.read(f);
		} catch (IOException e) {
			e.printStackTrace();
		}
		BufferedImage newimg = new BufferedImage(w,h,BufferedImage.TYPE_3BYTE_BGR);
		Graphics2D drawer = newimg.createGraphics();
		Image load = img.getScaledInstance(w, h, Image.SCALE_SMOOTH);
		drawer.drawImage(load, 0, 0, w, h, null);
		drawer.dispose();
		try {
			ImageIO.write(newimg, ext, t);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("make success = " + t.getName());
		return t;
	}
}
