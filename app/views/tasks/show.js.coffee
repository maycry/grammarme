$('.taskTextHightlighted').fadeOut(animTm)
$('.taskAuthor').animate({opacity: '0'}, animTm) 
$('.endContainer').fadeOut(animTm)
window.referencetext = '<%= escape_javascript(@task.reference) %>'# change reference text for logic

taskFadeIn = (ms, func) -> setTimeout func, ms
taskFadeIn animTl, -> 
	$('.nextBtn').replaceWith('<%= escape_javascript(render "nextBtn")%>')
	$('.taskText').html('<%= escape_javascript(render "nextTaskText")%>').css('margin-top':'260px').attr('contenteditable', 'true').animate({opacity: '1'}, animTm) 
	$('.taskTextHightlighted').html('<%= escape_javascript(render "nextTaskTextHighlighted")%>')
	$('.tasksCurrentNumber__tasksRibbon').html('<%= escape_javascript(render "layouts/currentTaskNumber") %>').fadeIn()
	$('.mistakeCounter').fadeIn(animTm) #hide mistake counter

	#Renew mistake counter
	mis=diffString(window.referencetext, $('.taskText').text())
	$('.mistakeCount').html(mis + ' ' + plurMis mis)

