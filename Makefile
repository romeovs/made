name = test-repo
made_root = .

-include made.make

test: countdown

countdown:
	$(countdown) 3 "Hello %d..."
