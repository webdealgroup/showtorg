
<!-- HEAD START HERE -->

<script language="javascript">
<!--//

  var tooltip_window = null;
  function tooltip(mensaje, status)
  {
  	
    
      if(status != 0)
      {
        if(tooltip != null) tooltip.focus();
        else
        {
          var tooltip = open('', 'Tooltip', 'width='+ (mensaje.length * 8) + ',height=300');
          tooltip_window = tooltip;
          tooltip.document.open();
          tooltip.document.writeln('<html><head><title>Tooltip</title></head><body text=black bgcolor=#FFFFE1>');
          tooltip.document.writeln('<CENTER><FONT size=2><B>' + mensaje + '</B></FONT></CENTER>');
          tooltip.document.writeln('<img src="'+mensaje+'" /></body></html>');
          tooltip.document.close();
        }
      }
      else
      {
        if(tooltip_window != null) tooltip_window.close();
      }
    
  }

//-->
</script>

<!-- HEAD END HERE -->


<table style="font-family:Hevletica;font-size:13px;">
	<tr>
		<td >
		
	<table cellpadding="2" style="font-family:Hevletica;font-size:13px;">
		<tr bgcolor="#FFFFCC">
			<td><a href='/?page=upload&action=view_dir2&adres=~~$adres~'>..</a></td>
			<td align="center" colspan="3">(dir)</td><td>&nbsp;</td>
		</tr> 
		~~foreach item=item from=$data~
		
			<tr bgcolor="#FFFFCC">
				<td><a href='/?page=upload&action=view_dir&adres=~~$adres~&dir=~~$item.p_1~'>~~$item.p_1~</a></td>
				<td align="center" colspan="3">~~$item.p_2~</td>
				<td><a href='/?page=upload&action=rddir&adres=~~$adres~&id=~~$item.p_1~' >~~$item.p_5~</a>	</td>
			</tr> 
		~~/foreach~
		
			<form action='/?page=upload' method='post' name='formb' enctype='multipart/form-data'>
				<input type="hidden" name="adres"  size=60 value=~~$adres~>	
				<input type="hidden" name="action"  size=60 value="add_group">  
			~~foreach item=item from=$data2~
			<tr bgcolor="#FFFFCC">
				~~if $item.p_4 eq "1"~
					<td><div title="header=[header] body=[<strong>Preview</strong><br /><br /><img src=~~$adres2~/~~$item.p_1~>]">~~$item.p_1~</div><img src="thumb.php?image=~~$adres2~/~~$item.p_1~"  border="0"></td>
					<td><input type="checkbox"  name="~~$item.p_1~" ></td>
   				~~else~  
					<td>~~$item.p_1~</td><td></td>
				~~/if~
				<td align="right" colspan="2">~~$item.p_2~</td>
				<td  align="center" ><a href='/?page=upload&action=rdfile&adres=~~$adres~&id=~~$item.p_5~'>�������</a></td>
			</tr>
		~~/foreach~
		<tr>
			<td align=center>
			<select name="spisok">
~~foreach from=$catalog item=item~
			<option value="~~$item.id~" >~~$item.title~</option>
~~/foreach~
			</select>
			<input type=submit value='�������� � ������'>
			
			</form>
			</td>
		</tr> 
	</table>	   
	</td>
    </tr>
    
	
	
		<tr>
			<td>
				
				<form action='/?page=upload' method='post' name='form' enctype='multipart/form-data'>
				<table border=0 align=center cellpadding=2 cellspacing=1 >
					
					<tr height=25><td colspan=3><font color=red>*</font> <B style="font-family:Arial;font-size:13px;">���� ���������� ���, �� ������� � </B></TD></TR>
					<tr>
						<td align=left  style="font-family:Arial;font-size:13px;">����� �����</td>
					</tr>
					<tr>	
						<TD colspan=2><input type=text value='' name=newgrup size=30 maxlength=25></TD>

					</tr>
					<tr>
						<td>
							<input type=submit value='������� �����'>
							<input type="hidden" name="adres"  size=60 value="~~$adres~">	
							<input type="hidden" name="action"  size=60 value="add_dir">		
						</td>
					</tr>
				</table>
				</form>	
			</td>
		</tr>
        <tr>
		 <td >
			<form action='/?page=upload' method='post' name='formd' enctype='multipart/form-data'>
				<table border=0 align=center cellpadding=2 cellspacing=1 >
					<tr>
						<td  style="font-family:Arial;font-size:13px;" align=right>���������� <B>����</B></td>
					</tr>
					<tr>	
						<TD colspan=2><input type=file name=file size=30  ></TD>
					</tr>
					<input type="hidden" name="adres"  size=60 value="~~$adres~">	
					<input type="hidden" name="action"  size=60 value="add">		
					<tr>
						<td colspan=3 align=center><input type=submit value='�������� ����'>	</td>
					</tr>
				</table>
			</form>
						
		</td>
	</tr>
	
</table>