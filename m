Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx04.cluster1.charter.net (dc-mx04.cluster1.charter.net [209.225.8.14])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7086482A
	for <parisc-linux@parisc-linux.org>; Tue,  4 Jun 2002 21:59:12 -0600 (MDT)
Message-ID: <3CFD6578.40301@charter.net>
Date: Tue, 04 Jun 2002 21:12:24 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: debian-hppa@lists.debian.org
Cc: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] HP9000 C200 Visualize-EG XFree86 Success!
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

Just did a network install using the 0.9.3 full cdrom, and it
went very smoothly other than not being able to get the
rescue image ( 32 / 64 subdir ) by default. The default net
install options were messed up. I just [Q]uit the install and
ran DSelect on its own to get it working right, not really a
big deal.

The 2.4.17 kernel installed by default would not run X, causing
the HPMC error. Upgrading to Debian's 2.4.18 kernel fixed this
problem and gave me 8 bit color at 1024x768 with the Visualize-EG
board. For web surfers looking for help here is the relevant
snippet to put in /etc/X11/XF86Config-4

# Simple XFree86 Configuration for Visualize-EG STI Framebuffer

Section "Screen"
	Identifier	"Default Screen"
		Device	"Generic Video Card"
		Monitor	"Generic Monitor"
		SubSection	"Display"
			Depth	8
			Modes	"default"
		EndSubSection
EndSection

Install Notes: "gpm" doesn't seem to work for me, although I
am running a Dexxa Optical Wheel Mouse through a KVM switch.
I just set X to "PS/2" and it worked ( but no mouse wheel ).

Looks great! I was able to slurp up the whole Debian system
via the net with no trouble at all. KDE installed with no problems
and runs pretty well on this crate.

Just ordered a Visualize-24 graphics board on Ebay which I will
plug in and see if it works better than the EG board.

See you at Debconf-2!

- Doug
