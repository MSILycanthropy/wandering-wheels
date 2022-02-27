# frozen_string_literal: true

class ModalComponent < ApplicationComponent
  renders_one :body, lambda { |**options|
    options[:tag] = :div
    options[:classes] = class_names(
      'modal-box',
      options[:classes]
    )
    ApplicationComponent.new(**options)
  }

  def initialize(**options)
    @options = options
    @options[:tag] = :div
    @options[:data] = { controller: 'modal' }
    @options[:classes] = class_names(
      'modal',
      @options[:classes]
    )
  end
end
