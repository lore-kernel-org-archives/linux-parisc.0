Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35B54482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 14:23:50 -0600 (MDT)
Date: Mon, 11 Aug 2003 16:21:03 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030811202103.GH20106@systemhalted>
References: <20030811190914.GA25311@dsl2.external.hp.com> <200308111925.h7BJPljx020074@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308111925.h7BJPljx020074@hiauly1.hia.nrc.ca>
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

On Mon, Aug 11, 2003 at 03:25:47PM -0400, John David Anglin wrote:
> > What's interesting is the "ld" command has "-lgcc-eh" which is where
> > the missing symbols are defined:
> > grundler <512>nm libgcc_eh.a | grep _Unwind_SjLj_Resume
> > 0000079c T _Unwind_SjLj_Resume
> > 000008d0 T _Unwind_SjLj_Resume_or_Rethrow
> > grundler <513>pwd
> > /usr/lib/gcc-lib/hppa-linux/3.3.1
> 
> Yes, but libgcc_eh.a doesn't contain the versioned symbols that the shared
> libraries need.

Are we not using libgcc_eh to resolve such symbols in libgcc and libc?

c.
