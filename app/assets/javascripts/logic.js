 $(function() {
      var animateTime = 50;
      var string = referencetext;

      function anim(){
        var txt = $('#msg');
        txt.fadeIn(animateTime).fadeOut(animateTime);
      }

      function count_mistakes(){
        var current = $('#tasktext').text();
        return diffString(current,string);
      }
      $('#mistakes').html(count_mistakes());

      $("#tasktext").bind('focus', function() {
        anim();
      });

      $("#tasktext").bind('blur', function() {
        anim();
      });

      $("#tasktext").bind('keyup', function() {
        anim();
        mis = count_mistakes();
        $('#mistakes').html(mis);
        if(mis == 0){
          $("#correct").show();
          $(this).blur();
        }

      });





      $(".red").bind('mouseover', function() {
        $(this).animate({opacity: 0.25},200);
      });
      $(".red").bind('mouseout', function() {
        $(this).animate({opacity: 1},200);
      });
    });