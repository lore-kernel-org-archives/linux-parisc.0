Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C1B2482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 22:59:34 -0700 (MST)
Message-Id: <200111100555.WAA01416@puffin.external.hp.com>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Floppy on a 712/60 
In-Reply-To: Message from Jan-Benedict Glaw <jbglaw@lug-owl.de>
   of "Fri, 09 Nov 2001 21:31:10 +0100." <20011109213107.E16534@lug-owl.de>
Date: Fri, 09 Nov 2001 22:55:29 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Jan-Benedict Glaw wrote:
> Well, the box is missing it's floppy drive.
> Can I attach a standard floppy drive ripped off an ordinary PC?

I haven't tried it but I think so.
Please try and tell us.
If you fry the box I'll replace it.

> Further on, I'm currently compiling massively.
> 
> I can't compile the "normal" floppy.o module. Is there a special one, or
> is ./include/asm/floppy.h a bit hosed (kernel sources are from CVS)?

Not ported yet. You need to add some code to "publish" the floppy device's
existance similar to serial port for lasi and kluge floppy support into
dma.h. At least what I recall off the top of my head.

grant
