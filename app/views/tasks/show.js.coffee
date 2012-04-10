$('.taskText').fadeOut(animTm)
$('.endContainer').fadeOut(animTm) #show good, about text, next btn
$('.taskAuthor').fadeOut(animTm) #show good, about text, next btn

taskFadeIn = (ms, func) -> setTimeout func, ms
taskFadeIn animTl, -> 
	$('.taskText').html('<%= escape_javascript(render "nextTaskText")%>').css('margin-top':'220px').fadeIn()
	$('.tasksCurrentNumber__tasksRibbon').html('<%= escape_javascript(render "layouts/currentTaskNumber")%>').fadeIn()
    $('.mistakeCounter').fadeIn(animTm) #hide mistake counter

