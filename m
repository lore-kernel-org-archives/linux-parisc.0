Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin8.bigpond.com (juicer39.bigpond.com [139.134.6.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5B72482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Aug 2001 23:44:27 -0600 (MDT)
Received: from bubble.local ([144.135.24.81]) by
          mailin8.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GHFEVU00.A1I for <parisc-linux@lists.parisc-linux.org>; Thu,
          2 Aug 2001 15:50:18 +1000
Date: Thu, 2 Aug 2001 15:14:15 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: LaMont Jones <lamont@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] libqthreads and hppa-linux
Message-ID: <20010802151415.O5233@bubble.sa.bigpond.net.au>
References: <20010802044401.89CE11872C@security.hp.com> <20010802044946.6B4FC1872C@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010802044946.6B4FC1872C@security.hp.com>; from lamont@hp.com on Wed, Aug 01, 2001 at 10:49:45PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 01, 2001 at 10:49:45PM -0600, LaMont Jones wrote:
> > > So fix the assembler!  gas/config/tc-hppa.c:pre_defined_registers
> > Dunno which regs they are, and don't have a current runtime arch doc at
> > home.
> 
> This code seems to think that four args are passed in regs, but the code
> that cc generates appears to only pass two doubles in regs.  Likewise,
> are the FR's numbered the same?  (The names were rather funky on hp-ux,
> due to legacy issues...)

Hmm, I wonder if you've found a gcc bug?

#if 1
#define FP float
#else
#define FP double
#endif
extern FP f1 (FP a);
extern FP f2 (FP a, FP b);
extern FP f3 (FP a, FP b, FP c);
extern FP f4 (FP a, FP b, FP c, FP d);

int main (void)
{
  return f1 (1.) + f2 (1., 2.) + f3 (1., 2., 3.) + f4 (1., 2., 3., 4.);
}

With FP as float, I get fr4L, fr5L, fr6L, fr7L used in that order for
floating point args.  With FP as double, I get fr5, fr7, stack args.
Weird, but then the pa ABI _is_ weird.  I think you do need to check
that ABI document.

Alan
