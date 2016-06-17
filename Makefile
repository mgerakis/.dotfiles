all :
	. ./install.sh
	
once :
	. ./brew.sh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

