Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71271482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 10:24:23 -0600 (MDT)
Message-Id: <200305121624.h4CGOMq1001557@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH-2.5] Various cleanups
To: randolph@tausq.org
Date: Mon, 12 May 2003 12:24:21 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jbglaw@lug-owl.de, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030512153659.GK4509@tausq.org> from "Randolph Chung" at May 12, 2003 08:36:59 am
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

> how does that work? __c_f_f_c is emitted by the compiler internally,
> right? how can we define an inline version of this function?

Dooh, you are correct.  I wrote a little test program and the libcall
doesn't get inlined.

So if no canonicalization is needed, you want something like:

typedef int (*fptr_t) (void);

unsigned int __canonicalize_funcptr_for_compare (fptr_t)
      __attribute__ ((visibility ("hidden")));

unsigned int
__canonicalize_funcptr_for_compare (fptr)
   fptr_t fptr;
{
  return (unsigned int)fptr;
}

The libgcc version is hidden.  That's because shared libraries need
their own copy which accesses the got table in the shared library.
Probably in the kernel implementation, a single copy of the routine
is sufficient and you don't want the hidden attibute.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
