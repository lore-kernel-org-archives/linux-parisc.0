Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p50845C4E.dip.t-dialin.net [80.132.92.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A2B7482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 15:48:36 -0700 (MST)
Date: Thu, 27 Dec 2001 23:45:56 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Christian Suder <csuder@cisco.com>, Helge Deller <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] [Q] on EISA support
Message-ID: <20011227234556.A7543@solo.franken.de>
References: <4.3.2.7.2.20011227103742.02a018e8@mira-sjc5-9.cisco.com> <3C2B6D56.1000507@cisco.com> <csuder@cisco.com> <20011227195930.446D54861@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011227195930.446D54861@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Dec 27, 2001 at 12:59:30PM -0700
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

On Thu, Dec 27, 2001 at 12:59:30PM -0700, Grant Grundler wrote:
> Christian Suder wrote:
> > the entry is in the .config file. I'll try -pa27 later, there seem to be 
> > some issues with the -pa25 in general,
> 
> Yes - I broke dino (PCI) support in -pa25 when I re-enabled c3000 machines.
> I might have also broke EISA support but don't think so.

EISA is broken for ccio machines (ok, only checked on my C200), because
ccio requests memory space, which the eisa part wants too. I have it
"working" again, but the patch is definitly not for common use. The big
problem is, that ccio registers a primary and secondary memory space,
but ccio_find_parisc_resource() only gives back the resource for the
primary gsc space, which is the wrong one.

> Thomas fixed that in -pa26 (or pa27?).

-pa26

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
