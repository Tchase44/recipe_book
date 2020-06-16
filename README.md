# Recipe Book App

## Vue.js Front End

### Project setup and Start with Yarn
```
$ cd vue
$ yarn install
$ yarn run serve
```
### Project setup and Start with NPM
```
$ cd vue
$ npm install
$ npm run serve
```

## Rails API Back End

### Clean Setup
```
$ cd api
$ bin/bundle install
$ bin/rails db:create db:migrate db:seed
```
### Start Server
```
$ bin/rails s
```
* Ruby version
2.6.5
* Rails version
6.0
* System dependencies
PostgreSQL


* Configuration

* Database creation

``` $ bin/rails db:drop db:create db:migrate db:seed```

* How to run the test suite
_todo_

* Services (job queues, cache servers, search engines, etc.)
_n/a_
* Deployment instructions
_n/a_
* ...

## Other Commands ans Misc

### Compiles Vue Front-end and minifies for production
```
yarn run build
```

### Run your tests
```
yarn run test
```

### Lints and fixes files
```
yarn run lint
```
### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### Icons
[MIT Free Icons](https://github.com/refactoringui/heroicons/tree/master/src/outline-md)

### Touch events
* show symbol if ingredient has a "tip"
  * tap to view or close
* swipe ingredient to edit?

### features
* checkboxes?
* user accounts
* metadata? > rating,difficulty,time,
* sort order for recipe index
* sort order for ingredients
