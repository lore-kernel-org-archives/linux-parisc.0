Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DF614829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jun 2003 11:33:09 -0600 (MDT)
Message-Id: <200306021732.h52HWKNp010654@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiler & kernel
To: joel.soete@tiscali.be (Joel Soete)
Date: Mon, 2 Jun 2003 13:32:20 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: xam@cs.ucc.ie, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3ED886A1.10605@tiscali.be> from "Joel Soete" at May 31, 2003 10:40:33 am
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

> >hppa64-gcc (3.2.3, from ftp.p-l.org unofficial-debs)
> >  seems to work fine but obviously ipt_limit.o is miscompiled:
> >  I can insmod it, but iptable wouldn't recognize the --limit* options.
> >  There are still some problems with some modules and canonicalize_funcptr,
> >
> Are you sure this is with hppa64-gcc (iirc canonicalize.., was just 
> recently backport to 3.2)?

hppa64-gcc does not canonicalize function pointers.

> >  Man, gcc-3.3 is SLOW! it takes ages to compile the kernel!

I suspect this is related to changes in the inlining model.  This is
definitely a problem with certain C++ applications.  If anybody can
generate profile and/or pass timing data for 3.3 versus 3.0.4, I
would like to see them.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
