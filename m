Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA31567
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 02:50:11 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id EAA20079
	for <parisc-linux@thepuffingroup.com>; Fri, 11 Jun 1999 04:57:39 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3760CF80.887DA4C3@thepuffingroup.com>
Date: Fri, 11 Jun 1999 04:57:36 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
References: <375F482D.E1E0B53D@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> Okay, I've committed a couple of fixes to make the building of the
> bootable image go a bit smoother.  Thanks to John for his patch that
> doesn't require /dev/zero existing to create the sparse file.
> 
> And now it passes the LIF magic and checksum, and dies.  Here's a
> hand-typed copy of the console:
> 
> "
> Main Menu: Enter command > boot p2
> Interact with IPL (Y, N, or Cancel)?> n
> 
> Booting...
> Network Station Address 001039-037944
> System IP Address 192.168.1.56
> Server IP Address 192.168.1.52
> 
> Boot IO Dependant Code (IODC) revision 2
> 
> SOFT Booted.
> "
> 
> And then absolutely nothing.  

Okay, I'm a bit better off now.  I've at least located the problem.  I
copied the IPL straight out of Jason's binary, rebuilt, and it boots. 
The next task is to figure out why the cross compiled version of ipl is
broken, and how to fix it.

An immediate solution in my mind is just to distribute a binary version
of the ipl in the kernel tree...

The IPL can't seem to load and locate the kernel, but we'll get to this
later.

- Alex
