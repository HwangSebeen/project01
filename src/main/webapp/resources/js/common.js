/**
 * 공통 js
 */
 
 // 관리지점목록 조회 ajax
function fn_selectOfficeList(selectBoxId){
	
	$.ajax({
        type: "POST" ,
        url: "/login/selectOfficeList.do",
        contentType: "application/json; charset=UTF-8",
        dataType: 'json',
        success: function (result) {
        	
            $("#"+selectBoxId).append('<option value="">-선택-</option>');
            var laborOption = "";
            for(var k in result){
       			var OFFICE_NO = result[k].OFFICE_NO;
        	    var OFFICE_NM = result[k].OFFICE_NM;
       			laborOption = '<option value="' + OFFICE_NO + '">' + OFFICE_NM + '</option>';
       	
       	          $('#'+selectBoxId).append(laborOption); 
       	      }
        },
        error:function(){
        	alert("관리지점을 불러오지 못했습니다.");
        }
    });
}