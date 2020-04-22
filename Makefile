.PHONY: all
all: mailspring sublime-text ## Installs all the programs inside this repository in single go.

.PHONY: mailspring
mailspring: ## Installs the sublime text.
	@./mailspring.sh

.PHONY: sublime-text
sublime-text: ## Installs the sublime text.
	@./sublime-text.sh

.PHONY: help
help: ## Shows help.
	@echo
	@echo 'Usage:'
	@echo '    make <target>'
	@echo
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo
