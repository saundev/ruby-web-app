# ruby-web-app

To run and test the Ruby server script on your local machine install Ruby v3.0.0 and run:

`cd $PWD/ruby-web-app/src`

`ruby server.rb`

To run Ruby container locally run the following commands from the root of the repository, replace Saundev with your own private Docker repo.

`docker build -t ruby-web-app .`

`docker run -p 8000:4040 --name ruby-instance ruby-web-app`

`docker tag ruby-web-app:latest izaun/saundev:saundev-ruby`

`docker push izaun/saundev:saundev-ruby`

`docker pull izaun/saundev:saundev-ruby`

### Terraform Instructions ###

Run the following TF commands:
