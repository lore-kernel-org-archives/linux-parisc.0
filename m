Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 766F94838
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 14:29:26 -0600 (MDT)
Message-Id: <200404262029.i3QKT5sE001532@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 tausq
To: kyle@engsoc.org (Kyle McMartin)
Date: Mon, 26 Apr 2004 16:29:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040426202446.GB19643@engsoc.org> from "Kyle McMartin" at Apr
	26, 2004 04:24:46 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Oddly, this dies on boot on my B180.
> 
> The contents of IIR is the prefetch instruction (ldw 0(%r19), %r0).

> r16-19  1037df04 f0000194 19ffffe0 00000000

%r19 is 0.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
