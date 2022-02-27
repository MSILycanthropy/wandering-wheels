require 'rails_helper'

RSpec.describe IconComponent, type: :component do
  it 'renders with an icon' do
    render_inline(described_class.new(icon: 'plus', size: 'lg'))
    expect(rendered_component).to have_css 'i.fas.fa-plus.fa-lg'
  end
end
