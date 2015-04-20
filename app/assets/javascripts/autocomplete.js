/*
* Unobtrusive autocomplete
*
* To use it, you just have to include the HTML attribute autocomplete
* with the autocomplete URL as the value
*
*   Example:
*       <input type="text" data-autocomplete="/url/to/autocomplete">
*
* Optionally, you can use a jQuery selector to specify a field that can
* be updated with the element id whenever you find a matching value
*
*   Example:
*       <input type="text" data-autocomplete="/url/to/autocomplete" data-id-element="#id_field">
*/


(function(jQuery)
{
  var self = null;
  $.fn.railsAutocomplete = function() {
    var handler = function() {
      if (!this.railsAutoCompleter) {
        this.railsAutoCompleter = new $.railsAutocomplete(this);
      }
    };
    if ($.fn.on !== undefined) {
      return jQuery(document).on('focus',this.selector,handler);
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
      e.delimiter = jQuery(e).attr('data-delimiter') || null;
      e.min_length = jQuery(e).attr('min-length') || 2;
      e.append_to = jQuery(e).attr('data-append-to') || null;
      e.autoFocus = jQuery(e).attr('data-auto-focus') || false;
      function split( val ) {
        return val.split( e.delimiter );
      }
      function extractLast( term ) {
        return split( term ).pop().replace(/^\s+/,"");
      }

      jQuery(e).autocomplete({
        appendTo: e.append_to,
        autoFocus: e.autoFocus,
        delay: jQuery(e).attr('delay') || 0,
        source: function( request, response ) {
          var firedFrom = this.element[0];
          var params = {term: extractLast( request.term )};
          if (jQuery(e).attr('data-autocomplete-fields')) {
              $.each($.parseJSON(jQuery(e).attr('data-autocomplete-fields')), function(field, selector) {
              params[field] = jQuery(selector).val();
            });
          }
          $.getJSON( jQuery(e).attr('data-autocomplete'), params, function() {
            if(arguments[0].length === 0) {
              arguments[0] = [];
              arguments[0][0] = { id: "", label: "no existing match" };
            }
            jQuery(arguments[0]).each(function(i, el) {
              var obj = {};
              obj[el.id] = el;
              jQuery(e).data(obj);
            });
            response.apply(null, arguments);
            jQuery(firedFrom).trigger('railsAutocomplete.source', arguments);
          });
        },
        change: function( event, ui ) {
            if(!jQuery(this).is('[data-id-element]') ||
                    jQuery(jQuery(this).attr('data-id-element')).val() === "") {
                    return;
            }
            jQuery(jQuery(this).attr('data-id-element')).val(ui.item ? ui.item.id : "");

            if (jQuery(this).attr('data-update-elements')) {
                var update_elements = $.parseJSON(jQuery(this).attr("data-update-elements"));
                var data = ui.item ? jQuery(this).data(ui.item.id.toString()) : {};
                if(update_elements && jQuery(update_elements['id']).val() === "") {
                  return;
                }
                for (var key in update_elements) {
                    var element = jQuery(update_elements[key]);
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
          if (ui.item.id != "") {
            $(this).parent().children('.autocomplete-container').children('ul').append('<li data-id=' + ui.item.id + '>' + ui.item.value + '</li>')
            $('.ui-autocomplete-input').val('');
            $(this).parent().children('.autocomplete-dropdown ul').empty('');
          }
          // updateMatches();
         
          return false;
        }
      });
    }
  });

  jQuery(document).ready(function(){
    jQuery('input[data-autocomplete]').railsAutocomplete();
  });
})(jQuery);
