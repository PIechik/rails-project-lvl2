test: 
	bin/rails test
lint:
	bundle exec rubocop
ci-setup:
	yarn install
	bundle install
	bin/rails webpacker:compile
.PHONY: test