# README

This is a scaffold for building an admin project.

UI is based on `bootstrap -v 4.6.0`.
Datetimepicker is based on `bootstrap4-datetime-picker-rails -v 0.3.1`, which works perfectly.

The next step will add more and more common tools, e.g. something about How to draw tables and lines for Dashboard.

```bash
$> ruby --version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]

$> rails --version
Rails 6.1.4.1

$> node --version
v16.11.0

$> yarn --version
1.22.17
```

## How to use

```bash
# clone the project
$> git clone git@github.com:ElliotCui/admin_start_kit.git
# change the the folder name(admin_start_kit) to YOUR_PROJECT_NAME as you wish
$> mv(using `cp` is ok) dmin_start_kit YOUR_PROJECT_NAME
# enter the dictionary of YOUR PROJECT
$> cd YOUR_PROJECT_NAME
# init project with YOUR_PROJECT_NAME
$> rails init:rename[YOUR_PROJECT_NAME]
...
$> rake db:create
$> rake db:migrate
$> rake db:seed
$> rails s
```

## Warn

The tables of SuperUser and User are examples to show pages and test simple logic right.

Remove them as you wish if they are redundant.
