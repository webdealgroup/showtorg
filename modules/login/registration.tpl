<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/validate/jquery.form.js" type="text/javascript"></script>
<script src="js/validate/jquery.metadata.js" type="text/javascript"></script>
<script src="js/validate/jquery.validate.js" type="text/javascript"></script>
<script src="js/validate/additional-methods.js" type="text/javascript"></script>
<script src="js/validate/jquery.validate.creditcard2.js" type="text/javascript"></script>
<script src="js/md5.js" type="text/javascript"></script>

{literal}
<script type="text/javascript">
$().ready(function(){

	$("#registration").validate({
		rules: {
			email: {
				required: true,
				email: true
			},
//			password: {
//				remote: {
//					url: "?m=profile&ajax=1&action=check_password",
//					type: "post",
//					data: {
//						password: function() {
//						return hex_md5($("#password")[0].value+$('#id')[0].value+$('#reg_datetime')[0].value);
//					  }
//					}
//				}//,
//				//required: true
//			},
			confirm_password: {
				equalTo:'#password'	
			}
		},
		messages: {
			email: "����������, ������� ���������� e-mail",
			confirm_password: "������������� ������ �� ��������� � ��������� �������"
		},
		submitHandler: function() {

			var pars = {
				mod_name: "login",
              action: "registration_process",
				name: $("#name")[0].value,
				phone: $("#phone")[0].value,
				email: $("#email")[0].value,
				password: function(){
					if ($("#password")[0].value == '') {
						return '';
					}else{
						//return hex_md5($("#password")[0]);
						return $("#password")[0];
					}
				}
           };

           $.post('/index.php', pars, function(v){
             $("#registration_content").html(v.content);
             $("#login_email")[0].value = v.login_email;
             $("#login_password")[0].value = v.login_password;
             
           }, 'json');
           
           
           //setTimeout("document.location.href = '/index.php'",15000);
           
		},
		errorClass: "validator_field_error", 
		errorPlacement: function(error, element) { 
			var el = element.next("div");
			element.next("div").html('');
			error.appendTo( el ); 
			el.find('.validator_field_error').removeClass('validator_field_error');
		}, 
		success: function(element) { 
			element.removeClass('validator_field_error');
		},
		onkeyup: false//,
//			onfocusout: true//,
//			onclick: false
	});




});


