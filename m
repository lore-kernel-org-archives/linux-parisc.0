Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BF9C4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Dec 2002 21:16:54 -0700 (MST)
Date: Wed, 11 Dec 2002 04:16:47 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash when loggin in via ssh
In-Reply-To: <20021211035731.GB9521@systemhalted>
Message-ID: <Pine.LNX.4.44.0212110410060.6654-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 10 Dec 2002, Carlos O'Donell wrote:

> > It works when booting the old linux-2.4.19-pa2, so there must be a bug
> > introduced between 2.4.19-pa2 and 2.4.20-pa10.
>
> What compiler/toolchain did you use to compile 2.4.19-pa2?

Reading my previous post about the change in the Voodoo3 issue (Nov 26),
I realized that linux-2.4.20-rc1-pa7 obviously also worked.
This kernel was definitely compiled with gcc-3.0.4 (the one that
was in sid as of Nov 26).

Yes, it might be a gcc issue ... haven't thought of that ...
I'll try to recompile the latest kernel with a gcc-3.0.4 - tomorrow!

greetings max
