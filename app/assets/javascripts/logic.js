 $(function() {
      var animlen = 50;
      var string = referencetext;
      function anim(){
        var txt = $('#msg');
        txt.fadeIn(animlen).fadeOut(animlen);
        //$('#msg').text($('#main').html());
      }
        $("#main").bind('focus', function() {
          anim();
        });

        $("#main").bind('keyup', function() {
          anim();
          var current = $('#main').text();

          if($.trim(current) == string){
            $("#correct").show();
            $(this).blur();
          }
        });
        $("#main").bind('blur', function() {
          anim();
        });
        $(".red").bind('mouseover', function() {
          $(this).animate({opacity: 0.25},200);
        });
        $(".red").bind('mouseout', function() {
          $(this).animate({opacity: 1},200);
        });
      });