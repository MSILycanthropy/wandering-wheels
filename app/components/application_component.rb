class ApplicationComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(tag: nil, classes: nil, **options)
    @tag = tag
    @classes = classes
    @options = options
  end

  def call
    content_tag(@tag, content, class: @classes.present? ? @classes : nil, **@options) if @tag
  end

  def class_names(*args)
    classes = []

    args.each do |arg|
      case arg
      when String
        classes << arg
      when Symbol
        classes << arg.to_s.dasherize
      when Array
        classes << class_names(*arg).presence
      when Hash
        arg.each do |key, value|
          classes << key if value
        end
      end
    end

    classes.reject(&:blank?).compact.uniq.join(' ')
  end
end
