# frozen_string_literal: true

class ButtonComponent < ApplicationComponent
  STYLE_MAP = {
    default: '',
    primary: 'btn-primary',
    secondary: 'btn-secondary',
    accent: 'btn-accent',
    info: 'btn-info',
    success: 'btn-success',
    warning: 'btn-warning',
    error: 'btn-error',
    ghost: 'btn-ghost',
    outline: 'btn-outline'
  }.freeze

  SIZE_MAP = {
    default: '',
    xsmall: 'btn-xs',
    small: 'btn-sm',
    medium: 'btn-md',
    large: 'btn-lg'
  }.freeze

  SHAPE_MAP = {
    default: '',
    circle: 'btn-circle',
    square: 'btn-square'
  }.freeze

  def initialize(text:, size: :default, style: :default, shape: :default, disabled: false, link: false,
                 loading: false, wide: false, block: false, glass: false, active: false, **options)

    @text = text

    @options = options
    @options[:tag] = :button
    @options[:tag] = :a if link
    @options[:classes] = class_names(
      'btn',
      STYLE_MAP[style],
      SIZE_MAP[size],
      SHAPE_MAP[shape],
      { 'btn-wide': wide, 'btn-block': block, 'btn-disabled': disabled, 'btn-active': active, glass:, loading: },
      @options[:classes]
    )
  end

  def call
    render ApplicationComponent.new(**@options) do
      @text
    end
  end
end
