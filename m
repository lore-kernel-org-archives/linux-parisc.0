Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA17082
	for <parisc-linux@puffin.external.hp.com>; Fri, 9 Jul 1999 11:52:18 -0600
Date: Fri, 9 Jul 1999 19:52:07 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Phil Schwan <pschwan@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] licencing-question... ?
Message-ID: <19990709195207.S386@mencheca.ch.genedata.com>
References: <19990709130913.H14613@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990709130913.H14613@thepuffingroup.com>; from Phil Schwan on Fri, Jul 09, 1999 at 01:09:13PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 09, 1999 at 01:09:13PM -0400, Phil Schwan wrote:
> Are we/Am I  allowed to use code from the OSF-parisc-port ???
> The license from this port is:
> -----------------------------------------------------------------
> /*
>  * Copyright 1996 1995 by Open Software Foundation, Inc.
>  *              All Rights Reserved

>  * Permission to use, copy, modify, and distribute this software and
>  * its documentation for any purpose and without fee is hereby granted,
>  * provided that the above copyright notice appears in all copies and
>  * that both the copyright notice and this permission notice appear in
>  * supporting documentation.

This is the only bit to worry about.  I _think_ it's okay (ie this isn't
the infamous `advertising clause -- i think that's the one which talks about
being mentioned on the advertising for your product).  At any rate, the X11
licence which is generally reckoned GPL-subsumable contains:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

The sticking point could be the copyright & permissions having to
appear in the supporting documentation.  What would be the supporting
documentation if, say, Red Hat sold Red Hat 8.0 for the PA-RISC? 
Would the user documentation have to include the copyright notice?

[I notice that it doesn't say `or substantial portions', so maybe just
 stealing large quantities of it and not including the permission notice
 in the documentation would be okay, as long as you don't use all of it.
 This will almost certainly annoy people though.]

>  * OSF DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE
>  * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
>  * FOR A PARTICULAR PURPOSE.

that's fine, the GPL does that too.

>  * IN NO EVENT SHALL OSF BE LIABLE FOR ANY SPECIAL, INDIRECT, OR
>  * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
>  * LOSS OF USE, DATA OR PROFITS, WHETHER IN ACTION OF CONTRACT,
>  * NEGLIGENCE, OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
>  * WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

ditto.

>  * Copyright (c) 1990,1991,1994 The University of Utah and
>  * the Computer Systems Laboratory (CSL).  All rights reserved.
>  *
>  * THE UNIVERSITY OF UTAH AND CSL PROVIDE THIS SOFTWARE IN ITS "AS IS"
>  * CONDITION, AND DISCLAIM ANY LIABILITY OF ANY KIND FOR ANY DAMAGES
>  * WHATSOEVER RESULTING FROM ITS USE.

ditto

>  * CSL requests users of this software to return to csl-dist@cs.utah.edu any
>  * improvements that they make and grant CSL redistribution rights.

`requests' is not legally binding, so that's fine.

> Can we use the code, is it OK to accept this license, or shall we rewrite all ????

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
