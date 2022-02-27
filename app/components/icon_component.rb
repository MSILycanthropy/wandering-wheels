# frozen_string_literal: true

class IconComponent < ApplicationComponent
  def initialize(prefix: 'fas', icon:, size: :md, **options)
    @icon = icon
    @size = size

    @options = options
    @options[:tag] = :i
    @options[:classes] = class_names(
      prefix,
      "fa-#{icon}",
      "fa-#{size}",
      @options[:classes]
    )
  end

  def call
    render ApplicationComponent.new(**@options)
  end
end
