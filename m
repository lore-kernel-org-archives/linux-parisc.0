Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5FB6482A
	for <parisc-linux@parisc-linux.org>; Tue,  1 Jan 2002 12:10:00 -0700 (MST)
Message-Id: <200201011909.g01J9x6v012320@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new gdb deb for testing, patch for review
To: randolph@tausq.org
Date: Tue, 1 Jan 2002 14:09:58 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020101184109.GJ2179@tausq.org> from "Randolph Chung" at Jan 1, 2002 10:41:09 am
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

> > The deb seems to work for me, but please give it a try and let me know
> > if you find any issues....
> 
> argument passing seems to be broken
> 
> 357       t_double_values(double_val1, double_val2);
> (gdb) print double_val1
> $1 = 45.654000000000003
> (gdb) step
> t_double_values (double_arg1=-1.0015640258789065, 
>     double_arg2=8.5011959057330557)
>     at ../../../gdb/testsuite/gdb.base/callfuncs.c:275

This annoying problem has been around for a long time.  Argument
printouts may not be valid at a function breakpoint due to code
motion.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
