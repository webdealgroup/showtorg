<td style="margin-bottom: 10px; border-bottom: 10px #FFF solid;">
    <table class="infoBoxHeading2_table" border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 10px;">
        <tbody>
            <tr>
                <td>
                    <img src="index_files/corner_top2_left.gif" alt="" border="0" height="38" width="9">
                </td>
                <td class="infoBoxHeading2_td">
                    Получить каталог
                </td>
                <td>
                    <img src="index_files/corner_top2_right.gif" alt="" border="0" height="38" width="9">
                </td>
            </tr>
        </tbody>
    </table>
    <div class="m_bg">
        <div class="m_tl">
            <div class="m_tr">
                <div class="m_bl">
                    <div class="m_br">
    
    <table class="infoBox_table" border="0" cellpadding="0" cellspacing="0" width="100%" id="catalog_send">
        <tbody>
            <tr>
                <td class="infoBox_td">
                    <table class="infoBoxContents_table" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td class="boxText" align="center">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td align="center">
                                                    <table style="width: 1px;" align="center" border="0" cellpadding="0" cellspacing="0">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <a href="http://www.lagoda.by/?mod_name=page&id=7332"><img src="/imgThumb.php?src=/img/2013-2.gif&max_x=120" alt="" title="" border="0" ></a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px 0px;" class="vam" align="center">
                                                    <span><a href="http://www.lagoda.by/?mod_name=page&id=7332">Каталог изданий 2013<br>2-е полугодие</a></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="form_subs">
                                                    <label>Индекс, почтовый адрес:</label><br />
                                                    <input type="text" name="address" placeholder="" id="subs_address" /><br />
                                                    <label>Наименование организации:</label><br />
                                                    <input type="text" name="org" placeholder="" id="subs_org" /><br />
                                                    <label>Имя, Фамилия:</label><br />
                                                    <input type="text" name="name" placeholder="Сергий Иванов" id="subs_name" /><br />
                                                    <label>Телефон:</label><br />
                                                    <input type="phone" name="phone" placeholder="(029) 123-45-67" id="subs_phone" /><br />
                                                    <label>Email:</label><br />
                                                    <input type="email" name="mail" placeholder="my@example.com" id="subs_mail" /><br />
                                                    <input type="button" value="Получить бесплатно" id="subs" style="background: url(index_files/button_bg.jpg) repeat-x; padding: 0 12px; margin-top: 10px; color: #FFF; font-size: 12px; border: none; border-radius: 3px; -webkit-border-radius: 3px; height: 23px;" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>   
                    </div>
                </div>
            </div>
        </div>
    </div>
</td>
<script>
    $("#subs").click(function(){
        subs_address = $("#subs_address").val();
        subs_org = $("#subs_org").val();
        subs_name = $("#subs_name").val();
        subs_phone = $("#subs_phone").val();
        subs_mail = $("#subs_mail").val();
        if(subs_address.length == 0 || subs_name.length == 0 || subs_phone.length == 0 || subs_mail.length == 0 || subs_org.length == 0) {
            alert("Заполните, пожалуйста, форму полностью");
        } else {
            $.get(
                "modules/ajax_mailer.php",
                {
                    address: subs_address,
                    org: subs_org,
                    name: subs_name,
                    phone: subs_phone,
                    mail: subs_mail
                },
                function(data){
                    if(data == "ok") {
                        $("#catalog_send").html("<p class='was_sent'>Каталог направлен Вам на почтовый адрес бесплатно</p>");    
                    } else {
                        alert(data);
                    }                
                }
            );       
        }
    })
</script>
<style>
    .was_sent {
        font-size: 12px;
        text-align: center;
    }
    
    .form_subs {
        text-align: center;
    }
    
    .form_subs input {
        width: 200px;
    }
    
    .form_subs input[type="button"] {
        width: auto;    
    }
</style>