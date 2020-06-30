/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function mueveReloj() {
    var today = new Date();
    var todayThreeMinutesLess = new Date();
    today = todayThreeMinutesLess.toLocaleString('en-US', {timeZone: 'America/Denver', hour12: false}).replace(', ', ' ');

    horaImprimible = "Time Denver " + today;

    document.getElementById('relojDenver').value = "";
    document.getElementById('relojDenver').value = horaImprimible;
    setTimeout("mueveReloj()", 1000);
}