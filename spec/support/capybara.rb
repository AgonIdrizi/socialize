require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.register_driver :selenium do |app|
Capybara::Selenium::Driver.new(
app,
browser: :chrome,
)
end