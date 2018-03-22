<link rel="stylesheet" type="text/css" media="screen" href="/css/cmxform.css" />
<script src="/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
$().ready(function(){
	$("#feedbackForm").validate({
		rules: {
			name: "required",
			phone_email: "required",
			message: "required"
		},
		messages: {
			name: "Пожалуйста, введите ваше имя",
			phone_email: "Пожалуйста, введите e-mail или номер телефона",
			message: "Пожалуйста, введите сообщение"
		},
		submitHandler: function() {
			var pars = {
				mod_name: "feedback_action",
				action: "send_message",
				ajax: 1
			};
			$('#feedbackForm [name]:visible').each(function(){
				pars['feedbackForm_' + $(this).attr('name')] = '' + $(this).val();
			});

			$.post('/index.php', pars, function(v){
				if (v.message) {$("#feedback_content").html(v.message);window.scrollTo(0, 0);}
			}, 'json');
		}
	});
});
</script>

<div class="content">
	<div class="infobox_heading">Обратная связь</div>

	<h1>Отправить сообщение с сайта</h1>
	<br />

	<div id="feedback_content">
	<style>
		#feedbackForm { width: 100%; }
		#feedbackForm input { width: 250px; }
		#feedbackForm input.submit { width: 144px; height: 23px; border: 0; }
		#feedbackForm #message { width: 250px; height: 100px; }
	</style>
	
	<form class="cmxform" id="feedbackForm" method="post" action="">
		<fieldset>
			<p>
				<label for="name">Контактное лицо:</label>
				<input id="name" name="name" />
			<p>
				<label for="phone_email">E-mail или телефон:</label>
				<input id="phone_email" name="phone_email" />
			</p>
			<p>
				<label for="message">Сообщение:</label>
				<textarea id="message" name="message"></textarea>
			</p>
			<p>
				<input class="submit" type="image" src="/index_files/button_sendmsg.gif" alt="Отправить сообщение" title="Отправить сообщение" />
			</p>
		</fieldset>
	</form>
	</div>
</div>