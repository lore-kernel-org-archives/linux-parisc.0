Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA04804
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Feb 2000 12:06:40 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200002111752.JAA01509@opus.allegro.com>
Subject: Re: [parisc-linux] Some PA-RISC 2.0 Gotchas
To: jcurry@cup.hp.com (John Curry)
Date: Fri, 11 Feb 2000 09:52:43 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <00ec01bf74b2$f4c6c050$1c80100f@jc356611.cup.hp.com> from "John Curry" at Feb 11, 2000 09:10:54 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re: 

> - In 2.0, function pointers are not addresses to functions, but are
> addresses to data strcutures
> called "function descriptors". So, if assembly code gets passed a pointer to
> a function, it will have
> to remember which slot in the "function descriptor" the actual function
> pointer resides.

They're pointers to data on HP-UX 10.20 as well.
 
> - There are some places in the kernel where the implicit assumption that
> longs == ints will break!

:)

My pet peeve...

Code should almost *never* use "short", "int", or "long" ... 
but instead, "int32" and "int64" (or whatever) should be used.  

I've lost track of the number of bugs I've seen caused by this.  
(Ok, one exception...if you're calling a system function documented as 
using "int" or "long", then you can declare variables of those type 
... but be very careful using them, and file a bug report with the vendor :)

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
