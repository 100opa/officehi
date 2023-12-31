package com.groupware.officehi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.groupware.officehi.dto.WorkDTO;

/**
 * @author 박재용
 * @editDate 23.12.19 ~23.12.22
 */

@Repository
public interface WorkRepository {

	int insert(WorkDTO work);

	int update(WorkDTO work);

	Integer checkDateDuplicate(Long userNo);

	List<WorkDTO> findWorkTimeByUserNo(@Param("userNo") Long userNo);
}
