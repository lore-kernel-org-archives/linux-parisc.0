Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09D314865
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Jul 2002 05:42:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17QRU0-0001KM-00; Fri, 05 Jul 2002 12:42:40 +0100
Date: Fri, 5 Jul 2002 12:42:40 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] user_mode() right?
Message-ID: <20020705124240.Y27706@parcelfarce.linux.theplanet.co.uk>
References: <20020705075529.A2C604847@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020705075529.A2C604847@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, Jul 05, 2002 at 01:55:29AM -0600
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

On Fri, Jul 05, 2002 at 01:55:29AM -0600, Grant Grundler wrote:
> While trying to understand this, I ran across the following comment:
> 
> /* XXX should we use iaoq[1] or iaoq[0] ? */
> #define user_mode(regs)                 (((regs)->iaoq[0] &  3) ? 1 : 0)
> 
> Is iaoq[0] correct?

I'd've thought so.  iaoq[0] is `what instruction are we executing' and
iaoq[1] is `where are we going next'.  the only time they're going to
be different is when we're about to enter the kernel or about to return
to userspace.  in either case, it's nothing more than an out-by-one
error at worst.

-- 
Revolutions do not require corporate support.
