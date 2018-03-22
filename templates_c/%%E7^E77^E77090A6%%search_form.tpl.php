<?php /* Smarty version 2.6.11, created on 2018-03-22 13:28:38
         compiled from search_form/search_form.tpl */ ?>


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
                            