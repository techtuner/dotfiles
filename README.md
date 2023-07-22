<h1 align="center">Dotfiles</h1>

<h3 align="center">My configuration for Linux and Windows Operating System.</h3>

<p align="center">
	<a href="#"><img alt="Windows" src="https://img.shields.io/static/v1?label=os&message=Windows&color=blue&logoColor=blue&style=for-the-badge&logo=windows"></a>
	<a href="#"><img alt="Ubuntu" src="https://img.shields.io/static/v1?label=os&message=Ubuntu&color=orange&logoColor=orange&style=for-the-badge&logo=ubuntu"></a>
	<a href="#"><img alt="Kali" src="https://img.shields.io/static/v1?label=os&message=Kali&color=blue&logoColor=white&style=for-the-badge&logo=kalilinux"></a>
	<a href="./LICENSE"><img alt="License Github" src="https://img.shields.io/github/license/techtuner/dotfiles?style=for-the-badge&logo=GitBook"></a>
	<a href="#"><img alt="GitHub language count" src="https://img.shields.io/github/languages/count/techtuner/dotfiles?style=for-the-badge"></a>
	<a href="#"><img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/techtuner/dotfiles?style=for-the-badge&logo=GitHub"><a>
	<a href="#"><img alt="GitHub last commit (branch)" src="https://img.shields.io/github/last-commit/techtuner/dotfiles/main?style=for-the-badge&logo=GitHub"></a>
</p>

## ⚙️ Installation
- Windows
	```powershell
		Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
		./install.ps1
	```

- Kali
	```shell
		python kali.py
	```
 - Ubuntu
	```shell
		sudo apt-get install git curl wget -y
		git clone https://www.github.com/techtuner/dotfiles.git
		cd dotfiles
		sudo chmod +x ubuntu.sh
		./ubuntu.sh
	```
## Tools I Use
- Neovim
- Terminator
- Visual Studio Code