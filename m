Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 015664840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Sep 2003 13:05:38 -0600 (MDT)
Date: Mon, 29 Sep 2003 15:02:51 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] pthread attributes and stack positions (gcc related?)
Message-ID: <20030929190251.GB21914@systemhalted>
References: <20030928174226.GA3040@systemhalted> <1064771620.10778.5.camel@mulgrave> <20030929151038.GC15180@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030929151038.GC15180@systemhalted>
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

On Mon, Sep 29, 2003 at 11:10:38AM -0400, Carlos O'Donell wrote:
> I agree, it seems though that after "fork" the values returned by 
> "pthread_getattr_np (pthread_self (), &a);" are bogus. While if you call
> pthread_create(...) and then the previous line from within the newly
> created thread the values are initialized properly. A mistake might
> exist with symbol versioning by which we are not calling libpthread's
> overloaded thread manager "fork()" and continuing on with the normal syscall.

Looking closer there is a __libc_maybe_call2 that happens during a fork
that is called and libpthread is linked. The maybe call tries to see if
pthread_fork is available, if it doesn't see a valid symbol it just
calls ARCH_FORK(). This looks like a suspect. So do a number of the
#ifdef's in pthread.c

c.
