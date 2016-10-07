Feature: Assistant frequency monthly control
    In order to manage assistant's roles
    As a superprofessor or secretary
    I want to control the monthly frequency of assistants

    Background:
        When there is an open semester "2014" "1"
        And there is a department with code "MAC"
        And there is a department with code "MAT"
        And there is a course with name "Introdução à Ciência da Computação" and code "MAC0110" and department "MAC"
        And there is a course with name "Laboratório de programação eXtrema" and code "MAC0431" and department "MAC"
        And there is a course with name "Algebra II" and code "MAT0125" and department "MAT"
        And there is a course with name "Principio de Desenvolvimento de Algoritmos" and code "MAC0122" and departament "MAC"
        And there is a student with name "Bob" with nusp "123456" and email "aluno@usp.br"
        And there is a student with name "John" with nusp "123457" and email "john@usp.br"
        And there is a student with name "Wil" with nusp "11112" and email "wil@usp.br"
        And there is a student with name "Mary" with nusp "22221" and email "mary@usp.br"
        And there is a student with name "Alfredo" with nusp "666" and email "alfredinho@usp.br"
        And there is a student with name "Jude" with nusp "555" and email "jude@usp.br"
        And there is a student with name "Calvin" with nusp "777" and email "calvin@usp.br"
        And there is a professor with name "Dude" and nusp "111111" and department "MAC" and email "prof@ime.usp.br"
        And there is a professor with name "Gold" and nusp "87777" and department "MAC" and email "golddev@ime.usp.br"
        And there is a professor with name "Silver" and nusp "77778" and department "MAT" and email "silver@ime.usp.br"
        And there is a super_professor with name "Nina" and nusp "99987" and department "MAC" and email "ninadev@ime.usp.br"
        And there is a super_professor with name "Eloi" and nusp "78546" and department "MAT" and email "eloidev@ime.usp.br"
        And there is a super_professor with name "Coelho" and nusp "77890" and department "MAC" and email "coelhodev@ime.usp.br"
        And there is a hiper_professor with name "Zara" and password "changeme!" nusp "99986" department "MAT" and email "zaradev@ime.usp.br"
        And there is a request for teaching assistant by professor "Dude" for the course "MAC0110"
        And there is a request for teaching assistant by professor "Gold" for the course "MAC0431"
        And there is a request for teaching assistant by professor "Silver" for the course "MAT0125"
        And there is a request for teaching assistant by professor "Coelho" for the course "MAC0122"
        And there is an assistant role for student "Bob" with professor "Dude" at course "MAC0110" 
        And there is an assistant role for student "John" with professor "Gold" at course "MAC0431"
        And there is an assistant role for student "Wil" with professor "Gold" at course "MAC0431"
        And there is an assistant role for student "Mary" with professor "Silver" at course "MAT0125"
        And there is an assistant role for student "Jude" with professor "Gold" at course "MAC0431"
        And there is an assistant role for student "Calvin" with professor "Coelho" at course "MAC0122" which started at "03/01/2014" and ended at "04/30/2014"
        And there is a deactivated assistant role for student "Alfredo" with professor "Gold" at course "MAC0431"
        And there is an assistant frequency with month "3" with presence "false" for student "Bob" and professor "Dude" at course "MAC0110"
        And there is an assistant frequency with month "4" with presence "true" for student "Bob" and professor "Dude" at course "MAC0110"
        And there is an assistant frequency with month "5" with presence "true" for student "Bob" and professor "Dude" at course "MAC0110"        
        And there is an assistant frequency with month "3" with presence "true" for student "John" and professor "Gold" at course "MAC0431"
        And there is an assistant frequency with month "4" with presence "false" for student "John" and professor "Gold" at course "MAC0431"        
        And there is an assistant frequency with month "3" with presence "true" for student "Wil" and professor "Gold" at course "MAC0431"
        And there is an assistant frequency with month "4" with presence "true" for student "Wil" and professor "Gold" at course "MAC0431"
        And there is an assistant frequency with month "5" with presence "true" for student "Wil" and professor "Gold" at course "MAC0431"
        And there is an assistant frequency with month "3" with presence "false" for student "Mary" and professor "Silver" at course "MAT0125"
        And there is an assistant frequency with month "4" with presence "true" for student "Alfredo" and professor "Gold" at course "MAC0431"
        And there is an assistant frequency with month "3" with presence "true" for student "Calvin" and professor "Coelho" at course "MAC0122"
        And there is an assistant frequency with month "4" with presence "false" for student "Calvin" and professor "Coelho" at course "MAC0122"

    Scenario: Super professor sees his department assistants
        Given it's currently month 5
        Given I'm logged in as a super professor
        And I visit the monthly control page for month 5
        Then I should see "Bob"
        And I should see "Dude"
        And I should see "MAC0110"
        And I should not see "Mary"
        And I should not see "MAT0125"
        And "Bob" should appear before "John"
        And "John" should appear before "Wil"
        And "Alfredo" should appear before "Bob"
        And "Jude" should appear before "Wil"
        And "John" should appear before "Jude"
        And I'm back to current time

    Scenario: Secretary sees all assistant roles
        Given it's currently month 5
        Given I'm logged in as a secretary
        And I visit the monthly control page for month 5
        Then I should see "Bob"
        And I should see "Dude"
        And I should see "MAC0110"
        And I should see "Mary"
        And "Bob" should appear before "John"
        And "John" should appear before "Wil"
        And "Alfredo" should appear before "Bob"
        And "Jude" should appear before "Wil"
        And "John" should appear before "Jude"
        And "Mary" should appear before "Wil"
        And I'm back to current time

    Scenario: Hiperprofessor sees all assistant roles
        Given it's currently month 5
        Given I'm logged in as professor "Zara"
        And I visit the monthly control page for month 5
        Then I should see "Bob"
        And I should see "Dude"
        And I should see "Mary"
        And "Bob" should appear before "John"
        And "John" should appear before "Wil"
        And "Alfredo" should appear before "Bob"
        And "Jude" should appear before "Wil"
        And "John" should appear before "Jude"
        And "Mary" should appear before "Wil"
        And I'm back to current time

    Scenario: Common professor cannot see all assistant roles
        Given I'm logged in as a professor
        And I visit the monthly control page for month 5
        Then I should see "ACESSO NEGADO"

    Scenario: Secretary sees the correct frequencies in March
        Given it's currently month 5
        Given I'm logged in as a secretary
        And I visit the monthly control page for month 3
        Then I should see "Bob MAC0110 Dude Ausente"
        Then I should see "John MAC0431 Gold Presente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Mary MAT0125 Silver Ausente"
        Then I should see "Jude MAC0431 Gold ---"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Presente"
        And I should not see "Setembro"
        Then I'm back to current time

    Scenario: Secretary sees the correct frequencies in April
        Given it's currently month 5
        Given I'm logged in as a secretary
        And I visit the monthly control page for month 4
        Then I should see "Bob MAC0110 Dude Presente"
        Then I should see "John MAC0431 Gold Ausente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Mary MAT0125 Silver ---"
        Then I should see "Jude MAC0431 Gold ---"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Ausente"
        And I should not see "Setembro"
        Then I'm back to current time


    Scenario: Secretary sees the correct frequencies in May
        Given it's currently month 5
        And month 5 of semester 1/2014 is open for frequency
        And I'm logged in as a secretary
        And I visit the monthly control page for month 5
        Then I should see "Bob MAC0110 Dude Presente"
        Then I should see "John MAC0431 Gold Pendente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Mary MAT0125 Silver Pendente"
        Then I should see "Jude MAC0431 Gold Pendente"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Finalizado"
        And I should not see "Setembro"
        Then I'm back to current time

    Scenario: Super professor sees the correct frequencies in March
        Given it's currently month 5
        And I'm logged in as a super professor
        And I visit the monthly control page for month 3
        Then I should see "Bob MAC0110 Dude Ausente"
        Then I should see "John MAC0431 Gold Presente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Jude MAC0431 Gold Aguarde"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Presente"
        And I should not see "Setembro"
        Then I'm back to current time

    Scenario: Super professor sees the correct frequencies in April
        Given it's currently month 5
        And I'm logged in as a super professor
        And I visit the monthly control page for month 4
        Then I should see "Bob MAC0110 Dude Presente"
        Then I should see "John MAC0431 Gold Ausente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Jude MAC0431 Gold Aguarde"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Ausente"
        And I should not see "Setembro"
        Then I'm back to current time

    Scenario: Super professor sees the correct frequencies in May
        Given it's currently month 5
        And month 5 of semester 1/2014 is open for frequency
        And I'm logged in as a super professor
        And I visit the monthly control page for month 5
        Then I should see "Bob MAC0110 Dude Presente"
        Then I should see "John MAC0431 Gold"
        Then I should not see "John MAC0431 Gold Ausente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Jude MAC0431 Gold"
        Then I should not see "Jude MAC0431 Gold Presente"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Finalizado"
        And I should not see "Setembro"
        Then I'm back to current time

    Scenario: Super professor marks frequency
        Given it's currently month 5
        And month 5 of semester 1/2014 is open for frequency
        And I'm logged in as a super professor
        And I visit the monthly control page for month 5
        And I press the first "Presente" button
        Then I should see "Bob MAC0110 Dude Presente"
        Then I should see "John MAC0431 Gold Presente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Jude MAC0431 Gold"
        Then I should not see "Jude MAC0431 Gold Presente"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Finalizado"
        And I press the first "Ausente" button
        Then I should see "Bob MAC0110 Dude Presente"
        Then I should see "John MAC0431 Gold Presente"
        Then I should see "Wil MAC0431 Gold Presente"
        Then I should see "Jude MAC0431 Gold Ausente"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        Then I should see "Calvin MAC0122 Coelho Finalizado"
        And I should not see "Setembro"
        Then I'm back to current time

    Scenario: Secretary pays assistant roles for last month
        Given it's currently month 5
        Given I'm logged in as a secretary
        And I visit the monthly control page for month 5
        And I click the "Pagar monitores" link
        Then I should see "Bob MAC0110 Dude Pago"
        Then I should see "John MAC0431 Gold ---"
        Then I should see "Wil MAC0431 Gold Pago"
        Then I should see "Mary MAT0125 Silver ---"
        Then I should see "Jude MAC0431 Gold ---"
        Then I should see "Alfredo MAC0431 Gold Desativado"
        And I should not see "Setembro"
        Then I'm back to current time
        
