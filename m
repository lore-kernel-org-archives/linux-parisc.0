Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id F019A482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Dec 2001 17:35:53 -0700 (MST)
Subject: Re: [parisc-linux] C110 Kernel panic while installing 0.9.3
From: Ryan Bradetich <rbradetich@uswest.net>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <5.1.0.14.0.20011222170417.0301aec0@mail.magma.ca>
References: <5.1.0.14.0.20011221084018.02d9a310@mail.magma.ca>
	<1008632016.10510.0.camel@beavis>
	<5.1.0.14.0.20011217161541.026f40e0@mail.magma.ca>
	<1008632016.10510.0.camel@beavis>
	<5.1.0.14.0.20011221084018.02d9a310@mail.magma.ca>
	<5.1.0.14.0.20011222170417.0301aec0@mail.magma.ca>
Content-Type: text/plain
Date: 22 Dec 2001 17:35:51 -0700
Message-Id: <1009067752.30519.4.camel@beavis>
Mime-Version: 1.0
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

Herb,

I added back in the parisc-linux list again. I know there has been some
effort to produce official debian kernel images from the CVS tree.  If
you do not want to setup a compile environment, I suspect these kernels
.debs will work for you.  

Otherwise, enjoy and report bugs back :)

Thanks,

- Ryan

On Sat, 2001-12-22 at 15:05, Herb Radford wrote:
> Ryan, that works just peachy!
> 
> Thanks for the quick reply. Now I just have to get my own compile 
> environment set up.
> 
> Regards, Herb
> 
> At 05:31 PM 12/21/01 -0700, you wrote:
> >Herb,
> >
> >I placed 2 images for you to download in the following links.  Use the
> >lifimage if you are net-booting, or use the vmlinux image if you use
> >palo on the native disk.
> >
> >Since these kernels are from my tree (which has a few minor un-committed
> >changes ... I'm working on a new SCSI interface driver), I tagged them
> >with a -rb1.
> >
> >ftp://ftp.parisc-linux.org/kernels/lifimage-2.4.16-pa24-rb1.gz
> >ftp://ftp.parisc-linux.org/kernels/vmlinux-2.4.16-pa24-rb1.gz
> >
> >Hope this helps,
> >
> >- Ryan
> >
> >
> >On Fri, 2001-12-21 at 06:43, Herb Radford wrote:
> > > At 11:08 PM 12/20/01 -0700, you wrote:
> > > >Herb,
> > > >
> > > >I found the error in the 53c700 scsi driver that created the error
> > > >Thomas and I found.  I committed the fix as 2.4.16-pa23.  Can you try
> > > >out this kernel and see if this fixes your problem also?
> > > >
> > > >Thanks,
> > > >
> > > >- Ryan
> > > Ryan, I'm in a bit of a spot as far as compiling a kernel is concerned.
> > > Could you possibly put a 2.4.16-pa23 kernel up on parisc-linux/kernels for
> > > me to try?
> > > If not, then I will attempt to get a compile environment set up but not
> > > likely before next week!
> > >
> > > Regards Herb (and Happy Holidays too!)
> > >
> > >
> 
> 
> 
