Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA16369
	for <parisc-linux@puffin.external.hp.com>; Fri, 9 Jul 1999 11:08:12 -0600
Received: from covad-sdsl-24.cais.net (HELO linux.hypnotic.org) (pschwan@209.8.211.24)
  by mailserv2.iuinc.com with SMTP; 9 Jul 1999 17:08:39 -0000
Received: (from pschwan@localhost)
	by linux.hypnotic.org (8.9.3/8.9.3/Debian/GNU) id NAA15073
	for parisc-linux@thepuffingroup.com; Fri, 9 Jul 1999 13:09:14 -0400
Date: Fri, 9 Jul 1999 13:09:13 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990709130913.H14613@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=s2ZSL+KKDSLx8OML
Subject: [parisc-linux] [Helge.Deller@ruhr-uni-bochum.de: licencing-question... ?]
List-ID: <linux-parisc.vger.kernel.org>


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii

The mailing list is still grossly misbehaving, but it seems to only do
so for Helge's mail.  I'm dealing with some mailing list issues today,
so I'll look at this as well.  In the meantime, here's Helge's mail:

-Phil

--s2ZSL+KKDSLx8OML
Content-Type: message/rfc822

Message-ID: <37862832.63D6A751@ruhr-uni-bochum.de>
Old-Date: Fri, 09 Jul 1999 18:49:54 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
X-Mailer: Mozilla 4.5 [en] (X11; I; Linux 2.2.10 i686)
X-Accept-Language: en
MIME-Version: 1.0
CC: parisc-linux@thepuffingroup.com
Subject: licencing-question... ?
References: <Pine.HPX.4.05.9907091607460.19393-100000@gamgee.ntc.nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Envelope-To: parisc-linux

Hi !

Since my commits do not show on the cvs-parisc-list......

I committed again some changes (Phillip: I only changed some small things, so that we
could compile the source again; please ignore all my changes in irq.c !),  but my
main-question is:

Are we/Am I  allowed to use code from the OSF-parisc-port ???
The license from this port is:
-----------------------------------------------------------------
/*
 * Copyright 1996 1995 by Open Software Foundation, Inc.
 *              All Rights Reserved
 *
 * Permission to use, copy, modify, and distribute this software and
 * its documentation for any purpose and without fee is hereby granted,
 * provided that the above copyright notice appears in all copies and
 * that both the copyright notice and this permission notice appear in
 * supporting documentation.
 *
 * OSF DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE.
 *
 * IN NO EVENT SHALL OSF BE LIABLE FOR ANY SPECIAL, INDIRECT, OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
 * LOSS OF USE, DATA OR PROFITS, WHETHER IN ACTION OF CONTRACT,
 * NEGLIGENCE, OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
 * WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
/*
 * Copyright (c) 1990,1991,1994 The University of Utah and
 * the Computer Systems Laboratory (CSL).  All rights reserved.
 *
 * THE UNIVERSITY OF UTAH AND CSL PROVIDE THIS SOFTWARE IN ITS "AS IS"
 * CONDITION, AND DISCLAIM ANY LIABILITY OF ANY KIND FOR ANY DAMAGES
 * WHATSOEVER RESULTING FROM ITS USE.
 *
 * CSL requests users of this software to return to csl-dist@cs.utah.edu any
 * improvements that they make and grant CSL redistribution rights.
 *
 */
-----------------------------------------------------------------

Can we use the code, is it OK to accept this license, or shall we rewrite all ????

Thanks,
Helge.

--s2ZSL+KKDSLx8OML--
