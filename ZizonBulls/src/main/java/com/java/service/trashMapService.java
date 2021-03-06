package com.java.service;

import java.util.List;

import com.java.domain.trashMapVO;

public interface trashMapService {

	// CRUD 기능 메소드
	
	void insertTrashMap(trashMapVO vo);
	void updateTrashMap(trashMapVO vo);
	void deleteTrashMap(trashMapVO vo);
	trashMapVO getTrashMap(trashMapVO vo);
	List<trashMapVO> getTrashMapList();
	void updateCntTrashMap(trashMapVO vo);
	trashMapVO trashMapGetFileName(trashMapVO vo);
	int getTrashMapListCnt(trashMapVO vo);
	List<trashMapVO> searchList(trashMapVO vo);
}
