Feature: Semester creation
    In order to create a semester
    As a secretary or admin
    I want to create a semester

    Background:
        Given there is an open semester "2014" "1"

    Scenario: Admin creates a semester
        Given I'm at the system access page
        And there is an admin user with email "kazuo@ime.usp.br" and password "admin123"
        And I click the "Login Admin" link
        Then I fill the "Email" field with "kazuo@ime.usp.br"
        And I fill the "Senha" field with "admin123"
        And I press the "Entrar" button
        And I click the "Gerenciar semestres" link
        And I press the "Adicionar semestre" button
        Then I should see "2015/1"

    Scenario: Professor can't create a semester
        Given I'm at the professor login page
        And there is a professor with name "Bob" and password "prof-123" nusp "123" department "MAC" and email "bob@bob.bob"
        When I'm ready to receive email
        And I fill the "Número USP" field with "123"
        And I fill the "Senha" field with "prof-123"
        And I press the "Entrar" button
        Then I should not see "Gerenciar semestres"

    Scenario: Secretary creating a semester
        Given I'm at the system access page
        And there is a secretary with name "Marcia" and password "12345678" nusp "1111111" and email "marcia@ime.usp.br"
        And I click the "Login Funcionário" link
        Then I fill the "Número USP" field with "1111111"
        And I fill the "Senha" field with "12345678"
        And I press the "Entrar" button
        And I click the "Gerenciar semestres" link
        And I press the "Adicionar semestre" button
        Then I should see "2015/1"