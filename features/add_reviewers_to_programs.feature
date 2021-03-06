Feature: Add Reviewer-Program Association

  As an admin
  I want to associate reviewers and programs
  So reviewers can review their programs' applications

Background: users, programs, admin in database

    Given the following users exist:
    |       email          | password   | 
    | applicant@gmail.com  | applicant  |

    Given the following programs exist:
    | title   | application_form |
    | football|http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |
    | music   |http://s3.amazonaws.com/grant-applications/programs/application_forms/000/000/001/original/genapp.pdf  |

     Given the following admins exist:
  	| email           | password |
  	| admin@admin.com | 1234abcd |

  	Scenario: Admin Program drop-down menu
  	When I go to the admin log in page
  	And I log in as an admin with email "admin@admin.com" and password "1234abcd"
  	When I go to the user admin page
  	And I follow one of the "Edit" links
  	Then I should see a check-box menu labeled "Program"
    Then I should see a drop-down menu labeled "Role"
    When I select "reviewer" from the drop-down menu labeled "Role"
    And I select "football" from the check-box menu labeled "program"
    And I click "Update User"
    Then I should be on the admin details page for "applicant@gmail.com"
    And I should see that the "Role" is "reviewer"
    And I follow one of the "Edit User" links
    And I should see that the "Program" has "football"


