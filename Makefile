CURDIR = $(shell pwd)

install:
	@echo "Installing ZSH..."
	@ln -s $(CURDIR)/zsh/.zshrc ~/.zshrc
	@ln -s $(CURDIR)/zsh/.zprofile ~/.zprofile
	@ln -s $(CURDIR)/zsh/.zshenv ~/.zshenv
	@mkdir -p ~/.config/i3
	@ln -s $(CURDIR)/i3/i3 ~/.config/i3/config
	@mkdir -p ~/.config/i3status
	@ln -s $(CURDIR)/i3/i3status ~/.config/i3status/config
	@echo "ZSH installed!"

remove:
	@echo "Uninstalling ZSH..."
	@rm ~/.zshrc
	@rm ~/.zprofile
	@rm ~/.zshenv
	@rm -r ~/.config/i3
	@rm -r ~/.config/i3status
	@echo "ZSH uninstalled!"

