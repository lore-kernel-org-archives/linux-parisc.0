Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 12 Jul 2003 01:22:35 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030712072235.GA13027@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Net Install errata
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,
Another errata regarding the net install.

Since we've been advocating net installs and I like to eat my
own brand of dogfood,  I started with an A500 and the
lifimage-2.4.20-pa35-20030513 on another server which was
configured for both DHCP and apache. I could have avoided
all this by just cloning an existing A500 root disk...

kernel/modules that get installed by default are 2.4.17-64.
Makes sense since this is a woody install.  But the install
kernel in this case is "2.4.20-64".  The "Configure Device Driver
Modules" step never finds any modules because the Install
kernel doesn't care about /target/lib/modules/2.4.17-64.

My first attempt to remedy the problem was a failure:
# wget http://http.us.debian.org/debian/pool/main/k/kernel-patch-2.4.20-hppa/kernel-image-2.4.20-64_pa32.1_hppa.deb
# dpkg -i --instdir=/target kernel-image-2.4.20-64_pa32.1_hppa.deb
dpkg: not found

The solution is to find a compatible /lib/modules directory.
It doesn't have to be exactly matching, just need to be
able to run depmod and pretend you might (but won't)
load a driver module.

Easier to just build one for the a500 :^/
I found a 2.4.20 kernel build lying around.
And made it available on my local web server:
# make modules_install INSTALL_MOD_DIR=/tmp
# cd /tmp/lib/modules
# tar czf /var/www/hppa/modules-2.4.20-64.tgz 2.4.20-64/

Then on the target box:
# cd /target
# wget http://192.168.0.61/hppa/modules-2.4.20-64.tgz
# cd /target/lib/modules
# tar xzf ../../modules-2.4.20-64.tgz
# rm -rf 2.4.20-64/build
# chown -R root 2.4.20-64
# chgrp -R root 2.4.20-64

The first system I installed, "Configure Device Driver Modules"
continued to loop around on trying to install modules.
It asks if I would like to install a module but doesn't identify
which one. ^C to get out of that and on to "Installing the Base System".
But I also had pulled over the ISO and loopback mounted that.
That might have confused the installer somehow.

The second system I did this procedure on got through "Configure Device
Driver Modules" with no problems.

But don't reboot yet. The 2.4.17 woody kernel HPMC'd one a500
and hung in the scsi probe on the other. Not so useful.
Replace the /target/boot/vmlinux and System.map with working
2.4.20 or .21 kernels. Then rerun palo command and reboot.

grant
