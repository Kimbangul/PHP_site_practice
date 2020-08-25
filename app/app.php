<?php

class App{
    public static function isLogined(): bool{

        if (isset($_SESSION['loginedMemberId'])){
            return true;
        }
        return false;

    }
}

