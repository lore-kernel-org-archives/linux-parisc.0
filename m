Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B1EF4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 09:30:37 -0600 (MDT)
Message-Id: <200310201530.h9KFUYZN000693@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: HPPA FPU Specification? (FE_INEXACT raised by accident)
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 20 Oct 2003 11:30:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20031020050229.GC26432@systemhalted> from "Carlos O'Donell" at Oct 20, 2003 01:02:29 am
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

> > I suggest looking at page 10-7.  It describes the PA 2.0 behavior
> > for this situation.  I'm not an IEEE so I don't know offhand what it
> > mandates.
> 
> Multiple exceptions per instruction is not the intended behaviour :)
> I need two numbers, that when added only overflow, not overflow and
> inexact. The same to be said for underflow. Perhaps I just need to 
> dig more.

Well 10-7 talks explicitly about what happens when you get both
exceptions on a single instruction.  On the otherhand, the discussion
of the inexact exception seems to imply that inexact should only occur
in an overflow/underflow situation when an overflow/underflow exception
doesn't occur.  Possibly, the PA implementation is not consistent with
IEEE mandated behavior, but I can't be sure.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
