
build: pkg
	bundle exec gem build deployable-patch.gemspec
	mv deployable-patch-[0-9]*.gem pkg/
