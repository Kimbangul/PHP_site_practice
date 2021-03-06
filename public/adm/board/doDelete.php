<?php
$config = [];
$config['needToLogin'] = false;


// 관리자 페이지들을 위한 공통 작업
require_once $_SERVER['DOCUMENT_ROOT'] . '/../init/adm.php';

$board = ArticleService::getBoardById($_REQUEST['id']);

if (empty($board)){
    jsAlert("존재하지 않는 게시판 입니다.");
    jsHistoryBack();
}

ArticleService::deleteBoard($_REQUEST['id']);

jsAlert("{$_REQUEST['name']} 게시판이 삭제되었습니다.");
jsLocationReplace("/adm/board/list.php");