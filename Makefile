
build: pkg
	bundle exec gem build deployable-patch.gemspec
	mv deployable-patch-[0-9]*.gem pkg/

push: pkg
	bundle exec gem push $$(ls pkg/deployable-patch-[0-9]\+\.[0-9]\+\.[0-9]\+\.gem' | tail -1)