Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C189482A
	for <parisc-linux@parisc-linux.org>; Tue, 17 Apr 2001 12:22:34 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14pa73-0003yT-00; Tue, 17 Apr 2001 19:22:05 +0100
Date: Tue, 17 Apr 2001 19:22:05 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Jes Sorensen <jes@linuxcare.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
Message-ID: <20010417192205.A28724@parcelfarce.linux.theplanet.co.uk>
References: <E14o832-0003Ih-00@the-village.bc.nu> <d366g3xv0a.fsf@lxplus015.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d366g3xv0a.fsf@lxplus015.cern.ch>; from jes@linuxcare.com on Tue, Apr 17, 2001 at 08:04:53PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Apr 17, 2001 at 08:04:53PM +0200, Jes Sorensen wrote:
> >>>>> "Alan" == Alan Cox <alan@lxorguk.ukuu.org.uk> writes:
> 
> Yes, except that ISA has stronger semantics than PCI.

You need to issue a read after a write to be sure the write hit the
device on ISA?

> >> Using writeb on a gsc is misleading everybody else who reads the
> >> code into believing that it's a PCI device.
> 
> Alan> Rubbish.
> 
> Unfortunately not, look at the fb code to see the chaos.

huh?  the fb code is ugly precisely because people aren't using
readb/writeb to access device memory.

-- 
Revolutions do not require corporate support.
