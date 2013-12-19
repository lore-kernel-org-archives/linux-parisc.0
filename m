From: Dave Land <xmechanic@landcomp.net>
Subject: Fwd: Missing libaudit.so.0 workaround on hppa lifimage/debian-ports
 install
Date: Thu, 19 Dec 2013 15:15:38 -0700
Message-ID: <52B3700A.5040704@landcomp.net>
References: <52AFEFC2.5000702@landcomp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52AFEFC2.5000702@landcomp.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hiya Folks,

I posted this over at the Debian-hppa mailing list, and I thought it 
might be a good idea to post it here also, since it is rather relevant 
to the group. :)

Dave L.


-------- Original Message --------
Subject: Missing libaudit.so.0 workaround on hppa lifimage/debian-ports 
install
Resent-Date: Tue, 17 Dec 2013 06:31:49 +0000 (UTC)
Resent-From: debian-hppa@lists.debian.org
Date: Mon, 16 Dec 2013 23:31:30 -0700
From: Dave Land <xmechanic@landcomp.net>
To: debian-hppa@lists.debian.org

Hiya folks,

This may be a little lengthy, and an odd solution, but it worked to
debootstrap 2 different machines here in the last couple days.

The problem was.. when you would get to the point in the lifimage
install where you had to chroot your /mnt/destroot directory to run the
passwd utility to set the root password, it would error out with a
missing libaudit.so.0 library. I'll try to keep this as simple as
possible for those just trying this out on their hardware for the first
time, and once things get smoothed out at debian-ports.org, it most
likely won't be necessary anymore.

1. Get your latest lifimage and burn it to a CD, here:
http://ftp.parisc-linux.org/debian-ports/unstable-boot-image/lifimage

2. Follow the instructions at:
http://wiki.parisc-linux.org/Debian_Ports_Installation up to the point
where you have to chroot to /mnt/destroot to set your root password.

3. *Before* you chroot, use nano to edit your
/mnt/destroot/etc/apt/sources.list file to include the parisc-linux.org
repository (deb http://ftp.parisc-linux.org/debian-ports/debian unstable
main)

4. Now, chroot /mnt/destroot...

5. Since you're ch-rooted to the main file system, you can now run the
apt utilities to do what you need to, but before you do, you must get
the gpg keys for debian-ports.org before it will work; something like this..

6. gpg --recv-keys 1C466F272FF7A9F4 --keyserver
http://ftp.debian-ports.org/debian

7. gpg --export --armor 2FF7A9F4 | apt-key add -

8. Run apt-get update to refresh the package lists

9. Run apt-get upgrade (you'll get some unmet dependencies)

10. Run apt-get -f install (this fixes them)

11. Run apt-get update again

12. Run apt-get upgrade *again* (this pulls in the rest of the upgraded
packages from both sources.

13. Now... you should be able to set your root password successfully!

14. Type 'exit' to get out of the chroot.

15. Use nano to edit /mnt/destroot/etc/hostname to give your machine a name.

16. Follow through with the rest of the installation and get your latest
kernel for your architecture, palo, openssh-server, etc. Don't forget to
set your links in /mnt/destroot/boot/ as described in the instructions
and follow the palo setup to the letter. Reboot and your machine should
boot to a login prompt. Login as root, and you're off!

Sidenotes: I ran into an issue on both machines where the primary
network interface (usually eth0) wouldn't start on it's own and I had to
add the following to /etc/network/interfaces

allow-hotplug eth0

iface eth0 inet dhcp

Edit this to point to your primary network interface.
After that my network came up automatically at each boot/reboot.

Here's the current results of my labors over the last few days:

http://landcomp.net:882 (the newest one, just finished this evening)
http://landcomp.net:883 (the RP 2470 A500 server)
http://landcomp.net:884 (the J6750 workstation with our development
website and *current* buildd server)

Enjoy!

Dave L.

-- 
Dave Land
Land Computer Service  xmechanic@landcomp.net
ICQ: 676030523





