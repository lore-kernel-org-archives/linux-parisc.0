Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8251D4829
	for <parisc-linux@parisc-linux.org>; Sat,  5 Oct 2002 16:10:16 -0600 (MDT)
Message-Id: <200210052210.g95MACBv010773@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Need help to improve uaccess.h patch
To: joel.soete@freebel.net (Joel Soete)
Date: Sat, 5 Oct 2002 18:10:12 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@parisc-linux.org
In-Reply-To: <3D9F49FD.2040703@freebel.net> from "Joel Soete" at Oct 5, 2002 08:22:21 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> >>+                "\t.section __ex_table,\"a\"\n"             \
> >>+                 "\t.word\t1b\n"                            \
> >>+                 "\t.word\t(3b-1b)+1\n"                     \
> >>+                 "\t.word\t2b\n"                            \
> >>+                 "\t.word\t(3b-2b)+1\n"                     \
> > 
> > 
> > what's with the +1?
> 
> That is my main doubt :(
> In this uaccess.h, I read (but i am not quit sure to have understand all 
>   fine aspect) that we have to 'jump' after the erronious code (for me 
> 3b-[12]b + 1 ? am i wrong? ). And understand +3 in get_user_asm because 
> we would have to jump after the cast "(x) = (__typeof__(*(ptr))) 
> __gu_val;". Is it wrong?

I may be wrong but I think the code is trying to build a PLABEL.  In
which case, the value should be 2 or 3.  The least significant bit is
not used.  See the runtime architecture manual for more info on PLABELs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
