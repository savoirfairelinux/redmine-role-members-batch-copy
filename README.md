Redmine Role Members Batch Copy
===============================

Savoir-faire Linux
------------------

Copy or move in batch the members of a role to another role in all projects.

___


Minimum system requirements
---------------------------

* GNU/Linux operating system
* Redmine >= 3.2
* Ruby on Rails >= 4.2
* Ruby >= 1.9.3
* Git >= 2.1.4


Installation procedure
----------------------

We will show you how to install it on Debian family Linux distributions (such as Ubuntu), and Redmine installed with aptitude, but it can works on many other distros with similar procedures.

You may need to do those commands as root, depending on your particular case.

Feel free to replace the variable $REDMINE_PATH to your own Redmine instance path.

```bash
$REDMINE_PATH=/usr/share/redmine/

cd $REDMINE_PATH/plugins/
git clone git@github.com:savoirfairelinux/redmine-role-members-batch-copy.git
mv redmine-role-members-batch-copy redmine_role_members_batch_copy
bundle install
rake redmine:plugins:migrate RAILS_ENV=production
service apache2 reload  # or depending on which HTTP server you use

```

Operation procedure
-------------------

Once installed, the plugin needs no further configuration to works.

When you want to copy of move members from a role to another, you need to go to `Administration -> Roles and Permissions` then you click on the source role for migration.
Once there, you go at the bottom of the page, you will find a fieldset like this one :

![Plugin role edit screenshot](https://github.com/savoirfairelinux/redmine-role-members-batch-copy/raw/master/screenshots/role-edit.jpg)

In that fieldset, you will need to specify the target role where to move/copy, and check the box to choose between if the operation will be move or copy.

![Plugin validation screenshot](https://github.com/savoirfairelinux/redmine-role-members-batch-copy/raw/master/screenshots/validation.jpg)

Once you pressed "Next step" button, you get a validation table like this one. It shows for each projects, the roles of each members before and after. If everything fits your needs,
just go at the bottom of the page to validate that the operation is correct. Do not forget to check the box to validate that you are doing no mistake.


Contributing to this plugin
---------------------------

We absolutely appreciate patches, feel free to contribute directly on the GitHub project.

Repositories / Development website / Bug Tracker:
- https://github.com/savoirfairelinux/redmine-role-members-batch-copy

Do not hesitate to join us and post comments, suggestions, questions and general feedback directly on the issues tracker.

**Author :** David Côté-Tremblay <david.cote-tremblay@savoirfairelinux.com>

**Website :** https://www.savoirfairelinux.com/
