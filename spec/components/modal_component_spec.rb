require 'rails_helper'

RSpec.describe ModalComponent, type: :component do
  it 'renders the modal' do
    render_inline(described_class.new) do |component|
      component.body do
        'Hello World'
      end
    end

    expect(rendered_component).to have_css 'div.modal div.modal-box'
    expect(rendered_component).to have_text 'Hello World'
  end
end