</script>
{/literal}


         <img height="10" width="100%" border="0" alt="" src="index_files/pixel_trans.gif">
         <table width="100%" cellspacing="0" cellpadding="0" border="0" class="infoBoxHeading_table">
          <tbody>
           <tr>
            <td class="infoBoxHeading_l">
             <img height="2" width="2" border="0" alt="" src="index_files/infoBoxHeading_l.gif">
            </td>
            <td class="padd_vv">
             <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
            </td>
            <td class="infoBoxHeading_td">
             �����������
            </td>
            <td class="padd_vv">
             <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
            </td>
            <td class="infoBoxHeading_r">
             <img height="2" width="2" border="0" alt="" src="index_files/infoBoxHeading_r.gif">
            </td>
           </tr>
          </tbody>
         </table>
         <table width="100%" cellspacing="0" cellpadding="0" border="0" class="infoBox_table">
          <tbody>
           <tr>
            <td class="infoBox_td">
             <table width="100%" cellspacing="0" cellpadding="0" border="0" class="infoBoxContents_table">
              <tbody>
               <tr>
                <td class="boxText_l">
                 <img height="2" width="2" border="0" alt="" src="index_files/box_bottom_left.gif">
                </td>
                <td class="padd_vv">
                 <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
                </td>
                <td align="left" class="boxText">
                 <table width="100%" cellspacing="3" cellpadding="0" border="0">
                  <tbody>
                   <tr>
                    <td colspan="2" class="smallText">
                     <strong> </strong>
                      <em></em>
                    </td>
                    <td align="right" colspan="2" class="smallText">
                     <em></em>
                    </td>
                   </tr>
                   <tr>
                    <td colspan="3" class="headerNavigation">
                     <img height="1" width="100%" border="0" alt="" src="index_files/pixel_trans.gif">
                    </td>
                   </tr>
                   <tr>
                    <td colspan="3">
                     <img height="5" width="100%" border="0" alt="" src="index_files/pixel_trans.gif">
                    </td>
                   </tr>
                  </tbody>
                 </table>
                 <table width="100%" cellspacing="3" cellpadding="0" border="0">
                  <tbody>
                   <tr>
                    <td valign="top">
                     <table width="100%" cellspacing="3" cellpadding="0" border="0">
                      <tbody>
                       <tr>
                        <td >
                            <div id="registration_content">
                                <form method="post" name="registration" id="registration">
                                      <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tbody>
                                        <tr>
                                          <td>���� ���:</td>
                                        </tr>
                                        <tr>
                                          <td class="main">
                                              <input name="name" id="name" maxlength="100" style="float:left;border-style: solid; border-color: rgb(128, 128, 128) rgb(205, 205, 205) rgb(205, 205, 205) rgb(128, 128, 128); border-width: 1px; width: 160px; color: rgb(70, 69, 69);" type="text">
                                              <div style="margin-left:10px;margin-top:3px;"></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>������� ��� �����:</td>
                                        </tr>
                                        <tr>
                                          <td class="main">
                                              <input name="phone" id="phone" maxlength="100" style="float:left;border-style: solid; border-color: rgb(128, 128, 128) rgb(205, 205, 205) rgb(205, 205, 205) rgb(128, 128, 128); border-width: 1px; width: 160px; color: rgb(70, 69, 69);" type="text">
                                              <div style="margin-left:10px;margin-top:3px;"></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>E-Mail:</td>
                                        </tr>
                                        <tr>
                                          <td class="main">
                                              <input name="email" id="email" maxlength="100" style="float:left;border-style: solid; border-color: rgb(128, 128, 128) rgb(205, 205, 205) rgb(205, 205, 205) rgb(128, 128, 128); border-width: 1px; width: 160px; color: rgb(70, 69, 69);" type="text">
                                              <div style="margin-left:10px;margin-top:3px;"></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>������:</td>
                                        </tr>
                                        <tr>
                                          <td class="main">
                                              <input name="password" id="password" maxlength="100" style="float:left;border-style: solid; border-color: rgb(128, 128, 128) rgb(205, 205, 205) rgb(205, 205, 205) rgb(128, 128, 128); border-width: 1px; width: 160px; color: rgb(70, 69, 69);" type="password">
                                              <div style="margin-left:10px;margin-top:3px;"></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td>������ ��� ���:</td>
                                        </tr>
                                        <tr>
                                          <td class="main">
                                              <input name="confirm_password" id="confirm_password" maxlength="100" style="float:left;border-style: solid; border-color: rgb(128, 128, 128) rgb(205, 205, 205) rgb(205, 205, 205) rgb(128, 128, 128); border-width: 1px; width: 160px; color: rgb(70, 69, 69);" type="password">
                                              <div style="margin-left:10px;margin-top:3px;"></div>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td class="main"><br /><input src="index_files/button_reg.gif" style="border: 0pt none ;" alt="�����������" title=" ����������� " type="image"></td></td>
                                        </tr>
                                        </tbody>
                                      </table>
                                </form>
                            </div>
                        </td>
                       </tr>
                       <tr>
                        <td>
                         <img height="10" width="100%" border="0" alt="" src="index_files/pixel_trans.gif">
                        </td>
                       </tr>
                       <tr>
                        <td class="smallText">
                         {*<a href="#">[��������...]</a>*}
                        </td>
                       </tr>
                      </tbody>
                     </table>
                    </td>
                    <td valign="top" align="right">
                     <br>
                    </td>
                   </tr>
                  </tbody>
                 </table>
                 <table width="100%" cellspacing="3" cellpadding="0" border="0">
                  <tbody>
                   <tr>
                    <td colspan="2">
                     <img height="5" width="100%" border="0" alt="" src="index_files/pixel_trans.gif">
                    </td>
                   </tr>
                  </tbody>
                 </table>
                </td>
                <td class="padd_vv">
                 <img height="1" width="1" border="0" alt="" src="index_files/pixel_trans.gif">
                </td>
                <td class="boxText_r">
                 <img height="2" width="2" border="0" alt="" src="index_files/box_bottom_right.gif">
                </td>
               </tr>
              </tbody>
             </table>
            </td>
           </tr>
          </tbody>
         </table>
