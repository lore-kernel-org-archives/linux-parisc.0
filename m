Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06F164829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 13:01:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17s6Yc-0001qP-00
	for parisc-linux@lists.parisc-linux.org; Thu, 19 Sep 2002 20:01:46 +0100
Date: Thu, 19 Sep 2002 20:01:45 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP/UX binaries
Message-ID: <20020919200145.W10583@parcelfarce.linux.theplanet.co.uk>
References: <20020919151734.GH845@tykepenguin.com> <20020919152756.GA12481@tausq.org> <20020919185131.GB6961@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020919185131.GB6961@tykepenguin.com>; from patrick@tykepenguin.com on Thu, Sep 19, 2002 at 07:51:31PM +0100
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

On Thu, Sep 19, 2002 at 07:51:31PM +0100, Patrick Caulfield wrote:
> > static inline int
> > do_load_som_library(struct file *f)
> > {
> > /* No lib support in SOM yet.  gizza chance.. */
> >         return -ENOEXEC;
> > }
> 
> aha. That'll teach me to read the FAQ rather than the code :-)

i'm not sure the comment is actually right... seems to me that ld.so
on hpux loads the libraries without going through this entry point.
it'd be interesting to test, but i think hpux emulation is broken right
now anyway.

-- 
Revolutions do not require corporate support.
