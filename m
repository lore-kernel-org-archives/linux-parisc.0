Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32393482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  2 Jun 2001 12:20:33 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA00872
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Jun 2001 12:13:04 -0600
Received: from pc2-hems4-0-cust95.bre.cable.ntl.com (HELO rhirst.linuxcare.com) (213.107.176.95)
  by mailserv2.iuinc.com with SMTP; 2 Jun 2001 18:20:17 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 50EA6B007; Sat,  2 Jun 2001 19:16:36 +0100 (BST)
Date: Sat, 2 Jun 2001 19:16:35 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Jim Buttafuoco <jim@buttafuoco.org>
Cc: PARISC-LINUX Mailing List <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] .9 install problems on a 735
Message-ID: <20010602191635.D25745@linuxcare.com>
References: <200106021656.MAA18064@p2.buttafuoco.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200106021656.MAA18064@p2.buttafuoco.net>; from jim@buttafuoco.org on Sat, Jun 02, 2001 at 12:56:03PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 02, 2001 at 12:56:03PM -0400, Jim Buttafuoco wrote:
> I am trying to install the .9 CD image via NFS on my 735.  The system
> boots into the installer fine.  I partitioned my disk and then the
> installed downloaded some packages.  After the download was complete the
> screen is displays a message "Installing essential packages".  I have
> left it there for over an hour now.  Is this normal.  If not what can I
> do...

Hi Jim,
  That is not normal, 5 or 10 minutes on a slow machine at most, I'd
guess.

The installer runs a script called debootstrap which downloads the
packages and then unpacks and configures them.  Sounds line something
has hung in the process.

I had it hang on my 715/old, because of problems with the alignment
of locks in glibc 2.2.1.  The installer is based on glibc 2.2.1 at
the moment, although you would typically upgrade to glibc 2.2.3
(which is also on the CD), after install.  That problem is processor
specific, and I wouldn't have expected it to affect the 735.

The base install uses slightly dated packages, because we had to
freeze the base package set early to have any chance of making the
installer work in time for release.

To find at what point it has hung the easiest thing to do is to
invoke debootstrap from a shell, rather than have the installer
do it automatically.  That way you see all the output.

You may just be able to ctrl-c back the the start of the installer,
otherwise start again.  Get to the point where the installer has
mounted your nfs source for you (I selected nfs source, and then
cancel when it asked me to choose the directory to install from).
Now scroll down the menu to 'execute a shell'.

You can use 'mount' and 'ls' to check that your nfs mount is ok.
Now do something like:

  debootstrap sid /target file:/instmnt/debian

/target is where the partition you are installing to is mounted.
There may be one or two prompts you have to hit return on, but
you should see a fairly steady stream of messages until

  I: Successfully completed
  umount: /dev/pts: not found

IIRC, my 715/old hung on unpacking or setting up ncurses5.

There are plenty of error msgs/warnings in the output, because
of unmet dependencies, etc, but debootstrap loops round a
number of times until everything is unpacked and configured and
dependencies are satisfied.

Let us know where it hangs,

Richard
