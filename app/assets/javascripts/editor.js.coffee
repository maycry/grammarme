jQuery -> 
  window.animTm           = 800 
  window.animTl           = animTm*1.5
  animD                   = animTm*.5
  animDelayTTextMoveUp    = animD+animTm+animD*.3
  animDelayTAuthorAppear  = animD+animTm+animD*.3+animTl
  animDelayTNextBtnAppear = animD+animTm+animD*.3+animTl*2

  mis = 0 #mistakes count

  c_taskText = $ '.taskText'
  c_mistakeCount = $ '.mistakeCount'

  #Pluralize mistakes count
  window.plurMis = (count) ->  
    if count == 1 then return "mistake" else return "mistakes"

  #Count mistakes in text and output
  window.outputMistakes = ->
    currentText = $('.taskText').text()
    mis = diffString(currentText, window.referencetext)
    return $('.mistakeCount').html(mis+' '+plurMis(mis))

  updateErrorExplanation = (source) ->
    $('p.errorExpl').html(source.attr('data'))

  window.initMistakesExplonation = (source) ->
    $('mistake:first').addClass('active') #add error explonation after task complete from data attribute
    updateErrorExplanation(source)


  #Count mistake after page load
  outputMistakes()

  #Count mistake after text edit
  c_taskText.bind 'keyup', -> 
    outputMistakes()
    #Check if all mistakes corrected
    if mis == 0
      initMistakesExplonation($('mistake:first'))
      #Animation sequence after cpmpleting task
      $('.mistakeCounter').delay(animD).fadeOut(animTm) #hide mistake counter
      $('.taskText').delay(animDelayTTextMoveUp).animate({'margin-top': '220px'}, { duration: animTl, easing: 'easeInOutSine' }).delay(animTl*2).animate({'opacity': '0'}, animTl) #move up text
      $('.taskTextHightlighted').delay(animDelayTNextBtnAppear).fadeIn() #show text with highlighted corrected errors
      $('.taskAuthor').delay(animDelayTAuthorAppear).animate({opacity: '1'}, animTm) #show author name
      $('.endContainer').delay(animDelayTNextBtnAppear).fadeIn(animTm) #show good, about text, next btn
      $(this).attr('contenteditable', 'false') #make text not editable

  #Show error explonation for clicked error
  $('mistake').livequery 'click', ->
    $('mistake').each ->
      $(this).removeClass('active')
    $(this).addClass('active')
    updateErrorExplanation($(this))
    
