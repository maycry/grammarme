jQuery -> 
  animateTime = 50
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
      $('#correct').fadeIn()
      $('.nextBtn').fadeIn()
      $('.mistakeCounter').fadeOut()
      $('.taskAuthor').fadeIn()
      $(this).blur()
