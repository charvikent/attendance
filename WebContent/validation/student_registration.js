function registration()
{
	if(document.studentform.name.value === null || document.studentform.name.value === "")
    {
    	document.studentform.name.focus();
    	document.getElementById("name").style.borderLeft = "2px solid #c00";
    	document.getElementById("name").style.borderBottom = "2px solid #c00";
        document.getElementById("name-error").innerHTML = "Please Enter Name..!";
        return false;
    }
    else if(!document.studentform.name.value.match(/^[a-zA-Z ]+$/))
    {
    	document.studentform.name.focus();
    	document.getElementById("name").style.borderLeft = "2px solid #c00";
    	document.getElementById("name").style.borderBottom = "2px solid #c00";
        document.getElementById("name-error").innerHTML = "Name cannot be numeric or special character..!";
        return false;
    }
    else
    {
    	document.getElementById("name").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("name").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("name-error").innerHTML = "";
    }
	
	if(document.studentform.board.value === null || document.studentform.board.value === "" || document.studentform.board.value === "Choose Board")
    {
    	document.studentform.board.focus();
    	document.getElementById("board").style.borderLeft = "2px solid #c00";
        document.getElementById("board").style.borderBottom = "2px solid #c00";
        document.getElementById("board-error").innerHTML = "Please Choose Board..!";
    	return false;
    }
    else
    {
    	document.getElementById("board").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("board").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("board-error").innerHTML = "";
    }
	
	if(document.studentform.medium.value === null || document.studentform.medium.value === "" || document.studentform.medium.value === "Choose Medium")
    {
    	document.studentform.medium.focus();
    	document.getElementById("medium").style.borderLeft = "2px solid #c00";
        document.getElementById("medium").style.borderBottom = "2px solid #c00";
        document.getElementById("medium-error").innerHTML = "Please Choose Medium..!";
    	return false;
    }
    else
    {
    	document.getElementById("medium").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("medium").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("medium-error").innerHTML = "";
    }
	
	if(document.studentform.class.value === null || document.studentform.class.value === "" || document.studentform.class.value === "Choose Class")
    {
    	document.studentform.class.focus();
    	document.getElementById("class").style.borderLeft = "2px solid #c00";
        document.getElementById("class").style.borderBottom = "2px solid #c00";
        document.getElementById("class-error").innerHTML = "Please Choose Class..!";
    	return false;
    }
    else
    {
    	document.getElementById("class").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("class").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("class-error").innerHTML = "";
    }
	
	if (document.studentform.section.value === null || document.studentform.section.value === "" || document.studentform.section.value === "Choose Section")
    {
    	document.studentform.section.focus();
    	document.getElementById("section").style.borderLeft = "2px solid #c00";
    	document.getElementById("section").style.borderBottom = "2px solid #c00";
        document.getElementById("section-error").innerHTML = "Please Choose Section..!";
        return false;
    }
    else
    {
    	document.getElementById("section").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("section").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("section-error").innerHTML = "";
    }
	
	if (document.studentform.rollno.value === null || document.studentform.rollno.value === "")
    {
    	document.studentform.rollno.focus();
    	document.getElementById("rollno").style.borderLeft = "2px solid #c00";
    	document.getElementById("rollno").style.borderBottom = "2px solid #c00";
        document.getElementById("rollno-error").innerHTML = "Please Enter Roll Number..!";
        return false;
    }
    else if(!document.studentform.rollno.value.match(/^[A-Z0-9]+$/))
    {
    	document.studentform.rollno.focus();
    	document.getElementById("rollno").style.borderLeft = "2px solid #c00";
    	document.getElementById("rollno").style.borderBottom = "2px solid #c00";
        document.getElementById("rollno-error").innerHTML = "Roll Number contains CAP-Letters & numbers only..!";
        return false;
    }
    else
    {
    	document.getElementById("rollno").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("rollno").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("rollno-error").innerHTML = "";
    }
	
	if (document.studentform.admissionno.value === null || document.studentform.admissionno.value === "")
    {
    	document.studentform.admissionno.focus();
    	document.getElementById("admissionno").style.borderLeft = "2px solid #c00";
    	document.getElementById("admissionno").style.borderBottom = "2px solid #c00";
        document.getElementById("admissionno-error").innerHTML = "Please Enter Roll Number..!";
        return false;
    }
    else if(!document.studentform.admissionno.value.match(/^[0-9]+$/))
    {
    	document.studentform.admissionno.focus();
    	document.getElementById("admissionno").style.borderLeft = "2px solid #c00";
    	document.getElementById("admissionno").style.borderBottom = "2px solid #c00";
        document.getElementById("admissionno-error").innerHTML = "Admission Number contains numbers only..!";
        return false;
    }
    else
    {
    	document.getElementById("admissionno").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("admissionno").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("admissionno-error").innerHTML = "";
    }
	
	if (document.studentform.fname.value === null || document.studentform.fname.value === "")
    {
    	document.studentform.fname.focus();
    	document.getElementById("fname").style.borderLeft = "2px solid #c00";
    	document.getElementById("fname").style.borderBottom = "2px solid #c00";
        document.getElementById("fname-error").innerHTML = "Please Enter Father Name..!";
        return false;
    }
    else if(!document.studentform.fname.value.match(/^[a-zA-Z ]+$/))
    {
    	document.studentform.fname.focus();
    	document.getElementById("fname").style.borderLeft = "2px solid #c00";
    	document.getElementById("fname").style.borderBottom = "2px solid #c00";
        document.getElementById("fname-error").innerHTML = "Name cannot be numeric or special character..!";
        return false;
    }
    else
    {
    	document.getElementById("fname").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("fname").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("fname-error").innerHTML = "";
    }
	
	if(document.studentform.mobile.value === null || document.studentform.mobile.value === "")
    {
    	document.studentform.mobile.focus();
    	document.getElementById("mobile").style.borderLeft = "2px solid #c00";
        document.getElementById("mobile").style.borderBottom = "2px solid #c00";
        document.getElementById("mobile-error").innerHTML = "Please Enter Mobile Number..!";
    	return false;
    }
    else if(isNaN(document.studentform.mobile.value))
    {
    	document.studentform.mobile.focus();
    	document.getElementById("mobile").style.borderLeft = "2px solid #c00";
        document.getElementById("mobile").style.borderBottom = "2px solid #c00";
        document.getElementById("mobile-error").innerHTML = "Mobile Number cannot be non-numeric..!";
    	return false;
    }
    else if(document.studentform.mobile.value.length !=10)
    {
    	document.studentform.mobile.focus();
    	document.getElementById("mobile").style.borderLeft = "2px solid #c00";
        document.getElementById("mobile").style.borderBottom = "2px solid #c00";
        document.getElementById("mobile-error").innerHTML = "Please Enter 10 digit Valid Mobile Number";
    	return false;
    }
    else if(!document.studentform.mobile.value.match(/^[789]\d{9}$/))
//    var mobile_format = /^[0]?[789]\d{9}$/;
    {
    	document.studentform.mobile.focus();
    	document.getElementById("mobile").style.borderLeft = "2px solid #c00";
        document.getElementById("mobile").style.borderBottom = "2px solid #c00";
        document.getElementById("mobile-error").innerHTML = "Please Enter Valid Mobile Number";
    	return false;
    }
    else
    {
    	document.getElementById("mobile").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("mobile").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("mobile-error").innerHTML = "";
    }
	
	if(document.studentform.altmobile.value === null || document.studentform.altmobile.value === "")
    {
    	document.studentform.altmobile.focus();
    	document.getElementById("altmobile").style.borderLeft = "2px solid #c00";
        document.getElementById("altmobile").style.borderBottom = "2px solid #c00";
        document.getElementById("altmobile-error").innerHTML = "Please Enter Alternate Mobile Number..!";
    	return false;
    }
    else if(isNaN(document.studentform.altmobile.value))
    {
    	document.studentform.altmobile.focus();
    	document.getElementById("altmobile").style.borderLeft = "2px solid #c00";
        document.getElementById("altmobile").style.borderBottom = "2px solid #c00";
        document.getElementById("altmobile-error").innerHTML = "Alternate Mobile Number cannot be non-numeric..!";
    	return false;
    }
    else if(document.studentform.altmobile.value.length !=10)
    {
    	document.studentform.altmobile.focus();
    	document.getElementById("altmobile").style.borderLeft = "2px solid #c00";
        document.getElementById("altmobile").style.borderBottom = "2px solid #c00";
        document.getElementById("altmobile-error").innerHTML = "Please Enter 10 digit Valid Mobile Number";
    	return false;
    }
    else if(!document.studentform.altmobile.value.match(/^[789]\d{9}$/))
    {
    	document.studentform.altmobile.focus();
    	document.getElementById("altmobile").style.borderLeft = "2px solid #c00";
        document.getElementById("altmobile").style.borderBottom = "2px solid #c00";
        document.getElementById("altmobile-error").innerHTML = "Please Enter Valid Mobile Number";
    	return false;
    }
    else
    {
    	document.getElementById("altmobile").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("altmobile").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("altmobile-error").innerHTML = "";
    }
	
//	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
//	anystring@anystring.anystring ==>	var re = /\S+@\S+\.\S+/;
	if(document.studentform.email.value === null || document.studentform.email.value === "")
    {
    	document.studentform.email.focus();
    	document.getElementById("email").style.borderLeft = "2px solid #c00";
        document.getElementById("email").style.borderBottom = "2px solid #c00";
        document.getElementById("email-error").innerHTML = "Please Enter Email..!";
    	return false;
    }
    else if(!(document.studentform.email.value.match(/^[A-Za-z0-9._]*\@([A-Za-z]{3,5})*\.[A-Za-z]{2,5}$/)))
    {
    	document.studentform.email.focus();
    	document.getElementById("email").style.borderLeft = "2px solid #c00";
        document.getElementById("email").style.borderBottom = "2px solid #c00";
        document.getElementById("email-error").innerHTML = "Please Enter valid Email-ID..!";
    	return false;
    }
    else
    {
    	document.getElementById("email").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("email").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("email-error").innerHTML = "";
    }
	
	if(document.studentform.bgroup.value === null || document.studentform.bgroup.value === "" || document.studentform.bgroup.value == "Choose Blood Group")
    {
    	document.studentform.bgroup.focus();
    	document.getElementById("bgroup").style.borderLeft = "2px solid #c00";
        document.getElementById("bgroup").style.borderBottom = "2px solid #c00";
        document.getElementById("bgroup-error").innerHTML = "Please Choose Blood Group..!";
    	return false;
    }
    else
    {
    	document.getElementById("bgroup").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("bgroup").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("bgroup-error").innerHTML = "";
    }
	
	if((document.studentform.gender[0].checked === false) && (document.studentform.gender[1].checked === false))
    {
    	document.studentform.gender[0].focus();
        document.getElementById("gender-error").innerHTML = "Please Choose Gender..!";
    	return false;
    }
    else
    {
    	document.getElementById("gender-error").innerHTML = "";
    }
	
	if(document.studentform.dob.value === null || document.studentform.dob.value === "")
    {
    	document.studentform.dob.focus();
    	document.getElementById("dob").style.borderLeft = "2px solid #c00";
        document.getElementById("dob").style.borderBottom = "2px solid #c00";
        document.getElementById("dob-error").innerHTML = "Please Enter Date of Birth..!";
    	return false;
    }
    else
    {
    	document.getElementById("dob").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("dob").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("dob-error").innerHTML = "";
    }
	
	if(document.studentform.religion.value === null || document.studentform.religion.value === "" || document.studentform.religion.value == "Choose Religion")
    {
    	document.studentform.religion.focus();
    	document.getElementById("religion").style.borderLeft = "2px solid #c00";
        document.getElementById("religion").style.borderBottom = "2px solid #c00";
        document.getElementById("religion-error").innerHTML = "Please Choose Religion..!";
    	return false;
    }
    else
    {
    	document.getElementById("religion").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("religion").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("religion-error").innerHTML = "";
    }
	
	if(document.studentform.address.value === null || document.studentform.address.value === "")
    {
    	document.studentform.address.focus();
    	document.getElementById("address").style.borderLeft = "2px solid #c00";
        document.getElementById("address").style.borderBottom = "2px solid #c00";
        document.getElementById("address-error").innerHTML = "Please Enter Address..!";
    	return false;
    }
	else
    {
    	document.getElementById("address").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("address").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("address-error").innerHTML = "";
    }
	
	if(document.studentform.pinstitute.value === null || document.studentform.pinstitute.value === "")
    {
    	document.studentform.pinstitute.focus();
    	document.getElementById("pinstitute").style.borderLeft = "2px solid #c00";
    	document.getElementById("pinstitute").style.borderBottom = "2px solid #c00";
        document.getElementById("pinstitute-error").innerHTML = "Please Enter Previous Institute Name..!";
        return false;
    }
    else if(!document.studentform.pinstitute.value.match(/^[a-zA-Z ]+$/))
    {
    	document.studentform.pinstitute.focus();
    	document.getElementById("pinstitute").style.borderLeft = "2px solid #c00";
    	document.getElementById("pinstitute").style.borderBottom = "2px solid #c00";
        document.getElementById("pinstitute-error").innerHTML = "Institute Name cannot be numeric or special character..!";
        return false;
    }
    else
    {
    	document.getElementById("pinstitute").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("pinstitute").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("pinstitute-error").innerHTML = "";
    }
	
	if(document.studentform.caste.value === null || document.studentform.caste.value === "" || document.studentform.caste.value == "Choose Caste")
    {
    	document.studentform.caste.focus();
    	document.getElementById("caste").style.borderLeft = "2px solid #c00";
        document.getElementById("caste").style.borderBottom = "2px solid #c00";
        document.getElementById("caste-error").innerHTML = "Please Choose Caste..!";
    	return false;
    }
    else
    {
    	document.getElementById("caste").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("caste").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("caste-error").innerHTML = "";
    }
	
	if((document.studentform.accomodation[0].checked === false) && (document.studentform.accomodation[1].checked === false))
    {
    	document.studentform.accomodation[0].focus();
        document.getElementById("accomodation-error").innerHTML = "Please Choose Accommodation..!";
    	return false;
    }
    else
    {
    	document.getElementById("accomodation-error").innerHTML = "";
    }
	
	if((document.studentform.busfacility[0].checked === false) && (document.studentform.busfacility[1].checked === false))
    {
    	document.studentform.busfacility[0].focus();
        document.getElementById("busfacility-error").innerHTML = "Please Choose Bus Facility..!";
    	return false;
    }
    else
    {
    	document.getElementById("busfacility-error").innerHTML = "";
    }
	
	if(document.studentform.busfacility.value === "Yes")
	{
		if(document.studentform.busroute.value === null || document.studentform.busroute.value === "")
	    {
	    	document.studentform.busroute.focus();
	    	document.getElementById("busroute").style.borderLeft = "2px solid #c00";
	        document.getElementById("busroute").style.borderBottom = "2px solid #c00";
	        document.getElementById("busroute-error").innerHTML = "Please Enter Bus route..!";
	    	return false;
	    }
		else if(!document.studentform.busroute.value.match(/^[a-zA-Z0-9 ]+$/))
	    {
	    	document.studentform.busroute.focus();
	    	document.getElementById("busroute").style.borderLeft = "2px solid #c00";
	        document.getElementById("busroute").style.borderBottom = "2px solid #c00";
	        document.getElementById("busroute-error").innerHTML = "Route name cannot be special character..!";
	    	return false;
	    }
	    else
	    {
	    	document.getElementById("busroute").style.borderLeft = "2px solid #4CAF50";
	    	document.getElementById("busroute").style.borderBottom = "2px solid #4CAF50";
	    	document.getElementById("busroute-error").innerHTML = "";
	    }
	}
	
	if(document.studentform.fileImage.value === null || document.studentform.fileImage.value === "")
    {
    	document.studentform.fileImage.focus();
    	document.getElementById("fileImage").style.borderLeft = "2px solid #c00";
        document.getElementById("fileImage").style.borderBottom = "2px solid #c00";
        document.getElementById("fileImage-error").innerHTML = "Please Upload Image..!";
    	return false;
    }
    else
    {
    	document.getElementById("fileImage").style.borderLeft = "2px solid #4CAF50";
    	document.getElementById("fileImage").style.borderBottom = "2px solid #4CAF50";
    	document.getElementById("fileImage-error").innerHTML = "";
    }
	
	return true;
}