# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ($) ->

  insertInput = (e) ->
    e.preventDefault()
    type = $(@).find('div.items').attr('id')
    $(@).find('div.items').append("
        <div class='item-insert'>
          <input type='text' autofocus='autofocus' style='width:90%' class=#{type}></input>
          <a href='#' class='btn new-save'>Save</a>
          <a href='#' class='new-cancel'>Cancel</a>
        </div>
      ")
    $(@).off 'click', insertInput

  $('td.area').on 'click', insertInput


  $('div.items').on
  'click': (e) ->
    e.stopPropagation()
    e.preventDefault()
    $(@).val('')
  'input'

  $('td.area').on
    'click': (e) ->
      e.stopPropagation()
      e.preventDefault()
      inputField = $(@).closest('.item-insert').find('input')
      content = $(inputField).val()
      canvasComponent = $(@).closest('td.area').attr('id')
      link = $(location).attr('href') + '/' + canvasComponent
      if content isnt ''
        $.ajax
          url: link
          type: 'POST'
          data:
            toSent: content
          success: (data) =>
            console.log(data.text)
            $(@).closest('.item-insert').hide()
            $(@).closest('div.items').find('ol').append("
              <li data-id=#{data.id}>
                #{content}
                <div class='options pull-right'>
                  <a href='#' rel='tooltip' title='Delete item' class='remove-item'><i class='icon-remove'></i></a>
                </div>
              </li>
            ")
            $(@).closest('td.area').on 'click', insertInput
      else
        $(inputField).effect('highlight')
    'a.new-save'

  $('div.items').on
    'click': (e) ->
      e.stopPropagation()
      e.preventDefault()
      $(@).closest('.item-insert').hide()
      $(@).closest('td.area').on 'click', insertInput
    'a.new-cancel'

  $('div.items'). on
    'click': (e) ->
      e.stopPropagation()
      e.preventDefault()
      console.log('for item content edit')
    'mouseenter': (e) ->
      e.stopPropagation()
      e.preventDefault()
      $(@).find('.options').css('display', 'inline')
    'mouseleave': (e) ->
      e.stopPropagation()
      e.preventDefault()
      $(@).find('.options').css('display', 'none')
    '.item-container'


  $('div.items').on
    'click': (e) ->
      e.stopPropagation()
      e.preventDefault()
      baseLink = $(location).attr('href')
      canvasComponent = $(@).closest('td.area').attr('id')
      id = $(@).closest('li').attr('data-id')
      console.log(id)
      link = "#{baseLink}/#{canvasComponent}/#{id}.json"
      $.ajax
        url: link
        type: 'DELETE'
        success: (data) =>
          console.log(data.text)
          $(@).closest('li').hide()
    'mouseenter': (e) ->
      $(@).tooltip('show')
    'mouseleave': (e) ->
      $(@).tooltip('hide')
    'a.remove-item'
