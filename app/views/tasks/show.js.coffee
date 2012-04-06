c_text = $('.taskText')
c_nextBtn = $('.nextBtn') 
fadeTime = 500
c_text.fadeOut(fadeTime)

taskFadeIn = (ms, func) -> setTimeout func, ms
taskFadeIn fadeTime, -> 
	c_text.html('<%= escape_javascript(render "nextTaskText")%>').fadeIn()
