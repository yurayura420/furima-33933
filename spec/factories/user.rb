FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"terry@exsample"}
    password              {"a123456"}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"田中"}
    first_name_read       {"タロウ"}
    last_name_read        {"タナカ"}
    birth_date            {"2000-01-01"}
  end
end