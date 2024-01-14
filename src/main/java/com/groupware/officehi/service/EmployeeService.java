package com.groupware.officehi.service;

import java.io.File;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.groupware.officehi.domain.Paging;
import com.groupware.officehi.dto.EmployeeDTO;
import com.groupware.officehi.dto.FileDTO;
import com.groupware.officehi.repository.EmployeeRepository;

import lombok.RequiredArgsConstructor;

/**
 * @author 박재용
 * @editDate 23.12.20 ~ 23.12.22 페이지네이션 기능 추가 23.12.23 ~ 23.12.25 파일 업로드 및 수정
 *           비즈니스로직 추가 23.12.26 ~ 23.12.29
 */

@Service
@RequiredArgsConstructor
public class EmployeeService {

	private final EmployeeRepository employeeRepository;
	private final HttpSession session;

	public void insertUserInfo(EmployeeDTO employeeDTO) {
		employeeRepository.insert(employeeDTO);
	}

	public void insertFileInfo(FileDTO fileDTO) {
		MultipartFile multipartFile = fileDTO.getMultipartFile();

		if (multipartFile.getSize() != 0) {
			String filePath = session.getServletContext().getRealPath("/")
					+ employeeRepository.getFilePathByFileTypeNo(fileDTO.getFileTypeNo());

			String currentTime = Long.toString(System.currentTimeMillis());
			String originalFileName = multipartFile.getOriginalFilename();
			String convertFileName = String.format("%s_%s", currentTime, originalFileName);

			// OS 별 다른 구분자 교체
			filePath = filePath.replace("/", File.separator).replace("\\", File.separator);

			File file = new File(filePath, convertFileName);

			try {
				// file 물리저장
				multipartFile.transferTo(file);

				// filePath DB 저장
				fileDTO.setFileName(convertFileName);
				fileDTO.setOriginalFileName(originalFileName);
				fileDTO.setFilePath(filePath);
				employeeRepository.insertFileInfo(fileDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public Optional<EmployeeDTO> findUserInfoByUserNo(Long userNo) {
		return employeeRepository.findUserInfoByUserNo(userNo);
	}

	public Optional<FileDTO> findProfileFileByUserNo(Long userNo) {
		return employeeRepository.findProfileFileByUserNo(userNo);
	}

	public Optional<FileDTO> findStampFileByUserNo(Long userNo) {
		return employeeRepository.findStampFileByUserNo(userNo);
	}

	public void updateUserInfo(EmployeeDTO employeeDTO) {
		employeeRepository.update(employeeDTO);

	}

	public void updateFileInfo(FileDTO fileDTO) {
		MultipartFile multipartFile = fileDTO.getMultipartFile();

		if (multipartFile.getSize() != 0) {
			String filePath = session.getServletContext().getRealPath("/")
					+ employeeRepository.getFilePathByFileTypeNo(fileDTO.getFileTypeNo());

			String currentTime = Long.toString(System.currentTimeMillis());
			String originalFileName = multipartFile.getOriginalFilename();
			String convertFileName = String.format("%s_%s", currentTime, originalFileName);
			filePath = filePath.replace("/", File.separator).replace("\\", File.separator);

			File file = new File(filePath, convertFileName);

			try {
				multipartFile.transferTo(file);
				
				fileDTO.setFileName(convertFileName);
				fileDTO.setOriginalFileName(originalFileName);
				fileDTO.setFilePath(filePath);
				employeeRepository.updateFileInfo(fileDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void retiredUserInfo(Long userNo) {
		employeeRepository.updateFromDate(userNo);
	}

	public List<EmployeeDTO> findAllEmployee(Paging paging) {
		return employeeRepository.findAll(paging);
	}

	public List<EmployeeDTO> findAllByName(String name, Paging paging) {
		return employeeRepository.findAllByName(name, paging);
	}

	public List<EmployeeDTO> findAllByUserNo(Long userNo, Paging paging) {
		return employeeRepository.findAllByUserNo(userNo, paging);
	}

	public List<EmployeeDTO> findAllByDeptName(String deptName, Paging paging) {
		return employeeRepository.findAllByDeptName(deptName, paging);
	}

}