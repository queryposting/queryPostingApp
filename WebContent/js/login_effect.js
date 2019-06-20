//var signupModal = document.getElementById("sign_up_Modal");
//  var span = document.getElementById("signup")
//
//$(document).ready(function(){
//	$("#myModal").modal('show');
//	span.onclick = (function(){
//	 console.log("inside signup click");
//	 
//	 $("#sign_up_Modal").modal('show');
//	 $("#myModal").modal('hide');
//	 //signupModal.style.display = "block";
//	    console.log("modal value: "+signupModal);
//
//	});  
//
//
//
//	   });
//
//function validateForm(){
//	var loginId = document.getElementById('exampleInputEmail1').value;
//	var password = document.getElementById('exampleInputPassword1').value;
//	//console.log(loginId);
//	//console.log(password);
//
//	if (loginId != "" && password != "") {
//		//$('#loginUser').html('<h6>' + loginId + '</h6>');
//		//document.getElementById("loginFrm").submit();
//		return true;
//	} else {
//		//alert("User Id and password cannot be blank");
//		$('#blank').html('<h5 style="color:red;">User Id or password cannot be blank</h5>');
//		//document.getElementById("loginFrm").reset();
//		return false;
//	}
//}
// window.onload = function(){
//     $("#myModal").modal('show');
// };
// $("#loginBtn").click(function()){
//        $("#myModal").modal('show');
//    };

var signupModal = document.getElementById("sign_up_Modal");
var span = document.getElementById("signup");

$(document).ready(function() {
	$("#myModal").modal('show');
	span.onclick = (function() {
		console.log("inside signup click");

		$("#sign_up_Modal").modal('show');
		$("#myModal").modal('hide');
		// signupModal.style.display = "block";
		console.log("modal value: " + signupModal);

	});
	
	$('#password, #conpass').on('keyup', function () {
		console.log('password : ' + $('#password').val());
		console.log('confirm password : ' + $('#conpass').val());
		  if ($('#password').val() == $('#conpass').val()) {
		    $('#message').html('Matching').css('color', 'green');
		  } else 
		    $('#message').html('Not Matching').css('color', 'red');
		});

});

function validateForm() {
	var loginId = document.getElementById('exampleInputEmail1').value;
	var password = document.getElementById('exampleInputPassword1').value;
	console.log(loginId);
	console.log(password);

	if (loginId != "" && password != "") {
		// $('#loginUser').html('<h6>' + loginId + '</h6>');
		// document.getElementById("loginFrm").submit();
		return true;
	} else {
		// alert("User Id and password cannot be blank");
		$('#blank')
				.html(
						'<h5 style="color:red;">User Id or password cannot be blank</h5>');
		// document.getElementById("loginFrm").reset();
		return false;
	}
}

/*function fetchData(){
	console.log("called.....");
	var searchData = document.getElementById('search').value;
	console.log("data....." + searchData);
	$.ajax({url: "search?question="+searchData, success: function(response){
	    $("#showData").html(response);
	  }});
}*/

function validEmail(){
	var email = document.getElementById('email').value;
	$.ajax({url: "emailcheck?email="+email, success: function(response){
		if(response != ""){
			$("#emailCheck").html(response);
			$('#emailCheck').fadeIn();
		} else {
			$('#emailCheck').fadeOut();
		}
	  }});
} 



