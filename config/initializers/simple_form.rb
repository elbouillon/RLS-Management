# copied from http://dev.otrobloggeek.com/2011/11/02/how-to-use-twitter-bootstrap-with-simple-form.html
SimpleForm.setup do |config|
  config.hint_class = "hint input"
  config.error_class = "error input"
  config.wrapper_class = :clearfix
  config.wrapper_error_class = :error
end

SimpleForm::Inputs.constants.each do |klazz|
  next if klazz == :Base
  "SimpleForm::Inputs::#{klazz.to_s}".constantize.class_eval do
    def input_with_surrounding_div
      @builder.template.content_tag :div, input_without_surrounding_div, :class => "input"
    end
    alias_method_chain :input, :surrounding_div
  end
end

