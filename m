Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09BF7482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 09:43:25 -0700 (MST)
Received: from xatlrelay1.atl.hp.com (xatlrelay1.atl.hp.com [15.45.89.190])
	by atlrel7.hp.com (Postfix) with ESMTP id B1FF21FA33
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 11:40:00 -0500 (EST)
Received: from xatlbh3.atl.hp.com (xatlbh3.atl.hp.com [15.45.89.188])
	by xatlrelay1.atl.hp.com (Postfix) with ESMTP id E94211F504
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 11:43:22 -0500 (EST)
Message-ID: <3C1637AA.81611E8C@hp.com>
Date: Tue, 11 Dec 2001 11:43:22 -0500
From: Chuck Slivkoff <charles_slivkoff@hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: 2.4.16-pa16 (from CVS) fails on "make depend"
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

The "make distclean" which Grant suggested below seems to have resolved
this.

Thanks Grant!


-------- Original Message --------
Subject: Re: [parisc-linux] 2.4.16-pa16 (from CVS) fails on "make
depend"
Date: Mon, 10 Dec 2001 22:38:01 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
To: Chuck Slivkoff <charles_slivkoff@hp.com>

Chuck Slivkoff wrote:
> I did a CVS update yesterday and tried to build a kernel today, using
> the same .config from my last successful build (2.4.9-pa78).

Chuck,
you went from 2.4.9 to 2.4.16...quite a jump.

> After a "make clean", "make depend" is failing with the error below.
> I've done a "make menuconfig" and things seem to be OK.
> 
> Anyone have any suggestions?

The other fellow is right, you need to run any variant of make config
(eg make oldconfig or menuconfig) in order to fix up CONFIG_XXX
options which will match the new kernel. Maybe you did that
and just forgot to mention it.

When I get paranoid, I save off the .config, make distclean, restore
the .config, make oldconfig, and continue on with the rest of the
usual steps.

hth,
grant
