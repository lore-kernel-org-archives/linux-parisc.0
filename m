From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Sun, 5 Sep 2004 23:02:15 -0400 (EDT)
Message-ID: <200409060302.i8632FbU001591@hiauly1.hia.nrc.ca>
References: <413B222D.8040601@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <413B222D.8040601@tiscali.be> from "Joel Soete" at Sep 5,
	2004 10:26:53 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > the weird in this last warning is that it's a very small fnct:
> > [...]
> > static inline void
> > __set_cr27(struct _pthread_descr_struct * cr27)
> > {
> >      asm(
> >                 "ble    0xe0(%%sr2, %%r0)\n\t"
> >         "copy    %0, %%r26"
> >      : : "r" (cr27) : "r26" );
> > }
> > [...]

There might be a bug in gcc's size estimate for asm's.  See the
subsection "Size of an @code{asm}" in the gcc manual.  This could be
checked with a small test program that tries to inline the above.

>     244  static inline pthread_descr thread_self (void) __attribute__
> ((const,always_inline));

This is correct.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
