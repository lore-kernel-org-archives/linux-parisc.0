Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA11852
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 20:29:50 -0700
Date: Sun, 14 Nov 1999 23:42:16 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Ryan Bradetich <rbradetich@uswest.net>
cc: paul_bame@hp.com, Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
In-Reply-To: <382F5B60.D215DB58@uswest.net>
Message-ID: <Pine.LNX.4.10.9911142341150.7516-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 14 Nov 1999, Ryan Bradetich wrote:
> > How far does it actually boot though?
> 
> Same as always (their is just more console output before it hangs).  Here is a cut/paste
> of the console messages from the serial console.

Hm.  I'm working on inserting a bazillion chassis_write() calls so that I
can see exactly where it dies...

- Alex
