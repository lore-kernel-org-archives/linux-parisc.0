Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA04030
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Nov 2000 19:36:32 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 02:38:57 -0000
Received: from alan by the-village.bc.nu with local (Exim 2.12 #1)
	id 141Jcg-0006je-00
	for parisc-linux@thepuffingroup.com; Thu, 30 Nov 2000 02:38:58 +0000
To: parisc-linux@thepuffingroup.com
Date: Thu, 30 Nov 2000 02:38:56 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E141Jcg-0006je-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] XFree status
List-ID: <linux-parisc.vger.kernel.org>

I have a server linked. inb/inw/outb/outw and friends are right now null
functions until I fill them in. Thats not a big deal. Initially I'll probably
use /dev/port but for speed I hope everyone uses mmio based hardware.

Also is this bad ?

/usr/bin/ld: lbxdix.o(.text+0x6fc): fixing R_PARISC_DPREL21L
/usr/bin/ld: lbxprop.o(.text+0xde4): fixing R_PARISC_DPREL21L
/usr/bin/ld: lbxprop.o(.text+0xdf4): fixing R_PARISC_DPREL21L

Alan


phux:/usr/src/redhat/BUILD/XFree86-4.0.1/xc/programs/Xserver# ./XFree86 

XFree86 Version 4.0.1a / X Window System
(protocol Version 11, revision 0, vendor release 6400)
Release Date: 2 August 2000
	If the server is older than 6-12 months, or if your card is newer
	than the above date, look for a newer version before reporting
	problems.  (see http://www.XFree86.Org/FAQ)
Operating System: Linux 2.4.0-test6 parisc [ELF] 
(==) Log file: "/var/log/XFree86.0.log", Time: Wed Nov 29 19:40:16 2000
(==) Using config file: "/etc/X11/XF86Config"
Parse warning on line 77 of section Keyboard in file /etc/X11/XF86Config
	Ignoring obsolete keyword "LeftAlt".
Parse error on line 77 of section Keyboard in file /etc/X11/XF86Config
	"Meta" is not a valid keyword in this section.
(EE) Problem parsing the config file
(EE) Error from xf86HandleConfigFile()

Fatal server error:
no screens found

When reporting a problem related to a server crash, please send
the full server output, not just the last messages.
This can be found in the log file "/var/log/XFree86.0.log".
Please reports problems to xfree86@xfree86.org.
