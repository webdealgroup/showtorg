/*
 * Ext JS Library 2.2
 * Copyright(c) 2006-2008, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.DatePicker=Ext.extend(Ext.Component,{todayText:"Today",okText:"&#160;OK&#160;",cancelText:"Cancel",todayTip:"{0} (Spacebar)",minText:"This date is before the minimum date",maxText:"This date is after the maximum date",format:"m/d/y",disabledDaysText:"Disabled",disabledDatesText:"Disabled",constrainToViewport:true,monthNames:Date.monthNames,dayNames:Date.dayNames,nextText:"Next Month (Control+Right)",prevText:"Previous Month (Control+Left)",monthYearText:"Choose a month (Control+Up/Down to move years)",startDay:0,showToday:true,initComponent:function(){Ext.DatePicker.superclass.initComponent.call(this);this.value=this.value?this.value.clearTime():new Date().clearTime();this.addEvents("select");if(this.handler){this.on("select",this.handler,this.scope||this)}this.initDisabledDays()},initDisabledDays:function(){if(!this.disabledDatesRE&&this.disabledDates){var A=this.disabledDates;var C="(?:";for(var B=0;B<A.length;B++){C+=A[B];if(B!=A.length-1){C+="|"}}this.disabledDatesRE=new RegExp(C+")")}},setDisabledDates:function(A){if(Ext.isArray(A)){this.disabledDates=A;this.disabledDatesRE=null}else{this.disabledDatesRE=A}this.initDisabledDays();this.update(this.value,true)},setDisabledDays:function(A){this.disabledDays=A;this.update(this.value,true)},setMinDate:function(A){this.minDate=A;this.update(this.value,true)},setMaxDate:function(A){this.maxDate=A;this.update(this.value,true)},setValue:function(B){var A=this.value;this.value=B.clearTime(true);if(this.el){this.update(this.value)}},getValue:function(){return this.value},focus:function(){if(this.el){this.update(this.activeDate)}},onRender:function(A,F){var C=["<table cellspacing=\"0\">","<tr><td class=\"x-date-left\"><a href=\"#\" title=\"",this.prevText,"\">&#160;</a></td><td class=\"x-date-middle\" align=\"center\"></td><td class=\"x-date-right\"><a href=\"#\" title=\"",this.nextText,"\">&#160;</a></td></tr>","<tr><td colspan=\"3\"><table class=\"x-date-inner\" cellspacing=\"0\"><thead><tr>"];var E=this.dayNames;for(var D=0;D<7;D++){var G=this.startDay+D;if(G>6){G=G-7}C.push("<th><span>",E[G].substr(0,1),"</span></th>")}C[C.length]="</tr></thead><tbody><tr>";for(var D=0;D<42;D++){if(D%7==0&&D!=0){C[C.length]="</tr><tr>"}C[C.length]="<td><a href=\"#\" hidefocus=\"on\" class=\"x-date-date\" tabIndex=\"1\"><em><span></span></em></a></td>"}C.push("</tr></tbody></table></td></tr>",this.showToday?"<tr><td colspan=\"3\" class=\"x-date-bottom\" align=\"center\"></td></tr>":"","</table><div class=\"x-date-mp\"></div>");var B=document.createElement("div");B.className="x-date-picker";B.innerHTML=C.join("");A.dom.insertBefore(B,F);this.el=Ext.get(B);this.eventEl=Ext.get(B.firstChild);new Ext.util.ClickRepeater(this.el.child("td.x-date-left a"),{handler:this.showPrevMonth,scope:this,preventDefault:true,stopDefault:true});new Ext.util.ClickRepeater(this.el.child("td.x-date-right a"),{handler:this.showNextMonth,scope:this,preventDefault:true,stopDefault:true});this.eventEl.on("mousewheel",this.handleMouseWheel,this);this.monthPicker=this.el.down("div.x-date-mp");this.monthPicker.enableDisplayMode("block");var I=new Ext.KeyNav(this.eventEl,{"left":function(J){J.ctrlKey?this.showPrevMonth():this.update(this.activeDate.add("d",-1))},"right":function(J){J.ctrlKey?this.showNextMonth():this.update(this.activeDate.add("d",1))},"up":function(J){J.ctrlKey?this.showNextYear():this.update(this.activeDate.add("d",-7))},"down":function(J){J.ctrlKey?this.showPrevYear():this.update(this.activeDate.add("d",7))},"pageUp":function(J){this.showNextMonth()},"pageDown":function(J){this.showPrevMonth()},"enter":function(J){J.stopPropagation();return true},scope:this});this.eventEl.on("click",this.handleDateClick,this,{delegate:"a.x-date-date"});this.el.unselectable();this.cells=this.el.select("table.x-date-inner tbody td");this.textNodes=this.el.query("table.x-date-inner tbody span");this.mbtn=new Ext.Button({text:"&#160;",tooltip:this.monthYearText,renderTo:this.el.child("td.x-date-middle",true)});this.mbtn.on("click",this.showMonthPicker,this);this.mbtn.el.child(this.mbtn.menuClassTarget).addClass("x-btn-with-menu");if(this.showToday){this.todayKeyListener=this.eventEl.addKeyListener(Ext.EventObject.SPACE,this.selectToday,this);var H=(new Date()).dateFormat(this.format);this.todayBtn=new Ext.Button({renderTo:this.el.child("td.x-date-bottom",true),text:String.format(this.todayText,H),tooltip:String.format(this.todayTip,H),handler:this.selectToday,scope:this})}if(Ext.isIE){this.el.repaint()}this.update(this.value)},createMonthPicker:function(){if(!this.monthPicker.dom.firstChild){var A=["<table border=\"0\" cellspacing=\"0\">"];for(var B=0;B<6;B++){A.push("<tr><td class=\"x-date-mp-month\"><a href=\"#\">",this.monthNames[B].substr(0,3),"</a></td>","<td class=\"x-date-mp-month x-date-mp-sep\"><a href=\"#\">",this.monthNames[B+6].substr(0,3),"</a></td>",B==0?"<td class=\"x-date-mp-ybtn\" align=\"center\"><a class=\"x-date-mp-prev\"></a></td><td class=\"x-date-mp-ybtn\" align=\"center\"><a class=\"x-date-mp-next\"></a></td></tr>":"<td class=\"x-date-mp-year\"><a href=\"#\"></a></td><td class=\"x-date-mp-year\"><a href=\"#\"></a></td></tr>")}A.push("<tr class=\"x-date-mp-btns\"><td colspan=\"4\"><button type=\"button\" class=\"x-date-mp-ok\">",this.okText,"</button><button type=\"button\" class=\"x-date-mp-cancel\">",this.cancelText,"</button></td></tr>","</table>");this.monthPicker.update(A.join(""));this.monthPicker.on("click",this.onMonthClick,this);this.monthPicker.on("dblclick",this.onMonthDblClick,this);this.mpMonths=this.monthPicker.select("td.x-date-mp-month");this.mpYears=this.monthPicker.select("td.x-date-mp-year");this.mpMonths.each(function(C,D,E){E+=1;if((E%2)==0){C.dom.xmonth=5+Math.round(E*0.5)}else{C.dom.xmonth=Math.round((E-1)*0.5)}})}},showMonthPicker:function(){this.createMonthPicker();var A=this.el.getSize();this.monthPicker.setSize(A);this.monthPicker.child("table").setSize(A);this.mpSelMonth=(this.activeDate||this.value).getMonth();this.updateMPMonth(this.mpSelMonth);this.mpSelYear=(this.activeDate||this.value).getFullYear();this.updateMPYear(this.mpSelYear);this.monthPicker.slideIn("t",{duration:0.2})},updateMPYear:function(E){this.mpyear=E;var C=this.mpYears.elements;for(var B=1;B<=10;B++){var D=C[B-1],A;if((B%2)==0){A=E+Math.round(B*0.5);D.firstChild.innerHTML=A;D.xyear=A}else{A=E-(5-Math.round(B*0.5));D.firstChild.innerHTML=A;D.xyear=A}this.mpYears.item(B-1)[A==this.mpSelYear?"addClass":"removeClass"]("x-date-mp-sel")}},updateMPMonth:function(A){this.mpMonths.each(function(B,C,D){B[B.dom.xmonth==A?"addClass":"removeClass"]("x-date-mp-sel")})},selectMPMonth:function(A){},onMonthClick:function(D,B){D.stopEvent();var C=new Ext.Element(B),A;if(C.is("button.x-date-mp-cancel")){this.hideMonthPicker()}else{if(C.is("button.x-date-mp-ok")){var E=new Date(this.mpSelYear,this.mpSelMonth,(this.activeDate||this.value).getDate());if(E.getMonth()!=this.mpSelMonth){E=new Date(this.mpSelYear,this.mpSelMonth,1).getLastDateOfMonth()}this.update(E);this.hideMonthPicker()}else{if(A=C.up("td.x-date-mp-month",2)){this.mpMonths.removeClass("x-date-mp-sel");A.addClass("x-date-mp-sel");this.mpSelMonth=A.dom.xmonth}else{if(A=C.up("td.x-date-mp-year",2)){this.mpYears.removeClass("x-date-mp-sel");A.addClass("x-date-mp-sel");this.mpSelYear=A.dom.xyear}else{if(C.is("a.x-date-mp-prev")){this.updateMPYear(this.mpyear-10)}else{if(C.is("a.x-date-mp-next")){this.updateMPYear(this.mpyear+10)}}}}}}},onMonthDblClick:function(D,B){D.stopEvent();var C=new Ext.Element(B),A;if(A=C.up("td.x-date-mp-month",2)){this.update(new Date(this.mpSelYear,A.dom.xmonth,(this.activeDate||this.value).getDate()));this.hideMonthPicker()}else{if(A=C.up("td.x-date-mp-year",2)){this.update(new Date(A.dom.xyear,this.mpSelMonth,(this.activeDate||this.value).getDate()));this.hideMonthPicker()}}},hideMonthPicker:function(A){if(this.monthPicker){if(A===true){this.monthPicker.hide()}else{this.monthPicker.slideOut("t",{duration:0.2})}}},showPrevMonth:function(A){this.update(this.activeDate.add("mo",-1))},showNextMonth:function(A){this.update(this.activeDate.add("mo",1))},showPrevYear:function(){this.update(this.activeDate.add("y",-1))},showNextYear:function(){this.update(this.activeDate.add("y",1))},handleMouseWheel:function(A){var B=A.getWheelDelta();if(B>0){this.showPrevMonth();A.stopEvent()}else{if(B<0){this.showNextMonth();A.stopEvent()}}},handleDateClick:function(B,A){B.stopEvent();if(A.dateValue&&!Ext.fly(A.parentNode).hasClass("x-date-disabled")){this.setValue(new Date(A.dateValue));this.fireEvent("select",this,this.value)}},selectToday:function(){if(this.todayBtn&&!this.todayBtn.disabled){this.setValue(new Date().clearTime());this.fireEvent("select",this,this.value)}},update:function(a,U){var A=this.activeDate;this.activeDate=a;if(!U&&A&&this.el){var K=a.getTime();if(A.getMonth()==a.getMonth()&&A.getFullYear()==a.getFullYear()){this.cells.removeClass("x-date-selected");this.cells.each(function(d){if(d.dom.firstChild.dateValue==K){d.addClass("x-date-selected");setTimeout(function(){try{d.dom.firstChild.focus()}catch(f){}},50);return false}});return }}var G=a.getDaysInMonth();var L=a.getFirstDateOfMonth();var D=L.getDay()-this.startDay;if(D<=this.startDay){D+=7}var V=a.add("mo",-1);var E=V.getDaysInMonth()-D;var C=this.cells.elements;var M=this.textNodes;G+=D;var R=86400000;var X=(new Date(V.getFullYear(),V.getMonth(),E)).clearTime();var W=new Date().clearTime().getTime();var P=a.clearTime().getTime();var O=this.minDate?this.minDate.clearTime():Number.NEGATIVE_INFINITY;var S=this.maxDate?this.maxDate.clearTime():Number.POSITIVE_INFINITY;var Z=this.disabledDatesRE;var N=this.disabledDatesText;var c=this.disabledDays?this.disabledDays.join(""):false;var Y=this.disabledDaysText;var T=this.format;if(this.showToday){var I=new Date().clearTime();var B=(I<O||I>S||(Z&&T&&Z.test(I.dateFormat(T)))||(c&&c.indexOf(I.getDay())!=-1));this.todayBtn.setDisabled(B);this.todayKeyListener[B?"disable":"enable"]()}var H=function(g,d){d.title="";var e=X.getTime();d.firstChild.dateValue=e;if(e==W){d.className+=" x-date-today";d.title=g.todayText}if(e==P){d.className+=" x-date-selected";setTimeout(function(){try{d.firstChild.focus()}catch(h){}},50)}if(e<O){d.className=" x-date-disabled";d.title=g.minText;return }if(e>S){d.className=" x-date-disabled";d.title=g.maxText;return }if(c){if(c.indexOf(X.getDay())!=-1){d.title=Y;d.className=" x-date-disabled"}}if(Z&&T){var f=X.dateFormat(T);if(Z.test(f)){d.title=N.replace("%0",f);d.className=" x-date-disabled"}}};var Q=0;for(;Q<D;Q++){M[Q].innerHTML=(++E);X.setDate(X.getDate()+1);C[Q].className="x-date-prevday";H(this,C[Q])}for(;Q<G;Q++){intDay=Q-D+1;M[Q].innerHTML=(intDay);X.setDate(X.getDate()+1);C[Q].className="x-date-active";H(this,C[Q])}var b=0;for(;Q<42;Q++){M[Q].innerHTML=(++b);X.setDate(X.getDate()+1);C[Q].className="x-date-nextday";H(this,C[Q])}this.mbtn.setText(this.monthNames[a.getMonth()]+" "+a.getFullYear());if(!this.internalRender){var F=this.el.dom.firstChild;var J=F.offsetWidth;this.el.setWidth(J+this.el.getBorderWidth("lr"));Ext.fly(F).setWidth(J);this.internalRender=true;if(Ext.isOpera&&!this.secondPass){F.rows[0].cells[1].style.width=(J-(F.rows[0].cells[0].offsetWidth+F.rows[0].cells[2].offsetWidth))+"px";this.secondPass=true;this.update.defer(10,this,[a])}}},beforeDestroy:function(){if(this.rendered){Ext.destroy(this.mbtn,this.todayBtn)}}});Ext.reg("datepicker",Ext.DatePicker);