Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21543482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 14:27:37 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id B8176711
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 16:27:35 -0400 (EDT)
Received: from eeyore.fc.hp.com (eeyore.fc.hp.com [15.1.54.199])
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) with SMTP id OAA08831
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 14:27:35 -0600 (MDT)
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: parisc-linux@parisc-linux.org
Date: Mon, 23 Apr 2001 14:26:55 -0600
Content-Type: text/plain;
  charset="iso-8859-1"
MIME-Version: 1.0
Message-Id: <01042314265503.26870@eeyore.fc.hp.com>
Subject: [parisc-linux] parisc virtual aliasing
List-ID: <linux-parisc.vger.kernel.org>

I'm going through the parisc code related to the issue of virtual
aliasing in the dcache and need a little insight into how things
currently work.  Superdome deviates from the parisc architecture in
that non-equivalent aliasing (even for read-only pages, which the
architecture explicitly allows) causes HPMCs, so I'd like to tweak the
current support to make things work on Superdome.

In copy_user_page(), we currently do the copy using the permanent
kernel alias, then flush the destination from the dcache.  The flush
will avoid a conflict between the kernel alias and the future user
mapping, but we may still have a conflict with a previous user mapping
unless there has been a flush before the copy.  We could avoid the
conflict with a previous user mapping by either using an alias
equivalent to it (if we knew the old mapping) or flushing before the
copy.

In clear_user_page(), we currently purge the page from the dcache,
then clear it using a temporary alias equivalent to the eventual user
mapping.  I think superdome lets you do flushes and purges using
arbitrary aliases, so the purge should avoid a conflict between a
previous user mapping and the temporary kernel mapping.  The
equivalent alias should avoid any problem with the new user mapping.

We don't flush after clearing the page, so it seems like user attempts
to execute from the cleared page could read stale data from memory (on
all platforms, not just superdome).

So my questions:

	- In copy_user_page(), has the destination page already been
	  flushed somewhere else?  I think not, because I see virtual
	  index HPMCs there.

	- Do we know the previous user mapping?  If so, we could do
	  the copy using an equivalent alias to the previous mapping,
	  then flush once after the copy.  If not, we may have to
	  flush before and after the copy.

	- Are there any issues with the source of the copy?  We flush
	  only the destination, so I'm assuming the source is some
	  kernel page that has no user aliases to worry about.

	- In clear_user_page(), do we care whether user attempts to
	  execute from a cleared page get potentially stale data from
	  memory or zeros?

	- Lastly, a question not specific to superdome:
	  flush_user_dcache_range() and flush_user_icache_range() either
	  flush just the requested range or the entire cache, depending
	  on the size of the range.  Flushing just the range is done
	  with FDC, while flushing the entire cache is done with FDCE.
	  This seems like a problem for MP machines, because if you
	  flush a large enough range, the local cache will be flushed,
	  but remote ones will be untouched.

Bjorn
