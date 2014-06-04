Feature: Upddating a candidature
	In order to update a candidature
	As a student
	I want to update a candidature

	Scenario: Student creating a course
        Given I'm at the student login page
        And there is a student with name "carlinhos" and password "12345678" and nusp "123456" and gender "1" and rg "123" and cpf "321" and address "matao" and district "butanta" and zipcode "000" and city "sp" and state "sp" and tel "0123456789" and cel "1234567890" and email "eu@usp.br" and has_bank_account "true"
        And there is a course with name "labxp" and code "MAC0342"
        And there is a course with name "ihc" and code "MAC0446"
        And there is a course with name "concorrente" and code "MAC0438"
        And there is an candidature with student "carlinhos" and first option "labxp" and second option "ihc" and third option "" and availability for daytime "yes" and availability for night time "no" and period preference "2"
        When I fill the "Número USP" field with "123456"
        And I fill the "Senha" field with "12345678"
        And I press the "Entrar" button
        And I click the "Candidaturas" link
        And I click the "Editar" link
        And I select "labxp" on the "Primeiro curso:"
        And I select "concorrente" on the "Segundo curso:"
        And I mark the "Disponibilidade para trabalhar de dia:" checkbox
        And I select the preference option "Diurno"
        And I press the "Enviar candidatura de monitoria" button
        Then I should see "Candidatura criada com sucesso."
        And I should see "Aluno: carlinhos"
