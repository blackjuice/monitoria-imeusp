Feature: Assistant roles remotion
    In order to manage the assistant roles
    As a superprofessor or secretary
    I want to remove assistant roles

    Background:
        When there is an open semester "2014" "1"
        And there is a department with code "MAC"
        And there is a course with name "Introdução à Ciência da Computação" and code "MAC0110" and department "MAC"
        And there is a student with name "Bob" with nusp "123456" and email "aluno@usp.br"
        And there is a professor with name "Dude" and nusp "111111" and department "MAC" and email "prof@ime.usp.br"
        And there is a request for teaching assistant by professor "Dude" for the course "MAC0110"
        And there is an assistant role for student "Bob" with professor "Dude" at course "MAC0110"

    Scenario: Super professor destroys an assistant role
        Given I'm logged in as a super professor
        And I visit the assistant roles page
        And I click the "Remover" link
        Then I should not see "Bob"
        And I should not see "Dude"
        And I should not see "MAC0110"

    Scenario: Secretary destroys an assistant role
        Given I'm logged in as a secretary
        And I visit the assistant roles page
        And I click the "Remover" link
        Then I should not see "Bob"
        And I should not see "Dude"
        And I should not see "MAC0110"
