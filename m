Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68D1B482A
	for <parisc-linux@parisc-linux.org>; Wed, 26 Mar 2003 03:16:34 -0700 (MST)
Date: Wed, 26 Mar 2003 11:07:46 +0100
To: davidm@hpl.hp.com
Cc: Matthew Wilcox <willy@debian.org>,
	Adriano Galano <adriano@satec.es>, linux-ia64@linuxia64.org,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
Message-ID: <20030326100746.GA21703@charrue.esiee.fr>
References: <001f01c2f1f1$e772d4b0$6620a4d5@tsatec.int> <20030324121037.GI31008@parcelfarce.linux.theplanet.co.uk> <15999.23084.647629.868320@napali.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <15999.23084.647629.868320@napali.hpl.hp.com>
From: m.delahaye@esiee.fr (Matthieu Delahaye)
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

On Mon, Mar 24, 2003 at 11:19:08AM -0800, David Mosberger wrote:
> >>>>> On Mon, 24 Mar 2003 12:10:37 +0000, Matthew Wilcox <willy@debian.org> said:
> 
>   Matthew> On Mon, Mar 24, 2003 at 11:41:18AM +0100, Adriano Galano
>   Matthew> wrote:
>   >> Hi all:
> 
>   >> I read that IA-64 support PA-RISC instruction mapping. That's
>   >> mean that I can use Linux for PA/RISC
>   >> (http://www.parisc-linux.org/) in a Itanium 2 computer?
> 
>   Matthew> No.  You certainly can't run a PA-RISC kernel on an IA64
>   Matthew> box, just like you can't run an x86 kernel on an ia64 box.
> 
> Ugh, that's not strictly true.  You definitely can boot x86 linux and
> windows 98 on Itanium.  I believe the same is true for Itanium 2 if
> you have Intel's firmware, though I have never tried that myself.

...And perhaps you don't forget to add support for the chipset in the
x86/hppa kernel. 

Is the Intel's firmware freely distributed or it is
internal only?

Matthieu
