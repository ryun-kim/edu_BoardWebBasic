package com.koreait.basic.board.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class BoardCmtVO {
    private int icmt;
    private int iboard;
    private int writer;
    private String rdt;
    private String writerNm;
    private String ctnt;
}
