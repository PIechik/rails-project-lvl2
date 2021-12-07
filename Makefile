test: 
	bin/rails test
lint:
	bundle exec rubocop
	bundle exec slim-lint app/views
ci-setup:
	yarn install
	bundle install
	bin/rails webpacker:compile
.PHONY: test