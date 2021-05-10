document.addEventListener("turbolinks:load", function() {
  $options_list    = $('#options_list');
  $new_option      = $('#new_option');
  $add_option      = $('#add_option');
  $random_choice   = $('#random_choice');
  $knockout_choice = $('#knockout_choice');
  $knockout        = $('#knockout');
  $knockout_a      = $('#knockout_a');
  $knockout_b      = $('#knockout_b');
  $result          = $('#result');
  $decision        = $('#decision');
  $make_decision   = $('#make_decision');
  var options          = null;

  $add_option.on('click', addOptionToList);
  $knockout_choice.on('click', showKnockoutChoice);
  $random_choice.on('click', showRandomChoice);

});

function addOptionToList() {
  if($new_option.val() > '') {
    $options_list.append($('<li>').append($new_option.val()));
    $new_option.val('');
    $new_option.focus();
    getOptions();
    xableButtons();
  }
}

function showKnockoutChoice() {
  getOptions();
  if(options.length > 2) {
      $make_decision.addClass('hidden');
      $random_choice.addClass('hidden');
      $knockout_choice.addClass('hidden');
      $knockout.removeClass('hidden');

      presentKnockout();
      listenKnockout();
  }
}

function listenKnockout() {
  $knockout_a.on('click', function(event) {
    knockoutOption(knockout_b);
  });

  $knockout_b.on('click', function(event) {
    knockoutOption(knockout_a)
  });
}

function knockoutOption(index) {
  options.splice(index, 1);
  presentKnockout();
}

function presentKnockout() {
  if (options.length < 2) {
    showResult(options[0].innerText);
    return;
  }

  knockout_a = getRandomIndex();
  do {
    knockout_b = getRandomIndex()
  } while (knockout_a == knockout_b);

  $knockout_a.val(options[knockout_a].innerText);
  $knockout_b.val(options[knockout_b].innerText);

}

function getRandomIndex() {
  return Math.floor(Math.random() * options.length);
}

function showRandomChoice() {
  getOptions();
  if(options.length > 0) {
    showResult(getRandomOption());
  }
}

function getRandomOption() {
  return options[getRandomIndex()].innerText;
}

function getOptions() {
  options = $options_list.children('li').toArray()
}

function xableButtons() {
  disable = (options.length < 2);
  $random_choice.attr('disabled', disable);
  $knockout_choice.attr('disabled', disable);
}

function showResult(result) {
  $decision.text(result);
  $result.removeClass('hidden');
  $knockout.addClass('hidden');
  $make_decision.addClass('hidden');
}

/*
------------------------------------

@GregHome ||= {}

class GregHome.Decision
  constructor: ->

    @listen()

  listen: ->
    @$add_option.on 'click', (event) =>
      if @$new_option.val() > ''
        @add_to_options_list(@$new_option.val())

    @$knockout_choice.on 'click', (event) =>
      @show_knockout_choice()

    @$random_choice.on 'click', (event) =>
      @show_random_choice()

  add_to_options_list: ->
    @$options_list
    .append($('<li>')
      .append(@$new_option.val()))
    @$new_option.val('')
    @$new_option.focus()
    @get_options()
    @xable_buttons()

  xable_buttons: ->
    disable = (@options.length < 2)
    @$random_choice.attr("disabled", disable)
    @$knockout_choice.attr("disabled", disable)

  get_options: ->
    @options = @$options_list.children('li').toArray()

  show_random_choice: ->
    @get_options()
    if @options.length > 0
      @show_result(@get_random_option())

  show_result: (result) ->
    @$decision.text(result)
    @$result.removeClass('hidden')
    @$knockout.addClass('hidden')
    @$make_decision.addClass('hidden')

  show_knockout_choice: ->
    @get_options()
    if @options.length > 2
      @$make_decision.addClass('hidden')
      @$random_choice.addClass('hidden')
      @$knockout_choice.addClass('hidden')
      @$knockout.removeClass('hidden')

      @present_knockout()

      @listen_knockout()

  listen_knockout: ->
    @$knockout_a.on 'click', (event) =>
      @knockout_option(@knockout_b)

    @$knockout_b.on 'click', (event) =>
      @knockout_option(@knockout_a)

  knockout_option: (index) ->
    @options.splice(index, 1)
    @present_knockout()

  present_knockout: ->
    if @options.length < 2
      @show_result(@options[0].innerText)
      return

    @knockout_a = @get_random_index()
    loop
      @knockout_b = @get_random_index()
      break unless @knockout_a == @knockout_b

    @$knockout_a.val(@options[@knockout_a].innerText)
    @$knockout_b.val(@options[@knockout_b].innerText)

  get_random_index: ->
    return Math.floor(Math.random() * @options.length)

  get_random_option: ->
    return @options[@get_random_index()].innerText
*/