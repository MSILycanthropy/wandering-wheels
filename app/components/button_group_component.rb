# frozen_string_literal: true

class ButtonGroupComponent < ApplicationComponent
  renders_many :buttons, lambda { |**options|
    ButtonComponent.new(style: @style, size: @size, link: @link, wide: @wide, **options)
  }

  def initialize(style: :default, size: :default, link: false, wide: false, **options)
    @size = size
    @style = style
    @link = link
    @wide = wide

    @options = options
    @options[:tag] = :div
    @options[:classes] = class_names(
      'btn-group',
      @options[:classes]
    )
  end
end
