Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33CFF4838
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 14:30:50 -0600 (MDT)
Date: Mon, 26 Apr 2004 13:30:50 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 tausq
Message-ID: <20040426203050.GG3965@tausq.org>
References: <20040426202446.GB19643@engsoc.org>
	<200404262029.i3QKT5sE001532@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200404262029.i3QKT5sE001532@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

In reference to a message from John David Anglin, dated Apr 26:
> > Oddly, this dies on boot on my B180.
> > 
> > The contents of IIR is the prefetch instruction (ldw 0(%r19), %r0).
> 
> > r16-19  1037df04 f0000194 19ffffe0 00000000
> 
> %r19 is 0.

prefetching on 0 is valid on pa20 tho.

willy is fixing this in the kernel now.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
