Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (unknown [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96B4B483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Dec 2002 23:33:27 -0700 (MST)
Date: Wed, 11 Dec 2002 01:33:21 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash when loggin in via ssh
Message-ID: <20021211063321.GB10185@systemhalted>
References: <20021211035731.GB9521@systemhalted> <Pine.LNX.4.44.0212110410060.6654-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0212110410060.6654-100000@sal.ucc.ie>
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

> Reading my previous post about the change in the Voodoo3 issue (Nov 26),
> I realized that linux-2.4.20-rc1-pa7 obviously also worked.
> This kernel was definitely compiled with gcc-3.0.4 (the one that
> was in sid as of Nov 26).
> 
> Yes, it might be a gcc issue ... haven't thought of that ...
> I'll try to recompile the latest kernel with a gcc-3.0.4 - tomorrow!

So the urban legend goes that gcc-3.2 compiled kernels may infact
produce mildly incorrect results in the networking code.

I have yet to verify this, and JDA seems to indicate that he has working
kernels with gcc-3.2. While I've only recently tested gcc-3.0.x and
gcc-3.1.x based compiles.

I don't like urban legends >:} *Added item to Chrismas todo list*

c.
