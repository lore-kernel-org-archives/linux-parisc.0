Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD4DA4A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Feb 2001 21:04:40 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA23449
	for <parisc-linux@puffin.external.hp.com>; Sun, 4 Feb 2001 21:00:26 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A7E2651.9C53CC84@uswest.net>
Date: Sun, 04 Feb 2001 21:04:33 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RFC: I/O tree design
References: <3A7BB0A0.D478911A@uswest.net> <20010203175751.C12985@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:

> On Sat, Feb 03, 2001 at 12:17:52AM -0700, Ryan Bradetich wrote:
> > Currently all the "discovered" I/O devices are stored in a
> > fixed size array which contains up to 64 devices.  This fixed
> > size array has already been established and is known to work,
> > so this proposal does not attempt to replace the fixed size
> > array, but instead uses indexes within the struct hp_device
> > to create the logical I/O tree.
>
> I think you need to be braver.  Kill the fixed size array.  kmalloc each
> struct and use pointers to reference between them.  If you want, you
> can use the doubly-linked-list macros in <linux/list.h>, but i suspect
> self-managed singly-linked-lists will be more appropriate for this.
> After all, it's not like the tree gets modified on a regular basis.

Ok, I was bored today so I worked on removing the fixed array and
replacing it with a linked list structure using kmalloc.  After I got this
compiled and linked to work with the kernel it promply paniced on
the first kmalloc statement.  Searching around in
arch/parisc/kernel/setup.c I found this comment that fits the
description of my kmalloc problem:

/*
** KLUGE ALERT!
**
** We *really* should be using a combination of request_resource()
** and request_region()! But request_region() requires kmalloc since
** returns a new struct resource. And kmalloc just isn't available
** until after mem_init() is called from start_kernel().
**
** FIXME: assume contiguous memory initially.
**     Additional chunks of memory might be added to
sysram_resource.sibling.
*/

The do_inventory call is made before mem_init() is called which
explains why kmalloc cause the machine to panic.

So I am looking for some guidence here .... do we want to move the
do_inventory call after the mem_init call ... or do we want to stick with
the fixed size array still?


> > Child: This index is only set to a valid node if the
> > current node is the Central bus, a Bus Converter, or
> > a Bus adapter.  When this index is set to a valid node,
> > it points to the head of the sibling list containing all
> > valid nodes for the given bus.
>
> One advantage of doing this is that `Child' could be a pointer to a
> PCI bus.

I like this proposal ... that is a good justification for me to move to a
dynamic tree instead of a fixed array :)  Currently I have no idea
how the interface would look to hook all the busses togeather via
a common I/O tree.  Is their a common bus interface that I should be
matching in my I/O tree implimentation for parisc-linux?

> > This proposal also calls for a special "root" node at
>
> And you don't ned a root node, just siblings.

That would be nice :)

Thanks for the feedback willy.  I have already started hacking in an I/O
tree into my local tree using the fixed array just to work out some of the
design issues, and problems to over come.  I will probably scratch this
attempt once I get a better understanding of what I am doing.

- Ryan


> --
> Revolutions do not require corporate support.
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
