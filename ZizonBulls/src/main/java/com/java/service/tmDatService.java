package com.java.service;

import java.util.List;

import com.java.domain.tmDatVO;

public interface tmDatService {

	// CRUD 기능 메소드
	
	void inserttmDat(tmDatVO vo);
	void updatetmDat(tmDatVO vo);
	void deletetmDat(tmDatVO vo);
	tmDatVO gettmDat(tmDatVO vo);
	List<tmDatVO> gettmDatList(tmDatVO vo);
	void updateCnttmDat(tmDatVO vo);
	tmDatVO tmDatGetFileName(tmDatVO vo);
	int gettmDatListCnt(tmDatVO vo);
	List<tmDatVO> searchList(tmDatVO vo);
}
