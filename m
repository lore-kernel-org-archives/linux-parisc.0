Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B902C482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 07:59:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15qaw7-000198-00; Mon, 08 Oct 2001 14:59:15 +0100
Date: Mon, 8 Oct 2001 14:59:15 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] A todo entry
Message-ID: <20011008145915.B28880@parcelfarce.linux.theplanet.co.uk>
References: <200110080815.EAA24881@mail.lokmail.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110080815.EAA24881@mail.lokmail.net>; from jurij@lokmail.net on Mon, Oct 08, 2001 at 04:15:34AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 08, 2001 at 04:15:34AM -0400, Jurij Smakov wrote:
> It was probably me.

probably.  various people hae asked in the past, but you're the most
recent :-)

> This is slightly over my head, but that is my understanding of what needs
> to be done: instead of checking with segment_eq we need a routine,
> which just reads from memory, using space from sr2. With proposed
> modifications to get_fs, get_ds and set_fs it will automagically contain
> a correct value (0 for kernel memory and same as sr3 for userspace).

Right.

> Is it the correct interpretation? Is it still possible to do in view
> of John's comment?

Certainly; John was just pointing out some of the issues to be aware of.

-- 
Revolutions do not require corporate support.
