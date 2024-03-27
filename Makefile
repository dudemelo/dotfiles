CURDIR = $(shell pwd)

install:
	@ln -s $(CURDIR)/zsh/.zshrc ~/.zshrc
	@ln -s $(CURDIR)/zsh/.zshenv ~/.zshenv
	@mkdir -p ~/.config/i3
	@ln -s $(CURDIR)/i3/i3 ~/.config/i3/config
	@mkdir -p ~/.config/i3status
	@ln -s $(CURDIR)/i3/i3status ~/.config/i3status/config
	@ln -s $(CURDIR)/wezterm ~/.config/wezterm
	@ln -s $(CURDIR)/nvim ~/.config/nvim

remove:
	@rm ~/.zshrc
	@rm ~/.zshenv
	@rm -r ~/.config/i3
	@rm -r ~/.config/i3status
	@rm -r ~/.config/wezterm
	@rm -r ~/.config/nvim
