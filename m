Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FFEB482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 08:31:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rgsP-0007E4-00; Thu, 11 Oct 2001 15:31:57 +0100
Date: Thu, 11 Oct 2001 15:31:57 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] a todo entry
Message-ID: <20011011153157.D22924@parcelfarce.linux.theplanet.co.uk>
References: <200110110952.FAA31633@mail.lokmail.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110110952.FAA31633@mail.lokmail.net>; from jurij@lokmail.net on Thu, Oct 11, 2001 at 05:52:59AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 11, 2001 at 05:52:59AM -0400, Jurij Smakov wrote:
> > #define KERNEL_DS 0
> > #define USER_DS mfsp(3)
> > #define get_ds() (KERNEL_DS)
> > #define get_fs() mfsp(2)
> > #define set_fs(x) mtsp(x, 3)
> 
> I've been looking at it for the last two days and I still
> cannot understand it :-). Why do You want set_fs to write to
> sr3?

That was a mistake -- should be #define set_fs(x) mtsp(x, 2)

> a) In userspace sr2 is always 0, so that everybody can make 
>    their syscals.
> b) sr2 is set to sr3 when we enter the kernel.
> c) get_fs returns sr2 and set_fs sets sr2, so that we can
>    always use sr2 as the space in __get_user/__set_user
> d) When we return to userspace from the kernel, sr2 is
>    set to 0 again.

Yes.

> While modification of uaccess.h to satisfy c) is more or less
> trivial, real problem for me is b) and d). I'm not quite sure, 
> where to look for these entries and returns? I would guess, 
> entry.S is the right place, but obviously I didn't RTFM enough to
> hack it yet.

Right.  I suspect the only place(s?) we need to set sr2 to 0 is where we
set sr4-7 to the user's space ID, and set sr2 to sr3 in the same places
we set sr4-7 to 0.  But that theory needs setting up and testing...

-- 
Revolutions do not require corporate support.
