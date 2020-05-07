# ruby-airbone-rspec-api
API test automation framework with Page object model. Airbone which is using RestClient and Rspec are implemented

# Running API Tests
Test are written with Ruby, rspec so you need to setup Ruby environment. 
Depending on your OS you can setup Ruby by [this link](https://www.ruby-lang.org/en/documentation/installation/)

## Install `bundler`
When Ruby setup is done, you can install bundler

```shell script
gem install bundler
```

## Install requirements with bundler
When bundler is installed, you can install requirements by bundler 

```shell script
# go to root folder where Gemfile is present
cd rspec-api/
bundle install
```

## Run a test file
```shell script
cd rspec-api
rspec  rspec specs/features/register/register_spec.rb 
```

## Run tests with creating reports
```shell script
cd rspec-api
# html report
rspec specs --format html --out reports/rspec_results.html

# document report
rspec specs --format progress --format documentation --out rspec.txt 
```