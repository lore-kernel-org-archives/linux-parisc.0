Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F1E44841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 22:01:54 -0700 (MST)
Message-Id: <200311100501.hAA51qe1002160@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
To: grundler@parisc-linux.org (Grant Grundler)
Date: Mon, 10 Nov 2003 00:01:51 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: soete.joel@tiscali.be, willy@debian.org,
	parisc-linux@lists.parisc-linux.org, grundler@parisc-linux.org
In-Reply-To: <20031110044556.GB16478@colo.lackof.org> from "Grant Grundler" at Nov 9, 2003 09:45:56 pm
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

> Why replace the static inline with a macro?
> static inline provides type checking and
> type "coercion" when it's not exactly right.
> 
> > +       __asm__ __volatile__ (                              \
> > +               "\n1:\tstw\t%2,0(%1)\n"                     \
> > +               "2:\tstw\t%R2,4(%1)\n"                      \
> 
> What is "%R2" intended to be?

"%R2" should cause the second register name of a register pair to
be printed.  It's used for long long support on 32-bit ports.  See
case 'R' in the function print_operand in pa.c.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
