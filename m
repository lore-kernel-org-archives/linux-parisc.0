Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 394564A19
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 16:43:18 -0700 (MST)
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] bzip2 causes page fault 
In-Reply-To: Message from Alan Modra <alan@linuxcare.com.au>
   of "Tue, 06 Mar 2001 21:07:08 EST." <Pine.LNX.4.21.0103062051380.442-100000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0103062051380.442-100000@front.linuxcare.com.au> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Mar 2001 16:45:07 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010307234507.EEC2E37CB4@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra writes...

> On Tue, 6 Mar 2001, Matt Taggart wrote:
> 
> > I am attempting to build the bzip2 debian package I ran into a problem. The
[snip]
> To fix it, you'll need to recompile current pehc CVS glibc using the new
> compiler, which will give you new crti.o and crtn.o  (And yeah, the fault
> is mine - I broke our glibc sources for a while)

The new glibc debs do indeed fix this problem.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
