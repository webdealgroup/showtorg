~~include file="htmlhead.tpl"~


    <body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" marginheight="0" marginwidth="0" style="background-image: url('/index_files/bg.jpg'); background-position: center top; background-repeat: repeat; min-width: 1000px;">
    <div style="padding-bottom: 69px; padding-top: 53px;">
    <div style="background: none repeat scroll 0px 0px rgb(255, 255, 255); border-radius: 5px 5px 5px 5px; box-shadow: 0px 0px 32px rgba(0, 0, 0, 0.22); margin: 0px auto; position: relative; width: 1136px;">
    
        <!-- header //--><!-- start -->
        <table style="background: url(&quot;images/f_bg.gif&quot;) repeat-x scroll 0px bottom transparent;" border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="background: url(&quot;images/head_bg.jpg&quot;) repeat-x scroll 0px 147px transparent;">
                        <table class="col_c_table" align="center" border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td class="col_c">
                                        <table align="center" border="0" cellpadding="0" cellspacing="0">
                                            <tbody>
                                                <tr>
                                                    ~~include file="banner_cart.tpl"~
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px 20px 0px 25px;">
                                                        <!-- end --><!-- header_eof //--><!-- body //-->
                                                        <table class="main_table" border="0" cellpadding="0" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="box_width_td_left">
                                                                        <table class="box_width_left" border="0" cellpadding="0" cellspacing="0">
                                                                            <!-- left_navigation //--><!-- left_navigation_eof //-->
                                                                        </table>
                                                                    </td>
                                                                    <!-- body_text //-->
                                                                    <td class="content_width_td">
                                                                        <!-- Welcome_box_start --><!--   <table border="0" width="100%" cellspacing="0" cellpadding="0">
                                                                        <tr><td class="main"></td></tr>
                                                                        <tr><td></td></tr>
                                                                        <tr><td class="main"></td></tr>
                                                                        </table>  --><!-- Welcome_box_end -->
                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="padd_3">
                                                                                        <!-- products //-->
                                                                                        
                                                                                           		~~mod mod_name="item" action=""~
                                                                                        
                                                                                        <!-- products_eof //-->
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                    <!-- body_text_eof //-->
                                                                    <td class="box_width_td_right">
                                                                        <table class="box_width_right" border="0" cellpadding="0" cellspacing="0">
                                                                            <!-- right_navigation //--><!-- categories //-->
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table class="infoBoxHeading2_table" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <img src="index_files/corner_top2_left.gif" alt="" border="0" height="38" width="9">
                                                                                                    </td>
                                                                                                    <td class="infoBoxHeading2_td">
                                                                                                        &#1050;&#1072;&#1090;&#1077;&#1075;&#1086;&#1088;&#1080;&#1080;
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <img src="index_files/corner_top2_right.gif" alt="" border="0" height="38" width="9">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                                                    
                                                                                                                        ~~mod mod_name="menu_v" action=""~  
                                                                                                                    
                                                                                    </td>
                                                                                </tr>
                                                                                <!-- categories_eof //--><!-- specials //-->
                                                                                <tr>
                                                                                    ~~include file="subscription.tpl"~
                                                                                </tr>
                                                                                <!-- specials_eof //--><!-- information //-->
                                                                                <tr>
                                                                                    ~~include file="stock.tpl"~
                                                                                </tr>
                                                                                <!-- information_eof //--><!-- right_navigation_eof //-->
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <!-- body_eof //--><!-- footer //-->
                                                    </td>
                                                </tr>
                                                                            
                                                ~~include file="bottom.tpl"~
                                                                            
                                                                            
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
        <!-- footer_eof //-->
        ~~*<!--http://osc3.template-help.com/osc_21509/-->*~
        </div>
        </div>
        
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-19715016-14']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
        
    </body>
</html>



~~*
<body>
   <div id=panel_header>~~include file="header.tpl"~</div>
   <div id=panel_left>~~include file="left.tpl"~</div>
   <div id=panel_center><div id=panel_center_wrapper>~~mod mod_name="item" action=""~</div></div>
   <div id=panel_right>~~include file="right.tpl"~</div>
   <div id=panel_footer>~~include file="footer.tpl"~</div>
</body>
</html>
*~