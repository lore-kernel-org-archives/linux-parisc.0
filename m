Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p508456E5.dip.t-dialin.net [80.132.86.229])
	by dsl2.external.hp.com (Postfix) with ESMTP id A50CA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 18:39:21 -0700 (MST)
Date: Sat, 5 Jan 2002 02:36:39 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Suder <csuder@cisco.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Need five #defines, please.....
Message-ID: <20020105023639.A6903@solo.franken.de>
References: <20020104012559.69375281.csuder@cisco.com> <20020104012559.69375281.csuder@cisco.com> <20020104233146.A31733@solo.franken.de> <4.3.2.7.2.20020104154342.02a49428@mira-sjc5-9.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4.3.2.7.2.20020104154342.02a49428@mira-sjc5-9.cisco.com>; from csuder@cisco.com on Fri, Jan 04, 2002 at 03:58:06PM -0800
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

On Fri, Jan 04, 2002 at 03:58:06PM -0800, Christian Suder wrote:
> If I'm not mistaken libc5 <=> glibc1 and libc6 <=> glibc2, these are the 
> ones for glibc2. In any case it runs on a (Linux-)Sparc with glibc2.

you are right, it's not a libc5 thing. I'm going to look at that tomorrow.

> >Fixing pthreads would be much more productive.
> 
> Agree. However I believe the problems to be caused by sloppy programming in 

right now I'm not sure, which mozilla gets further. Mine dies without 
display anything in nsGetModule of libimglib2.so. At least that's what 
gdb tells me. I've build my mozilla from the debian 0.9.7-2 sources.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
