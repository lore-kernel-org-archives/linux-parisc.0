Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16074482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 04:51:30 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B41B8B007; Fri,  8 Jun 2001 11:47:39 +0100 (BST)
Date: Fri, 8 Jun 2001 11:47:39 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: E Frank Ball <frankb@efball.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] dselect problems
Message-ID: <20010608114739.I16532@linuxcare.com>
References: <20010606140212.A11814@zouave.sonic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010606140212.A11814@zouave.sonic.net>; from frankb@efball.com on Wed, Jun 06, 2001 at 02:02:12PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jun 06, 2001 at 02:02:12PM -0700, E Frank Ball wrote:
> 
> I have a 712/80 and a graphics monitor (HP A1097C).  I got the base
> system running from the palinux-0.9-32sti.iso CD.
> 
> I then tried to run "dpkg-reconfigure base-config".  It got to where it
> is supposed to install the packages and died with a message:  failed
> running script /usr/sbin/dpkg-preconfigure --apt || true
> apt-utils is not installed.

apt-utils isn't installed, true, but it isn't installed for anyone
else at this stage either.  Don't know why you see this problem.

> I got apt-utils to install with "apt-get install apt-utils", but now I
> can't get anything else to install either with dselect or apt-get.  I
> get errors about "couldn't stat source package list cdrom...
> - stat (2 no such file or directory).

Sounds like the CDROM is not mounted, or not mounted where
/etc/apt/sources.list says it is.  I have

deb http://beast:80/rel0.9/debian sid main
deb http://beast:80/rel0.9/more-packages/debian sid main

in my sources.list, but that is because I installed from http.  I don't
have an entry for CDROM source atm, sorry.

If you updated apt (dpkg -l apt) to 0.5.3, you may have to update its
pkg list with "apt-get update".

Perhaps someone with a CD based install could post their sources.list
as an example?

> "which stat" shows nothing.  I don't see a stat package either.
> This is my first experience with Debian.

"stat" is probably referring to the system call stat() having failed.
Basically it is saying that some file it wants to access doesn't exist.

Richard
