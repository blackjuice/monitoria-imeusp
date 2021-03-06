Given (/^I'm at the "(.*?)" page$/) do |page|
  visit page
end

Given(/^I'm at the login page$/) do
  visit new_admin_session_path
end

Then(/^I try the create course URL$/) do
  visit new_course_path
end

Then(/^I try the create secretary URL$/) do
  visit new_secretary_path
end

Given(/^I'm at the home page$/) do
  visit root_path
end

Given(/^I'm at the system access page$/) do
  visit "/sistema"
end

Given(/^I'm at the create_professors page$/) do
  visit new_professor_path
end

Given(/^I'm at the list_professors page$/) do
  visit professors_path
end

Given(/^I'm at the professor login page$/) do
  visit new_user_session_path
end

Given(/^I'm at the secretary login page$/) do
  visit new_secretary_session_path
end

Given(/^I'm at the user login page$/) do
  visit new_user_session_path
end

When(/^I go to the new candidature form$/) do
  visit new_candidature_path(Semester.first.id)
end

When(/^I go to the new request form$/) do
  visit new_request_for_teaching_assistant_path(Semester.first.id)
end

When(/^I go to the courses index$/) do
  visit courses_path
end

When(/^I go to the secretaries index$/) do
  visit secretaries_path
end

When(/^I go to the students index$/) do
  visit students_path
end

Given(/^I visit the assistant roles page$/) do
  visit assistant_roles_path
end

Given(/^I visit the monthly control page for month (\d+)$/) do |month|
  visit assistant_frequency_monthly_control_path(Semester.current, month, AssistantFrequency.FILTER_ALL)
end

Given(/^I visit my assistant roles page$/) do
  visit assistant_roles_for_professor_path(Professor.first.id)
end

Given(/^I visit a request page$/) do
  visit request_for_teaching_assistant_path(RequestForTeachingAssistant.first.id)
end


When(/^I try to access the "(.*?)" page with id "(.*?)" to "(.*?)"$/) do |page_name, id, action|
    if action != 'show'
        visit('/' + page_name + '/' + id.to_s + '/' + action)
    else
        visit('/' + page_name + '/' + id.to_s)
    end
end

When(/^I try to update the student with id "(.*?)"$/) do |id|
    page.driver.put('/students/' + id.to_s)
end

When(/^I visit student "(.*?)"'s page$/) do |name|
  visit user_path(User.where(name: name).take.id)
end

Then(/^I cannot access the "(.*?)" page with id "(.*?)" to "(.*?)"$/) do |page_name, id, action|
  if action != 'show'
    expect { visit('/' + page_name + '/' + id.to_s + '/' + action) }.to raise_error(ActionController::RoutingError)
  else
    expect { visit('/' + page_name + '/' + id.to_s) }.to raise_error(ActionController::RoutingError)
  end
end

