jQuery -> 
  $('.taskText').focus ->
    $('.bulb').delay(animTm).fadeOut(animTm);
    
  $('.taskText').bind 'keyup', -> 
    $('.hint').delay(animTm).fadeOut(animTm);
