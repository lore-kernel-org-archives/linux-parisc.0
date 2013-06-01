From: Helge Deller <deller@gmx.de>
Subject: Re: Lenny/Sid upgrade
Date: Sat, 01 Jun 2013 17:34:52 +0200
Message-ID: <51AA149C.7030801@gmx.de>
References: <fd52140191b1ce51b2a8017796ab1380aeb5f445@webmail.iinet.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Geoff <vk2tfg@ozemail.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <fd52140191b1ce51b2a8017796ab1380aeb5f445@webmail.iinet.net.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Geoff,

On 06/01/2013 02:21 AM, Geoff wrote:
> I am still working on sorting out a fresh lenny -> sid upgrade. I have managed apt-get update, upgrade and dist-upgrade after lots of stuffing around (notes kept). It appears that "dependency based boot sequencing" gets in the way.
> 
> I'd like to try a kernel build next. Could anyone please point me towards a "cookbook" set of instructions and a suitably patched repository?

For the most stable kernel check out my stable-3.10 branch of 
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git

e.g.: 
clone a linux tree (3.10-rcX) from Linus, then:
git pull  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git  stable-3.10

You need a "palo.conf" file, e.g. I use this one for tftbooting...
http://www.parisc-linux.org/~deller/palo.conf
-> copy it to your kernel directory (where you build).

Then take (if you like) one of my .config files (either the 32 or 64bit one).
http://www.parisc-linux.org/~deller/config-3.10-64bit
http://www.parisc-linux.org/~deller/config-3.10-32bit
copy this config file to your parisc kernel tree (build tree),
rename the file to ".config".
run "make ARCH=parisc oldconfig"

run "make ARCH=parisc -j8 palo"

for tftpbooting, copy the "lifimage" file to the tftp-bootdirectory.
for direct booting of local disc, copy the "vmlinux" to /boot (on the parisc machine).

Boot up your PA machine, and run
boot lan -> for tftpbooting, or
boot pri -> for local booting (if you have the new vmlinux in /boot.

http://wiki.parisc-linux.org/Debian_Ports_Installation has some instructions (for kernel 3.9) as well.

Helge
