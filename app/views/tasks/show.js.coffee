$('.taskText').fadeOut(animTm)
$('.taskAuthor').animate({opacity: '0'}, animTm) 
$('.endContainer').fadeOut(animTm)
window.referencetext = '<%= escape_javascript(@task.reference) %>'# change reference text for logic

taskFadeIn = (ms, func) -> setTimeout func, ms
taskFadeIn animTl, -> 
	$('.nextBtn').replaceWith('<%= escape_javascript(render "nextBtn")%>')
	$('.taskText').html('<%= escape_javascript(render "nextTaskText")%>').css('margin-top':'260px').fadeIn()
	#Renew mistake counter
	mis=diffString(window.referencetext, $('.taskText').text())
	$('.mistakeCount').html(mis + ' ' + plurMis mis)
	
	$('.tasksCurrentNumber__tasksRibbon').html('<%= escape_javascript(render "layouts/currentTaskNumber") %>').fadeIn()
	$('.mistakeCounter').fadeIn(animTm) #hide mistake counter

