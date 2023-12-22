package com.groupware.officehi.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.groupware.officehi.dto.NoticeDTO;

@Mapper
public interface NoticeRepository {
	void insertNotice(NoticeDTO notice);
	List<NoticeDTO> findAll();
	List<NoticeDTO> findByContent(String content);
	Optional<NoticeDTO> findById(Long noticeNo);
}
