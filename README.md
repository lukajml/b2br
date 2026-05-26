*This activity has been created as part of the 42 curriculum by lulauren*

# Common Core 42 : Born2beRoot

## Description
This activity introduces the world of Virtual machines. We have to setup one from the OS to the parameters, the partitioning, password policies, etc...

## Instructions

### Installation
```bash
    git@github.com:42learners/Common-Core---Born2beRoot-cd048b4d-c553-4b10-b27c-4e5841e45620.git
```

### Use

To use the VM, open Oracle VirtualBox and select the VM you want, in this case `b2br.vdi`.
You can use the VM via your computer's terminal with :
```bash
ssh <username42>@localhost -p 4242
```

### Project description
( partionnimg, security policies, user management, services installations, apparmor vs selinux, ufw vs firewalld, virtuabox vs utm)

#### Debian vs Rocky Linux
I choose Debian, instead of Rocky for my os, because Rocky is not only more complicated for beginners, it is also more servers oriented eventhough it's robustness was very appeling.
For my first VM i prefered to go with the more beginner friendly option, Debian. It is well renowned and very stable, so i went with it.

#### AppArmor vs SELinux(Security-Enhanced Linux)
AppArmor offers a more simple aproch to security, it's very permissive for the admin as it can help custom profiles for each app seperatly. It is a bit less secure compared to SELinux wihich offers a more strict approch security wise which also means it's less easy to use.

#### UFW vs firewalld
UFW offers a less complicated firewall that is very easy to use and efficent. Compared to firewalld's verbose which is more complicated, firewalld is also a bit overkill for this project. While doing research for this project I found that UFW is very compatible with Debian, the os I choose, and firewalld is more commonly used with Rocky.

#### VirtualBox vs UTM
VirtualBox is available for any OS whereas UTM is strictly for macOS user. UTM is also beginner friendly and less heavy on the memory. VirtualBox is feature-rich and support a wide variety of distros, sadly it is also slower as it is memory heavy.

#### APT vs Aptitude
Apt is the default Linux command-line tool to manage thes packages on Debian-based system. It comes by default and doesn't offer a graphical interface.
Aptitude is another populart tool to manage packages, it doesn't come by default so it needs to be installed with Apt. Contrary to Apt, Aptitude as a graphical interface.

#### Partitioning
The 20GB disk is split into a small unencrypted /boot partition (956MB) needed by the bootloader, and a large encrypted LUKS partition containing the rest of the disk. Inside that encrypted container, LVM manages three logical volumes: root (7.5GB) for the OS, swap (1GB) as RAM overflow, and home (10.5GB) for user data. Keeping /boot separate is necessary since encryption cannot be unlocked before the bootloader runs. LVM was chosen for its flexibility, allowing partition resizing without touching the physical disk layout.

#### Security Policies
The security policies where given in the subject, for UFW we had to block all incoming and outgoing requests and allow port 4242 for incoming traffic.

For sudo, I had to limit the paths that can be used by sudo to run commands, require TTY (needed to use sudo), display a custom message when using wrong password with sudo, set the input logs file, set the directory to save additional output ans input logs, limit connection attempts using sudo.

For the passwords, I had to enforce the following policies:
• Your password has to expire every 30 days.\
• The minimum number of days between password changes must be set to 2.\
• The user has to receive a warning message 7 days before their password expires.\
• Your password must be at least 10 characters long. It must contain an uppercase letter,
a lowercase letter, and a number. Also, it must not contain more than 3 consecutive
identical characters.\
• The password must not include the name of the user.


#### User Management
I set up only 2 users, as demanded by the subject, a root user and a 'normal' user (lulauren), which has been added to the sudo and user 42 groups as requested by the subject.

#### Services Installation
- **sudo** (which gives the right to a user to temporarly run command only root could do)
- **libpam-pwquality** (which is used for the password format enforcement)
- **ufw** (which is the firewall used for Debian)

#### SSH
Secure Shell is a network communication protocol that enables computers to communicate. With SSH you get a command-line interface and can run commands on the remote machine. By default  the SSH service runs on port 22.

### Defense

#### Logging in

Root password: Borntobrt42
User password: Born2broot

#### User and group creation
- `adduser <user_name>`
- `groupadd <groupe_name>`
- `usermod -aG <groupe_name> <user_mod>`
- `chage -l <user_name>`
- `getent group <group_name>`\
To verify the changes: cat `/etc/group`.

#### Hostname change
- `hostnamectl set-hostname <new_hostname>`

#### Add or delete new UFW rule
- `ufw allow <port_rule>`
- `ufw delete <port_rule>`

#### SSH
- `systemctl status ssh`
- `systemctl enable`
- `systemctl restart ssh`

#### Update system
- `apt update`

## Resources

[chlimous](https://github.com/chlimous/42-born2beroot_guide)
[apeuget](https://github.com/Audreypgt/Born2BeRoot/blob/main/complete_guide.md)
