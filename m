Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08D4B482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 14:39:56 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vmMZ-0005u6-00; Fri, 04 May 2001 21:39:43 +0100
Date: Fri, 4 May 2001 21:39:42 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010504213942.H32445@parcelfarce.linux.theplanet.co.uk>
References: <20010504210518.G32445@parcelfarce.linux.theplanet.co.uk> <200105042018.QAA06091@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105042018.QAA06091@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, May 04, 2001 at 04:18:42PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, May 04, 2001 at 04:18:42PM -0400, John David Anglin wrote:
> My first guess would be the pic offset table register is not being
> restored in longjmps into PIC code.  This must be done either in the
> receiver or just before the longjmp.  Of course, the longjmp can come
> from non-PIC code.  I am just about to submit a patch to fix a similar
> problem with gcc's builtin_setjmp/longjmp on the PA for the 3.0 branch.

hmm.. longjmp() restores r3-r19, r27, r30, r2, then fr12-21.  should it
be restoring r29 too?  if so, no problem -- we don't need to save/restore
r19 anyway.

-- 
Revolutions do not require corporate support.
