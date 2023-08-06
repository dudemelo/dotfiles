CURDIR = $(shell pwd)

install:
	@echo "Installing ZSH..."
	@ln -s $(CURDIR)/zsh/.zshrc ~/.zshrc
	@ln -s $(CURDIR)/zsh/.zprofile ~/.zprofile
	@ln -s $(CURDIR)/zsh/.zshenv ~/.zshenv
	@echo "ZSH installed!"

remove:
	@echo "Uninstalling ZSH..."
	@rm ~/.zshrc
	@rm ~/.zprofile
	@rm ~/.zshenv
	@echo "ZSH uninstalled!"

