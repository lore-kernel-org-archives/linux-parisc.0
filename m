Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF6F4484A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 16:31:38 -0700 (MST)
Message-ID: <3C8E8FCC.3C1E759@gmx.at>
Date: Wed, 13 Mar 2002 00:31:24 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: Gururaj Ananthateerta <gururaj@cup.hp.com>,
	parisc <parisc-linux@lists.parisc-linux.org>
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

First of all, have you really waited for a long time, when the machines
hangs on that "last" console output. I have made the experience, that
sometimes (I have not found a systematic behind that, yet) the machine
delays for a longer while (up to half a minute) and suddenly it
continoues
booting perfectly.

Second, you may play around with the PDC console driver for linux
(/dev/ttyB0 at major 60). If this driver is configured
(CONFIG_PDC_CONSOLE,
under "Non-standard serial port support"), then you have the same
effect as activating macro "EARLY_BOOTUP_DEBUG", but you can use
non-supported serial consoles (PDC console) as full console device
including login, etc.....

See the HELP button of CONFIG_PDC_CONSOLE for more details on setup.

With friendly regards
Christoph Plattner



Matthew Wilcox wrote:
> 
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
> 
> Change the #undef to #define and recompile.  Do you see any more output?
> 
> --
> Revolutions do not require corporate support.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
