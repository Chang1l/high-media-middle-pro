$(function() {
		$('#select').change(function() {
			if ($('#select').val() == 'directly') {
				$('#textEmail').attr("disabled", false);
				$('#textEmail').val("");
				$('#textEmail').focus();
			} else {
				$('#textEmail').val($('#select').val());
			}
		})
	});

	function checkForm() {
		if (document.joinform.m_id.value == "") {
			alert("아이디를 반드시 입력하세요.");
			return false;
		}
		if (document.joinform.m_pw.value == "") {
			alert("비밀번호를 반드시 입력하세요.");
			return false;
		}
		if (document.joinform.password_confirm.value == "") {
			alert("비밀번호확인란을 반드시 입력하세요.");
			return false;
		}
		if (document.joinform.m_name.value == "") {
			alert("이름을 반드시 입력하세요.");
			return false;
		}
		if (document.joinform.m_pw.value != document.joinform.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		if (document.joinform.m_tel.value == "") {
			alert("전화번호를 반드시 입력하세요.");
			return false;
		}
		if (document.joinform.m_birth.value == "") {
			alert("생년월일을 선택하세요.");
			return false;
		}
	}

	$(document).ready(
			function() {
				$('#m_id').focus(function() {
					$('#m_id1').removeAttr('hidden');
				});
				$('#m_id').blur(function() {
					$('#m_id1').attr('hidden', 'hidden');
				});
				$('#m_pw').focus(function() {
					$('#m_pw1').removeAttr('hidden');
				});
				$('#m_pw').blur(function() {
					$('#m_pw1').attr('hidden', 'hidden');
				});
				$('#m_pwc').focus(function() {
					$('#m_pw2').removeAttr('hidden');
				});
				$('#m_pwc').blur(function() {
					$('#m_pw2').attr('hidden', 'hidden');
				});
				$('#m_tel').focus(function() {
					$('#m_tel1').removeAttr('hidden');
				});
				$('#m_tel').blur(function() {
					$('#m_tel1').attr('hidden', 'hidden');
				});
				$('#m_email').focus(function() {
					$('#m_email1').removeAttr('hidden');
				});
				$('#m_email').blur(function() {
					$('#m_email1').attr('hidden', 'hidden');
				});

				$('#m_id').keyup(
						function() {
							$.ajax({
								url : "./loginCheck",
								type : "post",
								data : {
									"m_id" : $('#m_id').val()
								},
								cache : false,
								success : function(data) {
									console.log('success');
									$('#m_idMessage')
											.html(
													"<small class='text-danger'>"
															+ data.map.str
															+ "</small>");
								},
								error : function() {
									alert('error');
								}
							});
						});
			});
			
			function onlyAlphabet(ele) {
		ele.value = ele.value.replace(/[^\\!-z]/gi, "");
	}
	
	function deletecheck(){
		if (confirm("정말 탈퇴하시겠습니까?")){ 
			$('#deleteform').submit();
			 }
	}	