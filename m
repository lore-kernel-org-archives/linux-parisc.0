From: Helge Deller <deller@gmx.de>
Subject: State of the PA-RISC/HPPA port (August 2013)
Date: Sat, 3 Aug 2013 22:41:19 +0200
Message-ID: <20130803204119.GA2392@halden.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello everyone,

this is just a short update on the status of the parisc port from my point of
view, including a short summary of what have been done during the last few weeks
and what is planned for the near future. 

So, what's the status of the Linux kernel for parisc?

Basically, I think all major outstanding kernel patches are now in the upcoming
kernel 3.11 tree, and the important ones will show up in the stable kernel 3.10
series soon as well. Kernel 3.9 should be OK as well, but some patches might be
missing.

With kernel 3.11 (and 3.10.5 or higher) I expect most instability issues from
the past to be gone.  There might still be minor issues with userspace
segfaults (due to cache issues), but they are rare....

Looking back, the main problems of instability and kernel crashes in the past
were assumely due to 
   a) cache and TLB flushing were unreliable,
   b) kernel stack overflows (because of sudden irq processing which used too much stack), and
   c) miscompiled code in pa_memcpy() because of C-code which is not valid C...

Testing on my machines showed, that the kernels 3.10.x and 3.11 will boot in UP
and SMP mode on nearly all machines. Most notably, we now have support for the
C8000 workstation, for which serial ports and framebuffer mode with FireGL
cards should work (Thank you Thomas!). Even a patch for the BMC in the C8000
will probably be included latest with kernel 3.12.

Debian:
We have our own debian package repository at
http://ftp.parisc-linux.org/debian-ports/ which currently holds more than 8300
pre-built debian packages (Thank you Dave!!!).  Even pre-built debian 3.10
kernel images are now available there.  We don't yet have a real
debian-installation media yet.
I've prepared a bootable image and some instructions on how to install
debian-unstable from our repository, but you should only try this if you are a
linux/parisc expert.  Brave people will find those instructions here:
http://wiki.parisc-linux.org/Debian_Ports_Installation For all others I'd
suggest to wait until we have the debian-installer finished, which is still one
of my top-priorities.

Furthermore, we sadly still don't have buildd-server. What really is missing
here is someone who is willing to host a parisc server and provide enough
direct bandwith to the internet.  Giving away real server hardware is probably
doable (and those parisc machines luckily aren't expensive any longer on ebay
:-)) and even administration would be done by Dave, me or someone else if
necessary.
On the other side, Dave has the buildd/wanna-build software installed on his
machine.  The wanna-build software needs a custom trigger script to handle
running on a non local machine.  It is needed to populate the source and
packages database.  Maybe, somebody has already done this and may give him a
hint?

Gentoo:
If you don't want to wait for debian, I'd suggest that you try Gentoo instead.
For instructions please see their website at
http://www.gentoo.org/main/en/where.xml (architecture hppa).

PARISC website:
Our current parisc website at http://www.parisc-linux.org is still based on
CVS, and it's sometimes unreliable (means: sometimes it's not reachable).  To
solve this issue my plan is to migrate it's content in september to the wiki at
kernel.org: https://parisc.wiki.kernel.org/
If someone is interested in doing that - and maybe has some interest and
knowledge in how nice web sites should look like, please let me know!

TODO:
There is still much on my todo list, most importantly
- keep pushing kernel patches upstream (https://patchwork.kernel.org/project/linux-parisc/list/)
- build a debian-installer ISO, and
- migrate the website.
For all other things I keep a personal TODO-list at
http://wiki.parisc-linux.org/TODO. Again, volunteers for some of those topics
are always welcome!

Last but not least I want to say a thank-you to all people who have contributed
to this project during the last weeks. The following list of people is taken
purely from the kernel git tree and shows those who have directly or indirectly
contributed to parisc kernel source tree. Same thank-you goes of course to all
other here unnamed people who have tested stuff, reported issues, fixed
userspace or kept on the discussion.

THANK YOU!

Helge



List of contributors to the kernel tree:
----------------------------------------
Alex Ivanov
Al Viro
Bill Pemberton
Bjorn Helgaas
Chen Gang
Cong Wang
Damian Hobson-Garcia
David Howells
Frederic Weisbecker
Geert Uytterhoeven
Guy Martin
Helge Deller
H. Peter Anvin
James Bottomley
Jiang Liu
Jiri Slaby
Joe Perches
John David Anglin
John Stultz
Julia Lawall
Kautuk Consul
Kees Cook
Kyle McMartin
Larry Finger
Mathias Krause
Matt Fleming
Michael S. Tsirkin
Michel Lespinasse
Mike Frysinger
Myron Stowe
Nikitas Angelinas
Paul Bolle
Paul Gortmaker
Peter Huewe
Peter Zijlstra
Rolf Eike Beer
Srivatsa S. Bhat
Thomas Bogendoerfer
Thomas Gleixner
Torben Hohn
Wei Yongjun
Will Deacon
Yinghai Lu
Yong Zhang
Zhao Hongjiang

