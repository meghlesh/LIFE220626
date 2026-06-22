package com.cws.cwslife.util;

import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class ImageCompressionUtil {

	public static void compressSmall(File input, File output)
	        throws IOException {

	    Thumbnails.of(input)
	            .size(640, 480)
	            .outputQuality(0.6)
	            .toFile(output);
	}

	public static void compressMedium(File input, File output)
	        throws IOException {

	    Thumbnails.of(input)
	            .size(1280, 720)
	            .outputQuality(0.7)
	            .toFile(output);
	}

	public static void compressLarge(File input, File output)
	        throws IOException {

	    Thumbnails.of(input)
	            .size(1920, 1080)
	            .outputQuality(0.8)
	            .toFile(output);
	}
}