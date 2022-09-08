<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/d0bd04d7fd.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript">
    $(document).ready(function() {
      let weatherIcon = {
        '01' : 'fas fa-sun',
        '02' : 'fas fa-cloud-sun',
        '03' : 'fas fa-cloud',
        '04' : 'fas fa-cloud-meatball',
        '09' : 'fas fa-cloud-sun-rain',
        '10' : 'fas fa-cloud-showers-heavy',
        '11' : 'fas fa-poo-storm',
        '13' : 'far fa-snowflake',
        '50' : 'fas fa-smog'
      };
    $.ajax({
    url:'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=42b46f80ab5f222ef4545acef775a697&units=metric',

    dataType:'json',
    type:'GET',
    success:function(data){
      var $Icon = (data.weather[0].icon).substr(0,2);
      var $Temp = Math.floor(data.main.temp) + 'º';
      var $city = data.name;
      var $weath = data.weather[0].description;
	  var $weather = (data.weather[0].weath);
      $('.CurrIcon').append($weath);
      $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
      $('.CurrTemp').prepend($Temp);
      $('.City').append($city);
      location.href='main.do?text='+$weath;
      }
    })
    });
  </script>