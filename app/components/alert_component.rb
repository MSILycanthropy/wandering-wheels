# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  TYPE_MAP = {
    success: 'alert-success',
    danger: 'alert-danger',
    warning: 'alert-warning',
    info: 'alert-info'
  }.freeze

  def initialize(message:, type:, **options)
    @options = options
    @options[:tag] = :div
    @options[:classes] = class_names(
      'alert',
      TYPE_MAP[type],
      options[:classes]
    )
    @options[:data] = {
      controller: 'alert'
    }

    @message = message
  end

  def call
    render ApplicationComponent.new(**@options) do
      @message
    end
  end
end
