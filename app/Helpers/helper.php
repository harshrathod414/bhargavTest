<?php

function getFormatDate($date)
{
    return date("d-m-Y", strtotime($date)); // $newDate = date();  
}
