Return-Path: <sdbrady@ntlworld.com>
Received: from mta06-svc.ntlworld.com (mta06-svc.ntlworld.com [62.253.162.46])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E07D484B
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 16:52:19 -0700 (MST)
Received: from calypso ([62.254.21.7]) by mta06-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040218235218.SWXA1936.mta06-svc.ntlworld.com@calypso>
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 23:52:18 +0000
Received: from sdb by calypso with local (Exim 3.36 #1 (Debian))
	id 1AtbUP-0000bX-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 23:52:25 +0000
Date: Wed, 18 Feb 2004 23:52:25 +0000
From: Stuart Brady <sdbrady@ntlworld.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040218235225.GA1623@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] Hanging with kernels >= 2.4.22
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

Firstly, thanks for the great work on parisc-linux. I'm amazed at how
well it's working. I hope I'll be able to give something back, soon.

I'm having problems with kernels >= 2.4.22 on a 715/100.

I'm looking at http://parisc-linux.org/faq/kernelbug-howto.html.
The guidelines at http://bugs.parisc-linux.org/Reporting.html (linked to
from http://parisc-linux.org/) appear to be out of date, so I'm not sure
if I'm doing the right thing. Console output is a little difficult for
me to provide at the moment.

While booting (i.e. while init is bringing up services, not during
kernel startup), or after booting, something appears to be hanging.
There doesn't seem to be much of a pattern regarding when the hangs
occur, although I've noticed them happening at the same time between
subsequent reboots, e.g. after starting statd, or trying to load the
mixer settings.

If I set the default runlevel to 1, I can log in using single user
mode. Before starting inetd, telnet to port 37 (time) fails. After
running /etc/init.d/inetd start, telnet to port 37 appears to work.
(I get a valid response, e.g. 0xc3de42ac), telnetting to port 13 seems
correct: "Wed Feb 18 20:04:23 2004." If I start sshd and remove
/etc/nologin, I can connect with ssh.

After the hang has taken place, I can still ping the machine.
Anything I type at the console is echoed correctly. The heartbeat's
working. Magic sysrq works. I can make connections to port 22, but
after the connection is made, nothing happens (I.e. I don't get the
SSH greeting.) If I telnet to port 37 or port 13, I get a valid
response - this indicates that inetd is running and still working.
If I have bash running I can use tab completion to list directory
contents.

But after a while, bash freezes during tab completion. Sometimes,
telnetting to port 13 ceases to work. Still, I can ping the machine,
text is echoed, I even get a response from telnetting to port 37,
the heartbeat works, and so does magic sysrq.

uname -a reports:

Linux 1986u10 2.4.24-pa0 #6 Wed Feb 18 16:58:09 GMT 2004 parisc GNU/Linux

I'm using gcc 3.3.3 (-0pre3) package to build the kernel, with
the binutils 2.14.90.0.7-5 package, and 2.4.24 from CVS. The same
thing happens with all of the pre-compiled packages from
http://cvs.parisc-linux.org/download/autobuild-kernels/32/
that I've tried newer than palinux-32-2.4.21-pa7.

Debian's kernel-image-2.4.17-32 and kernel-image-2.4.21-32 seem to work.
palinux-32-2.4.20-pa35, palinux-32-2.4.21-pa2 and palinux-32-2.4.21-pa7
work correctly. palinux-32-2.4.22-pa7, palinux-32-2.4.22-pa10 and
palinux-32-2.4.24-pa0 don't, though, nor do any of the 2.4.24 images
that I've built from CVS.

The BootRom version is 1.5. The memory in this machine was upgraded to
160MB. There's also an extra graphics card, which I'm not using at the
moment. The problem occurs regardless of whether I'm using stifb or
sticon.

Palo's command line is: 2/vmlinux root=/dev/sda6 HOME=/ console=tty0
sti=1 sti_font=VGA8x16 TERM=linux 

I've uploaded the System.map and config files:
   http://homepage.ntlworld.com/wholehog/System.map-32-2.4.24-pa0.gz
   http://homepage.ntlworld.com/wholehog/config-32-2.4.24-pa0

Also, when doing a fsck (ext3) with the new kernel, it got to the 70.1%
mark, and froze. 70% seems to be the beginning of a particular stage in
fsck's checking.

Typical /var/log/messages output is at:
   http://homepage.ntlworld.com/wholehog/messages-2.4.21-pa7
   http://homepage.ntlworld.com/wholehog/messages-2.4.24-pa0

This may be unrelated, but sometimes the keyboard isn't detected. This
seems to affect only the newer kernels, but I may be mistaken.

I can't seem to clear the PIM TOC info, and pressing the TOC button
doesn't seem be setting it. I think the TOC button works, because
pressing it up just after powering up results in the serial port being
used for the console - at least I assume it does, because it doesn't
use the graphics device.

I'd be very grateful for any help finding the cause of this. I'll be
happy to test anyone's patches in order to find out what's causing
things to break, or to test any fixes. Please let me know if there's
any more information or log output that would be of use.
-- 
Stuart Brady
