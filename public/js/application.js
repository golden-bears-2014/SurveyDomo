$(document).ready(function() {


  //  $("survey").on('submit', function(event){
  //   event.preventDefault();
  //   form_data = $(this).serialize();

  //   $.ajax({
  //     type: this.method,
  //     url: this.action,
  //     data: form_data
  //   }).done(function(server_data){
  //     console.log(server_data)
  //     // $('#die').html(server_data);


  //   });

  // });

    $(".add-question").on('click', function(event){
      event.preventDefault();
      // alert('Add was clicked');
      var next_num = $('.question-choices').length + 1
      $('.question-choices-template input:first').attr('name',"question" + next_num)
      var i = 1;
      $.each($('.question-choices-template').children(), function(index, value){
        if(index > 0){
          value.name = 'q' + next_num + 'c' + i;
          i++
        }

      });

      var new_question = $('.question-choices-template').clone();
      // new_question.attr('')
      // $(".question-choices-template input:first").attr('name',"question" + next_num)
      new_question.first
      $('.question-list').append(new_question.attr('class', 'question-choices'));
    })


   // $("survey").on('done'), function(event){
   //  event.preventDefault();



   // };

   // $("survey").on('')
})
