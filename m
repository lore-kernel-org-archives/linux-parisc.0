Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1B6A489E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 14:17:39 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3FCB4B00C; Mon, 24 Sep 2001 21:16:18 +0100 (BST)
Date: Mon, 24 Sep 2001 21:16:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem installing new kernel
Message-ID: <20010924211618.K5051@linuxcare.com>
References: <000901c142ff$6bce2410$1900a8c0@aloha> <20010922072842.A4157@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010922072842.A4157@middle.of.nowhere>; from thunder7@xs4all.nl on Sat, Sep 22, 2001 at 07:28:42AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 22, 2001 at 07:28:42AM +0200, thunder7@xs4all.nl wrote:
> On Sat, Sep 22, 2001 at 02:42:12AM +0200, Tino Hirschmann wrote:
> > Hi,
> > 
> > i got palinux-0.9.2 running on my HP 715/80. I compiled the kernel as
> > discribed on the webpage.
> > But what do i have to do after i did make palo ?
> > I think make zlilo doesn't work here .-)
> > 

'make palo' will build a vmlinux, and then use that to build a lifimage.
The lifimage is used for netbooting.  If you are booting from disk
you want to copy vmlinux to /boot/vmtest (or something).  Then your
options are either

> Edit /etc/palo.conf and run /sbin/palo

or interact with the ipl somehow (either say 'yes' to the question on boot,
or use 'bo isl', depending on machine), and edit the kernel name to
be vmtest.

Richard
