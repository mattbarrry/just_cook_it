# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeHelper, type: :helper do
  describe '.sanitize_recipe_text' do
    subject { helper.sanitize_recipe_text(text) }

    context 'when given a safe string' do
      let(:text) { 'This <em>is</em> a <strong>safe</strong> string. <a href="https://google.com">link</a>' }

      it 'renders the string' do
        expect(subject).to eq text
      end

      it 'renders anchor tags with href attribute' do
        expect(subject).to have_tag('a', with: { href: 'https://google.com' })
      end

      it 'renders strong tag with text' do
        expect(subject).to have_tag('strong', text: 'safe')
      end

      it 'renders em tag with text' do
        expect(subject).to have_tag('em', text: 'is')
      end
    end

    context 'when the string contains non-approved tags' do
      let(:text) { 'This <script>has unsafe</script> tags.' }
      let(:expected_text) { 'This has unsafe tags.' }

      it 'renders the string without the non-approved tags' do
        expect(subject).to eq expected_text
      end
    end
  end
end
