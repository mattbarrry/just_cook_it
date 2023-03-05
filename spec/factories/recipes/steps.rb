FactoryBot.define do
  factory :recipes_step, class: 'Recipes::Step' do
    recipe_sections { nil }
    instruction { "MyText" }
  end
end
