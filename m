Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 274C04A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Feb 2001 10:58:00 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA16529
	for <parisc-linux@puffin.external.hp.com>; Sat, 3 Feb 2001 10:53:48 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 3 Feb 2001 17:57:53 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14P6wZ-0003yS-00; Sat, 03 Feb 2001 17:57:51 +0000
Date: Sat, 3 Feb 2001 17:57:51 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RFC: I/O tree design
Message-ID: <20010203175751.C12985@parcelfarce.linux.theplanet.co.uk>
References: <3A7BB0A0.D478911A@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A7BB0A0.D478911A@uswest.net>; from rbradetich@uswest.net on Sat, Feb 03, 2001 at 12:17:52AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 03, 2001 at 12:17:52AM -0700, Ryan Bradetich wrote:
> Currently all the "discovered" I/O devices are stored in a
> fixed size array which contains up to 64 devices.  This fixed
> size array has already been established and is known to work,
> so this proposal does not attempt to replace the fixed size
> array, but instead uses indexes within the struct hp_device
> to create the logical I/O tree.

I think you need to be braver.  Kill the fixed size array.  kmalloc each
struct and use pointers to reference between them.  If you want, you
can use the doubly-linked-list macros in <linux/list.h>, but i suspect
self-managed singly-linked-lists will be more appropriate for this.
After all, it's not like the tree gets modified on a regular basis.

> Child: This index is only set to a valid node if the
> current node is the Central bus, a Bus Converter, or
> a Bus adapter.  When this index is set to a valid node,
> it points to the head of the sibling list containing all
> valid nodes for the given bus.

One advantage of doing this is that `Child' could be a pointer to a
PCI bus.

> This proposal also calls for a special "root" node at

And you don't ned a root node, just siblings.

-- 
Revolutions do not require corporate support.
