jQuery -> 
  window.animTm = 800 
  window.animTl = animTm*1.5
  animD = animTm*.5
  animDelayTTextMoveUp = animD+animTm+animD*.3 #Delay before text start moving up after correct all mistakes
  animDelayTAuthorAppear = animD+animTm+animD*.3+animTl #Delay before next button appear
  animDelayTNextBtnAppear = animD+animTm+animD*.3+animTl*2 #Delay before next button appear

  string = referencetext #created by ruby (CDATA)
  c_taskText = $ '.taskText'
  c_mistakeCount = $ '.mistakeCount'

  #Pluralize mistakes count
  plurMis = (count) ->  
    if count == 1 
      return "mistake"
    else
      return "mistakes"

  #Call diff function to count mistakes
  count_mistakes = ->
    current = c_taskText.text()
    return diffString current, string
  
  #Out put string in format "$miscount mistakes/mistake"
  output_mistakes = ->
    return c_mistakeCount.html mis + ' ' + plurMis mis

  #Count mistake after page load
  mis = count_mistakes()
  output_mistakes()

  #Count mistake after text edit
  c_taskText.bind 'keyup', -> 
    mis = count_mistakes()
    output_mistakes()
    #Check if all mistakes corrected
    if mis == 0
      $('.mistakeCounter').delay(animD).fadeOut(animTm) #hide mistake counter
      $('.taskText').delay(animDelayTTextMoveUp).animate({'margin-top': '220px'}, { duration: animTl, easing: 'easeInOutSine' }) #show author name
      $('.taskAuthor').delay(animDelayTAuthorAppear).animate({opacity: '1'}, animTm) #show author name
      $('.endContainer').delay(animDelayTNextBtnAppear).fadeIn(animTm) #show good, about text, next btn
      $(this).blur()
