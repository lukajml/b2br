*This activity has been created as part of the 42 curriculum by lulauren*

# Common Core 42 : Born2beRoot

## Description
This activity introduces the world of Virtual machines. We have to setup one from the OS to the parameters, the partitioning, password policies, etc...

### Project description
(describes the choices debian vs rocky, partionnimg, security policies, user management, services installations, apparmor vs selinux, ufw vs firewalld, virtuabox vs utm)

#### Debian vs Rocky Linux
I choose Debian, instead of Rocky for my os, because from what i understood Rocky is not only more complicated it is also also more servers oriented eventhough it's robustness was very appeling.
For my first VM i prefered to go with the more beginer frendly option, Debian. It is well renowned and very stable, so i went with it.

#### AppArmor vs SELinux
AppArmor offers a more simple aproch to security, based on (AppArmor permet à l'administrateur système d'associer à chaque programme un profil de sécurité qui restreint ses accès au système d'exploitation.)

#### UFW vs firewalld

#### VirtualBox vs UTM



Seat0 is the default seat in Linux. It is the seat that is used when you first boot your system. The login screen is displayed on tty1, and the graphical user interface (GUI) is displayed on tty2.

## Instructions

### Installation
```bash
    git@github.com:42learners/Common-Core---Born2beRoot-cd048b4d-c553-4b10-b27c-4e5841e45620.git
```

To use the VM, open Oracle VirtualBox and select the VM you want, in this case `b2br.vdi`.
You can use the VM via your computer's terminal with :
```bash
ssh <username42>@localhost -p 4242
```

## Resources

