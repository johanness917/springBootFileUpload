package com.zeus.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zeus.domain.Item;
import com.zeus.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MapperScan(basePackages = "com.zeus.mapper")
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ItemService itemService;

	// application.properties 에서 upload.path에 저장된 값을 주입
	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping("/createForm")
	public String itemCreateFrom(Model model) {
		log.info("/createForm");
		return "item/createForm";
	}

	@PostMapping("/create")
	public String itemCreate(Item item, Model model) throws IOException, Exception {
		log.info("/create item= " + item.toString());
		// 1. 파일업로드 한것을 가져올 것
		MultipartFile file = item.getPicture();
		// 2. 파일정보를 log파일에 기록한다.
		log.info("originalName: " + file.getOriginalFilename());
		log.info("size: " + file.getSize());
		log.info("contentType: " + file.getContentType());
		// 3. 파일을 외장하드에 저장할 것
		String createdFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

		// 4. 저장된 새로 생성된 파일명을 아이쳄 도메인에 저장하기
		item.setUrl(createdFileName);
		// 5. 테이블에 상품화면 정보를 저장
		int count = itemService.create(item);

		if (count > 0) {
			model.addAttribute("message", "%s 상품등록이 성공".formatted(file.getOriginalFilename()));
			return "item/success";
		}
		model.addAttribute("message", "%s 상품등록이 실패".formatted(file.getOriginalFilename()));
		return "item/failed";
	}

	@GetMapping("/list")
	public String itemList(Model model) throws Exception {
		log.info("/itemList");
		List<Item> itemList = itemService.list();
		model.addAttribute("itemList", itemList);
		return "item/list";
	}
	
	@GetMapping("/detail")
	public String itemDetaiel(Item item) throws Exception {
		log.info("/detail");
		List<Item> itemList = itemService.list();
		model.addAttribute("itemList", itemList);
		return "item/list";
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// 절대 중복되지 않는 문자열 생성(uid3b2688fb-f4ab-4138-aeef-2cff52052636)
		UUID uid = UUID.randomUUID();
		// uid3b2688fb-f4ab-4138-aeef-2cff52052636_파일이름.jpg
		String createdFileName = uid.toString() + "_" + originalName;
		// new File("D:/upload",uid3b2688fb-f4ab-4138-aeef-2cff52052636_파일이름.jpg)
		// D:/upload/uid3b2688fb-f4ab-4138-aeef-2cff52052636_파일이름.jpg 생성 내용이 없는 파일명만 생성
		File target = new File(uploadPath, createdFileName);
		// (파일내용이 있는 바이트배열)byte[] fileData 을
		// D:/upload/uid3b2688fb-f4ab-4138-aeef-2cff52052636_파일이름.jpg 복사진행
		FileCopyUtils.copy(fileData, target);
		return createdFileName;
	}
}
