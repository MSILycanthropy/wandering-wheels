# frozen_string_literal: true

class AvatarComponent < ApplicationComponent
  SIZE_MAP = {
    small: 'w-8',
    medium: 'w-12',
    large: 'w-16',
    xlarge: 'w-20'
  }.freeze

  TEXT_SIZE_MAP = {
    small: 'text-xs',
    medium: 'text-sm',
    large: 'text-base',
    xlarge: 'text-lg'
  }.freeze

  SHAPE_MAP = {
    circle: 'rounded-full',
    rounded_square: 'rounded-xl',
    squircle: 'mask mask-squircle',
    hexagon: 'mask mask-hexagon',
    octagon: 'mask mask-triangle'
  }.freeze

  def before_render
    @options[:href] = edit_user_path(@user)
  end

  def initialize(user:, size: :small, shape: :circle, **options)
    @user = user
    @size = size

    @options = options
    @options[:tag] = :a
    @options[:data] = { 'turbo-frame': 'modal' }
    @options[:classes] = class_names(
      'avatar',
      'bg-primary',
      SHAPE_MAP[shape],
      { placeholder: src.nil? },
      @options[:classes]
    )
  end

  def call
    if src
      render ApplicationComponent.new(**@options) do
        content_tag :div, class: SIZE_MAP[@size] do
          image_tag src
        end
      end
    else
      render ApplicationComponent.new(**@options) do
        content_tag :div, class: SIZE_MAP[@size] do
          content_tag :span, fallback_text, class: TEXT_SIZE_MAP[@size]
        end
      end
    end
  end

  private

  def src
    return if @user.avatar.nil?

    @user.avatar.url unless @user.avatar.url.blank?
  end

  def fallback_text
    @user.first_name[0] + @user.last_name[0]
  end
end
