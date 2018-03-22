

<script>
function verify_search()
{
	if(document.getElementById('searchword').value=='')
	{
		document.getElementById('searchword').focus();
		return false;
	}
	return true;
}
</script>

~~*
                        <td class="search"><form id="search" name="search" method="get" action="/?mod_name=search" onsubmit="javascript:return verify_search();">
                        <input type="hidden" name="mod_name" value="search">
                          <table cellspacing="0" cellpadding="0" border="0" align="right" style="width: 176px; margin-bottom: 0px;">
                            <tbody><tr>
                              <td style="vertical-align: top;"><img height="20" width="3" border="0" alt="" src="index_files/search_bg2.gif"></td>
                              <td style="background: url(index_files/search_bg22.gif) repeat-x scroll 0px 0px transparent; width: 100%; -moz-background-inline-policy: continuous;"><table cellspacing="0" cellpadding="0" border="0">
                                  <tbody><tr>
                                    <td style="height: 21px;"><input type="text" class="go" name="searchword" id="searchword" value="~~$searchword~"></td>
                                  </tr>
                                </tbody></table></td>
                              <td style="vertical-align: top; padding-right: 5px;"><img height="20" width="3" border="0" alt="" src="index_files/search_bg222.gif"></td>
                              <td style="vertical-align: top;"><img height="20" width="3" border="0" alt="" src="index_files/search_bg3.gif"></td>
                              <td style="background: url(index_files/search_bg33.gif) repeat-x scroll 100% 0px transparent; -moz-background-inline-policy: continuous; height: 21px;"><a href="#" onclick="javascript:if(verify_search())document.getElementById('search').submit();return false;" style="font-size:8px;text-decoration:none;color:#777;">ПОИСК</a></td>
                              <td style="vertical-align: top;"><img height="20" width="3" border="0" alt="" src="index_files/search_bg333.gif"></td>
                            </tr>
                          </tbody></table>
                        </form></td>
*~


                            <form id="search_mini_form" action="/?mod_name=search" method="get"  onsubmit="javascript:return verify_search();">
                                <div class="form-search">
                                    <label for="search"> 
                                        Поиск:
                                    </label>
                                    <input autocomplete="off" id="search" name="searchword" class="input-text" type="text">
                                    <input name="mod_name" type="hidden" value="search">
                                    <button type="submit" title="Поиск" class="button" onclick="javascript:if(verify_search())document.getElementById('search').submit();return false;">
                                        Поиск
                                    </button>
                                    <div style="display: none;" id="search_autocomplete" class="search-autocomplete">
                                    </div>
                                </div>
                            </form>
                            