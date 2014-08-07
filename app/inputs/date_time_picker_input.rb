class DateTimePickerInput < SimpleForm::Inputs::Base
  def input
    # template.content_tag(:div, class: 'input-group date data-ru-datepicker') do
    #   template.concat @builder.text_field(attribute_name, input_html_options)
    #   template.concat span_remove
    #   template.concat span_table
    # end
    datepicker_opt = ''
    if options.delete(:hide_sundays)
      datepicker_opt = '{beforeShowDay: $.datepicker.noSundays}'
    end

    template.content_tag(:div, class: 'input-group') do
      template.concat @builder.text_field(attribute_name, input_html_options.merge(value: template.l(object.send(attribute_name))))
      template.concat template.javascript_tag("$('input[name=\"#{@builder.object_name}[#{attribute_name}]\"]').datepicker(#{datepicker_opt})")
    end
  end

  # def input_html_options
  #   {class: 'data-ru-datepicker', readonly: true}
  # end

  def span_remove
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_remove
    end
  end

  def span_table
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_table
    end
  end

  def icon_remove
    "<i class='glyphicon glyphicon-remove'></i>".html_safe
  end

  def icon_table
    "<i class='glyphicon glyphicon-th'></i>".html_safe
  end

end