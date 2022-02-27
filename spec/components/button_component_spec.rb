require 'rails_helper'

RSpec.describe ButtonComponent, type: :component do
  it 'renders a button' do
    render_inline(described_class.new(text: 'Button'))
    expect(rendered_component).to have_css 'button.btn'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a button as a link' do
    render_inline(described_class.new(text: 'Button', link: true))

    expect(rendered_component).to have_css 'a.btn'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a button with specified style' do
    render_inline(described_class.new(text: 'Button', style: :primary))

    expect(rendered_component).to have_css 'button.btn.btn-primary'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a button with specified size' do
    render_inline(described_class.new(text: 'Button', size: :xsmall))

    expect(rendered_component).to have_css 'button.btn.btn-xs'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a button with specified shape' do
    render_inline(described_class.new(text: 'Button', shape: :circle))

    expect(rendered_component).to have_css 'button.btn.btn-circle'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a button with specified disabled state' do
    render_inline(described_class.new(text: 'Button', disabled: true))

    expect(rendered_component).to have_css 'button.btn.btn-disabled'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a button with specified loading state' do
    render_inline(described_class.new(text: 'Button', loading: true))

    expect(rendered_component).to have_css 'button.btn.loading'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a wide button' do
    render_inline(described_class.new(text: 'Button', wide: true))

    expect(rendered_component).to have_css 'button.btn.btn-wide'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a block button' do
    render_inline(described_class.new(text: 'Button', block: true))

    expect(rendered_component).to have_css 'button.btn.btn-block'
    expect(rendered_component).to have_text 'Button'
  end

  it 'renders a glass button' do
    render_inline(described_class.new(text: 'Button', glass: true))

    expect(rendered_component).to have_css 'button.btn.glass'
    expect(rendered_component).to have_text 'Button'
  end
end
