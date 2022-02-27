require 'rails_helper'

RSpec.describe AvatarComponent, type: :component do
  before(:each) do
    @user = create(:user)
    @fallback_text = @user.first_name[0] + @user.last_name[0]
  end

  it 'falls back to the placeholder' do
    render_inline(described_class.new(user: @user))

    expect(rendered_component).to have_css('a.avatar.placeholder[data-turbo-frame="modal"]')
    expect(rendered_component).to have_text(@fallback_text)
  end

  it 'renders the avatar' do
    @user.avatar = create(:avatar, user: @user)
    render_inline(described_class.new(user: @user))

    expect(rendered_component).to have_css('a.avatar[data-turbo-frame="modal"]')
    expect(rendered_component).to have_css("a.avatar img[src='#{@user.avatar.url}']")
  end

  it 'renders avatar with size' do
    @user.avatar = create(:avatar, user: @user)
    render_inline(described_class.new(user: @user, size: :medium))

    expect(rendered_component).to have_css('a.avatar[data-turbo-frame="modal"]')
    expect(rendered_component).to have_css(("a.avatar div.w-12 img[src='#{@user.avatar.url}']"))
  end

  it 'renders avatar with shape' do
    @user.avatar = create(:avatar, user: @user)
    render_inline(described_class.new(user: @user, shape: :hexagon))

    expect(rendered_component).to have_css('a.avatar.mask.mask-hexagon[data-turbo-frame="modal"]')
    expect(rendered_component).to have_css(("a.avatar img[src='#{@user.avatar.url}']"))
  end
end
