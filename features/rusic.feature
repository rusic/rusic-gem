Feature: Rusic
  In order to create themes for rusic.com
  As a designer/developer
  I want to be able to generate themes from the cli

  Scenario: New project
    When I run `rusic new example`
    Then the following files should exist:
      | example/layouts/subdomain.html.liquid |
      | example/ideas/index.html.liquid       |
      | example/ideas/new.html.liquid         |
      | example/ideas/show.html.liquid        |
      | example/ideas/edit.html.liquid        |
    And the file "example/layouts/subdomain.html.liquid" should contain "{{yield}}"
