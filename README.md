# ruby-airborne-rspec-api
API test automation framework with Page object model. Airbone which is using RestClient and Rspec are implemented

# Running API Tests
Test are written with Ruby, rspec so you need to setup Ruby environment. 
Depending on your OS you can setup Ruby by [this link](https://www.ruby-lang.org/en/documentation/installation/)

## Install `bundler`
When Ruby setup is done, you can install bundler

```shell
gem install bundler
```

## Install requirements with bundler
When bundler is installed, you can install requirements by bundler 

```shell
# go to root folder where Gemfile is present
cd rspec-api
bundle install
```

## Run a test file
```shell script
cd rspec-api
rspec spec/features/register/register_spec.rb 
```

## Run tests with creating reports
```shell script
cd rspec-api
# html report
rspec spec/features --format html --out reports/rspec_results.html

# document report
rspec spec/features --format progress --format documentation --out rspec.txt 
```
