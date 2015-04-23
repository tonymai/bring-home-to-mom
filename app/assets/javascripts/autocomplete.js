/*
* Unobtrusive autocomplete
*/

(function($)
{
  var self = null;
  $.fn.railsAutocomplete = function() {
    var handler = function() {
      if (!this.railsAutoCompleter) {
        this.railsAutoCompleter = new $.railsAutocomplete(this);
      }
    };
    if ($.fn.on !== undefined) {
      return $(document).on('focus',this.selector,handler);
    }
    else {
      return this.live('focus',handler);
    }
  };

  $.railsAutocomplete = function (e) {
    var _e = e;
    this.init(_e);
  };

  $.railsAutocomplete.fn = $.railsAutocomplete.prototype = {
    railsAutocomplete: '0.0.1'
  };

  $.railsAutocomplete.fn.extend = $.railsAutocomplete.extend = $.extend;
  $.railsAutocomplete.fn.extend({
    init: function(e) {
      e.delimiter = $(e).attr('data-delimiter') || null;
      e.min_length = $(e).attr('min-length') || 2;
      e.append_to = $(e).attr('data-append-to') || null;
      e.autoFocus = $(e).attr('data-auto-focus') || false;
      function split( val ) {
        return val.split( e.delimiter );
      }
      function extractLast( term ) {
        return split( term ).pop().replace(/^\s+/,"");
      }

      $(e).autocomplete({
        appendTo: e.append_to,
        autoFocus: e.autoFocus,
        delay: $(e).attr('delay') || 0,
        source: function( request, response ) {
          var firedFrom = this.element[0];
          var params = {term: extractLast( request.term )};
          if ($(e).attr('data-autocomplete-fields')) {
              $.each($.parseJSON($(e).attr('data-autocomplete-fields')), function(field, selector) {
              params[field] = $(selector).val();
            });
          }
          $.getJSON( $(e).attr('data-autocomplete'), params, function() {
            if(arguments[0].length === 0) {
              arguments[0] = [];
              arguments[0][0] = { id: "", label: "no existing match" };
            }
            $(arguments[0]).each(function(i, el) {
              var obj = {};
              obj[el.id] = el;
              $(e).data(obj);
            });
            response.apply(null, arguments);
            $(firedFrom).trigger('railsAutocomplete.source', arguments);
          });
        },
        change: function( event, ui ) {
            if(!$(this).is('[data-id-element]') ||
                    $($(this).attr('data-id-element')).val() === "") {
                    return;
            }
            $($(this).attr('data-id-element')).val(ui.item ? ui.item.id : "");

            if ($(this).attr('data-update-elements')) {
                var update_elements = $.parseJSON($(this).attr("data-update-elements"));
                var data = ui.item ? $(this).data(ui.item.id.toString()) : {};
                if(update_elements && $(update_elements['id']).val() === "") {
                  return;
                }
                for (var key in update_elements) {
                    var element = $(update_elements[key]);
                    if (element.is(':checkbox')) {
                        if (data[key] != null) {
                            element.prop('checked', data[key]);
                        }
                    } else {
                        element.val(ui.item ? data[key] : "");
                    }
                }
            }
        },
        search: function() {
          // custom minLength
          var term = extractLast( this.value );
          if ( term.length < e.min_length ) {
            return false;
          }
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {

          // to prevent duplicates from being added
          var $elements = $(this).parent().children('.autocomplete-container').children('.interest-btn')
          var ids = $.map($elements, function(element) { return $(element).attr('data-id') });

          var source = $('.autocomplete-template').html();
          var templatingFunction = Handlebars.compile(source);
          var context = {};

          if (ui.item.id != "" && ids.indexOf(ui.item.id) === -1 ) {
            context = ui.item;
            $(this).parent().children('.autocomplete-container').append(templatingFunction(context));
            $('.ui-autocomplete-input').val('');
            $(this).parent().children('.autocomplete-dropdown ul').empty('');
          }
          updateMatches();
         
          return false;
        }
      });
    }
  });

  $(document).on('page:change', function(){
    $('input[data-autocomplete]').railsAutocomplete();

    $('.autocomplete-container').on('click', '.autocomplete-tag', function(e) {
      e.preventDefault();

      $selectedTag = $(this).prev();
      $deleteTag = $(this)
      $selectedTag.hide('fast', function() {
        $selectedTag.remove();
        $deleteTag.remove();
        updateMatches();
      });
      
    });

  });
})($);
