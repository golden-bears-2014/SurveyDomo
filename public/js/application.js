$(document).ready(function() {

    $(".add-question").on( 'click', function(event){
      event.preventDefault()
      addQuestion(event)
    })
});

var addQuestion = function(event) {
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
  $('.question-list').append(new_question.attr('class', 'question-choices'));
}

var printGraph = function(question, answers, choices){

  var choice_content = [];
  var answer_count = [];

  for (var c in choices) {
    choice_content.push(choices[c].content);
    var answer_array = [];
    for (var a in answers) {
        if (answers[a].choice_id === choices[c].id){
          answer_array.push(answers[a]);
        }
    }
    answer_count.push(answer_array.length);
  }

  var graphId = "graph"+question.id;
  $(".container").append("<div id="+graphId+" class='graph'></div><br/><br/>");
  formatGraph(question, choice_content, answer_count);

};

var formatGraph = function (question, choices, answerCount) {
        $('#graph'+question.id).highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: question.content
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: choices
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Total Tally'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0"></td>' +
                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [
                    {
                showInLegend: false,
                data: answerCount
            }
            ]
        });

    };

