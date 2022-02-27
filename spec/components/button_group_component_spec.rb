require 'rails_helper'

RSpec.describe ButtonGroupComponent, type: :component do
  it 'renders a button group' do
    render_inline(described_class.new) do |component|
      component.button(text: 'Button 1')
      component.button(text: 'Button 2')
    end

    expect(rendered_component).to have_css 'div.btn-group'
    expect(rendered_component).to have_css 'div.btn-group > button.btn'
    expect(rendered_component).to have_css 'div.btn-group > button.btn', count: 2
  end

  it 'renders a button group with specified size' do
    render_inline(described_class.new(size: :small)) do |component|
      component.button(text: 'Button 1')
      component.button(text: 'Button 2')
    end

    expect(rendered_component).to have_css 'div.btn-group'
    expect(rendered_component).to have_css 'div.btn-group > button.btn.btn-sm'
    expect(rendered_component).to have_css 'div.btn-group > button.btn.btn-sm', count: 2
  end

  it 'renders a button group with specified style' do
    render_inline(described_class.new(style: :primary)) do |component|
      component.button(text: 'Button 1')
      component.button(text: 'Button 2')
    end

    expect(rendered_component).to have_css 'div.btn-group'
    expect(rendered_component).to have_css 'div.btn-group > button.btn.btn-primary'
    expect(rendered_component).to have_css 'div.btn-group > button.btn.btn-primary', count: 2
  end

  it 'renders a wide button group' do
    render_inline(described_class.new(wide: true)) do |component|
      component.button(text: 'Button 1')
      component.button(text: 'Button 2')
    end

    expect(rendered_component).to have_css 'div.btn-group'
    expect(rendered_component).to have_css 'div.btn-group > button.btn.btn-wide'
    expect(rendered_component).to have_css 'div.btn-group > button.btn.btn-wide', count: 2
  end

  it 'renders a link button group' do
    render_inline(described_class.new(link: true)) do |component|
      component.button(text: 'Button 1')
      component.button(text: 'Button 2')
    end

    expect(rendered_component).to have_css 'div.btn-group'
    expect(rendered_component).to have_css 'div.btn-group > a.btn'
    expect(rendered_component).to have_css 'div.btn-group > a.btn', count: 2
  end
end
