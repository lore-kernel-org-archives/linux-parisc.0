Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DC55482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 15:45:40 -0700 (MST)
Message-Id: <200211152245.gAFMjWN0015793@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [2.5] next issues ...
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Fri, 15 Nov 2002 17:45:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.44.0211152207240.39295-100000@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at Nov 15, 2002 10:17:23 pm
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

> no PA 2.0 here.

If you use a PA 2.0 machine and don't care if your code is compatible
with older machines, then using PA 2.0 code provides a number of
advantages.  Probably, the most important is the change in the maximum
branch distance for pc-relative calls (22-bit vs. 17-bit relocation).
In large programs, it easy to exceed the maximum distance of the 17-bit
relocation.

> > was picking, I would go with the current mainline 3.3 or the debian 3.0.
> 
> ok, how and where to get 3.3 from ?
> 	- subversions.gnu.org cvs ?

This is a mirror of the main gcc source.  I use it except for submissions.

> 	- cvs.parisc-linux.org cvs ? (looks older)
> 
> I am going to dig into this.
> 
> What about binutils 2.13.90.0.10-2 ... do you know what changes where
> there from previous versions ?

I use the main binutils source.  Don't know anything about the debian
changes.  They should be fed back for review if the have any merit.
However, I think Alan Modra did that awhile ago when he was working
on the PA toolchain.

> Ok, first thing I am going to do is build with gcc 3.0.4 and see if it
> works.

Be aware that debian 3.0.4 suffers from a problem where calls that have
a branch distance exceeding the max for a 17-bit relocation are not
correctly changed to an indirect call in all cases.  This will cause a
problem building expr.c in stage1 if you don't include "-O2" in STAGE1_CFLAGS.
This is fixed in 3.1 and latter.  The 3.1/3.2 fix didn't include millicode
calls or PA 2.0 adjustments.  That's now in 3.3.

I'll be glad when debian 3.0.4 is gone.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
