Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B36074871
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 16:26:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16j7Gk-00065v-00; Thu, 07 Mar 2002 23:25:54 +0000
Date: Thu, 7 Mar 2002 23:25:54 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] evms-0.9.1 && hppa (follow ...)
Message-ID: <20020307232554.A22831@parcelfarce.linux.theplanet.co.uk>
References: <OF0AD397FF.17ED40BE-ONC1256B75.004D4BB9@com> <jso@europay.com> <20020307170635.4D95C4872@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020307170635.4D95C4872@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Mar 07, 2002 at 10:06:35AM -0700
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

On Thu, Mar 07, 2002 at 10:06:35AM -0700, Grant Grundler wrote:
> > Humm ... have you an idea why this problem did not appears for this i386 or
> > ppc (the two official supported till now)?
> 
> Dunno. Luck?
> Those arches may not be as sensitive to address space issues.

on x86, it (mostly) works to dereference a userspace address.  on PA it
does not.  On many other architectures, it does not.  Sloppy programming
on the part of the EVMS people.

-- 
Revolutions do not require corporate support.
