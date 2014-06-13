Feature: Edit Professor
    In order to edit a professor
    As an administrator
    I want to edit a professor

    Scenario: Valid Admin editing a professor
        Given there is an admin user with email "kazuo@ime.usp.br" and password "admin123"
        And there is a professor with name "Bob" and password "prof-123" nusp "123" department "MAC" and email "bob@bob.bob"
        And there is a department with code "MAE"
        And I'm at the login page
        And I fill the "Email" field with "kazuo@ime.usp.br"
        And I fill the "Senha" field with "admin123"
        And I press the "Entrar" button
        When I click the "Professores" link
        And I click the "Bob" link
        And I click the "Editar" link
        And I fill the "Nome" field with "Gold"
        And I fill the "Número USP" field with "12345"
        And I select "MAE" on the "Departamento"
        And I fill the "Email" field with "gold@troll.com"
        And I mark the "Permissão de SuperProfessor" checkbox
        And I press the "Enviar" button
        Then I should see "Nome: Gold"
        And I should see "Número USP: 12345"
        And I should see "Email: gold@troll.com"
        And I should see "Departamento: MAE"
        And I should see "SuperProfessor: Sim"

    Scenario: Valid Admin editing a professor and changing the password
        Given there is an admin user with email "kazuo@ime.usp.br" and password "admin123"
        And there is a professor with name "Bob" and password "prof-123" nusp "123" department "MAC" and email "bob@bob.bob"
        And there is a department with code "MAE"
        And I'm at the login page
        And I fill the "Email" field with "kazuo@ime.usp.br"
        And I fill the "Senha" field with "admin123"
        And I press the "Entrar" button
        When I click the "Professores" link
        And I click the "Bob" link
        And I click the "Editar" link
        And I fill the "Nome" field with "Gold"
        And I fill the "Número USP" field with "12345"
        And I select "MAE" on the "Departamento"
        And I fill the "Email" field with "gold@troll.com"
        And I fill the "Senha" field with "00000000"
        And I fill the "Confirme a senha" field with "00000000"
        And I mark the "Permissão de SuperProfessor" checkbox
        And I press the "Enviar" button
        And I click the "Logout" link
        And I click the "Login Professor" link
        And I fill the "Número USP" field with "12345"
        And I fill the "Senha" field with "00000000"
        And I press the "Entrar" button
        Then I should see "Login efetuado com sucesso."


    Scenario: Professor does not exist
        Given I'm at the login page
        And there is an admin user with email "kazuo@ime.usp.br" and password "admin123"
        And there is a professor with name "Bob" and password "prof-123" nusp "123" department "MAC" and email "bob@bob.bob"
        And there is a professor with name "Gold" and password "changeme!" nusp "321" department "MAC" and email "gold@bob.bob"
        When I fill the "Email" field with "kazuo@ime.usp.br"
        And I fill the "Senha" field with "admin123"
        And I press the "Entrar" button
        And I'm at the "professors/1000/edit" page
        Then I should see "Bob"
        And I should see "Gold"