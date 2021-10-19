test: 
	bin/rails test
lint:
	bundle exec rubocop
ci-setup:
	yarn install
	bundle install
.PHONY: test