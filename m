Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6603482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 22:58:19 -0600 (MDT)
Message-Id: <200307180458.h6I4wCxk023903@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: arch/parisc/kernel/perf_asm.o not building
To: acme@conectiva.com.br (Arnaldo Carvalho de Melo)
Date: Fri, 18 Jul 2003 00:58:12 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030718042606.GA1582@conectiva.com.br> from "Arnaldo Carvalho de Melo" at Jul 18, 2003 01:26:06 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Em Fri, Jul 18, 2003 at 01:14:40AM -0300, Arnaldo C. Melo escreveu:
> > My first post 8)
> 
> And probably adding more noise to the list :( The problem "magically"
> disappeared when I stopped using:
> 
> make ARCH=parisc CROSS_COMPILE=hppa-linux-
> 
> And started using:
> 
> make ARCH=parisc CROSS_COMPILE=hppa64-linux-

It's not magic.  You configured for a 64-bit kernel.

You shouldn't be using gcc 3.0.3.  The generic version doesn't have
have the required configuration features for parisc-linux.  The
first GNU version of GCC which works reasonably well with parisc-linux
is 3.2.  3.3 is the best release for user code but there are still some
issues with respect to building kernels that haven't been fully resolved.
The debian 3.0.4 release is a good choice for kernel builds.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
