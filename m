Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7351D4847
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 15:46:09 -0700 (MST)
Message-ID: <3C8E8520.EC6877E3@cup.hp.com>
Date: Tue, 12 Mar 2002 14:45:52 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error.
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com> <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
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

Matthew Wilcox wrote:

> On Tue, Mar 12, 2002 at 12:37:24PM -0800, Gururaj Ananthateerta wrote:
> > both of them are set to 'y'
>
> OK.  Since this is an N class, the serial ports should be automatically
> detected on the Diva card.  Towards the top of arch/parisc/kernel/pdc_cons.c
> you'll see:
>
> /* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems.
>  * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
> #undef EARLY_BOOTUP_DEBUG

Apologies folks.
helped a lot. I cud figure out that my kernel was  a32-bit
i got htis hppa-linux-gcc and compiled  a 64-bit kernel.
things are still ugly.

anyone working on supporting N-class.




>
>
> Change the #undef to #define and recompile.  Do you see any more output?
>
> --
> Revolutions do not require corporate support.
