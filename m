Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail11.speakeasy.net [216.254.0.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A3B3482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Jun 2002 14:43:24 -0600 (MDT)
Date: Wed, 12 Jun 2002 13:43:02 -0700
From: Randolph Chung <randolph@tausq.org>
To: Martin K?chler <martin@k0k.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] tst unaligned access
Message-ID: <20020612204302.GC2796@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200206122222.35054.martin@mail.k0k.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200206122222.35054.martin@mail.k0k.net>
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

> tst(11624): unaligned access to 0xbff003d4 at ip=0x000105b3
> Not-handled unaligned insn 0x2f401016
> unaligned handler failed, ret = -1

that's fldd 0(sr0,r26),fr22 (thanks Richard!)... the unaligned handler
doesn't do floating point insns at the moment.

> What could this have been ? And what is this tst process ??
> 
> I have a 2.4.18-pa22 kernel,  iptables v1.2.6a.

try a newer kernel? there were some hanging process problems that were
fixed recently, though i think there are some other ones still there...

i have no idea what tst is though....

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
