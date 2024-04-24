# Example setup on new machine, with a basic nixos image
```bash
nix-shell -p git
cd ~
git clone https://github.com/jswartzendruber/.nixconfig.git
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s ~/.nixconfig/ /etc/nixos

# if you will be updating the hardware configuration, you need to do these git configs
# git config --global user.email "email@email.com"
# git config --global user.name "name"
# cp /etc/nixos.bak/hardware-configuration.nix .nixconfig/hosts/desk-nv/hardware-configuration.nix

sudo nixos-rebuild switch --flake ~/.nixconfig#desk-nv
reboot
```
