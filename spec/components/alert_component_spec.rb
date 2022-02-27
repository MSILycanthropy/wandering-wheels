require 'rails_helper'

RSpec.describe AlertComponent, type: :component do
  it 'renders a success alert' do
    render_inline(described_class.new(message: 'Alert Alert!!', type: :success))
    expect(rendered_component).to have_css('div.alert-success')
    expect(rendered_component).to have_text('Alert Alert!!')
  end

  it 'renders a danger alert' do
    render_inline(described_class.new(message: 'Alert Alert!!', type: :danger))
    expect(rendered_component).to have_css('div.alert-danger')
    expect(rendered_component).to have_text('Alert Alert!!')
  end

  it 'renders a warning alert' do
    render_inline(described_class.new(message: 'Alert Alert!!', type: :warning))
    expect(rendered_component).to have_css('div.alert-warning')
    expect(rendered_component).to have_text('Alert Alert!!')
  end

  it 'renders an info alert' do
    render_inline(described_class.new(message: 'Alert Alert!!', type: :info))
    expect(rendered_component).to have_css('div.alert-info')
    expect(rendered_component).to have_text('Alert Alert!!')
  end
end
