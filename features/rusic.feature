Feature: Rusic
  In order to create themes for rusic.com
  As a designer/developer
  I want to be able to generate themes from the cli

  Scenario: New project
    When I run `rusic new example`
    Then the output should contain "ideas"

