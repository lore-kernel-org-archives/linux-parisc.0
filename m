Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA10886
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 09:04:33 -0600
Date: Thu, 21 Oct 1999 11:11:36 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
To: Magne =?iso-8859-1?Q?=D8stlyngen?= <magne@spacetec.no>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] So you wanna get to a prompt, eh?
In-Reply-To: <380EEA0B.F5E469DB@spacetec.no>
Message-ID: <Pine.LNX.4.10.9910211105330.17129-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
List-ID: <linux-parisc.vger.kernel.org>


On Thu, 21 Oct 1999, Magne [iso-8859-1] Østlyngen wrote:
> Is the ramdisk included in the kernel-image? When I boot the kernel,
> I get 'no ramdisk'.

To build the kernel right now, you have to download a ramdisk from
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks or similiar.

> Of course, I don't get further than 'Transferring control to kernel'..
> :(
> I thought I had a 715, but no, it was a 710 (Bushmaster), and that seems
> to make a big difference.

I had that problem with my 715 too, but there was an alignment mistake
that I made that Philipp fixed yesterday.  You might want to update your
tree and build it again.

> Is anyone working on support for the 700?  I could do some work there,
> if it was possible to compile the kernel on linux.  Is anything being
> done on that? (What was the problem?)

The 700 has an ancient IO architecture that we don't have any
documentation on, so it's not high on the list of priorities.  However, if
someone has patches to support it, we'd be happy to apply them.

As for cross compiling... we're forced to use HPUX because we don't have a
reasonable and functioning cross linker.  More on that later.

- Alex
