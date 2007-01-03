From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800 Status (Happy New Year)
Date: Wed, 3 Jan 2007 00:24:18 -0700
Message-ID: <20070103072418.GE702__45206.3177749098$1416624248$gmane$org@colo.lackof.org>
References: <200701030058.l030wur7018506@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701030058.l030wur7018506@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 02, 2007 at 07:58:56PM -0500, John David Anglin wrote:
> I spent the last couple of days updating the kernel and userspace
> software on the pa8800 that I have (ior).  The good news is that
> the machine is now much more stable than it was.  ssh seems to
> work.  I've even been able to do a full GCC build on it.  Thanks
> to all for the fixes!

Happy New Year!
Wow! That is good!

> The bad news.  The system died almost immediately starting the
> gcc testsuite:
> 
> >From the console log:
> 
> expect (pid 20348): Protection id trap (code 27)
> Backtrace:
>       _______________________________
>      < Your System ate a SPARC! Gah! >
>       -------------------------------
>              \   ^__^
>               \  (xx)\_______
>                  (__)\       )\/\
>                   U  ||----w |
>                      ||     ||
> expect (pid 20348): Protection id trap (code 27)
> Backtrace:
>       _______________________________
>      < Your System ate a SPARC! Gah! >
> 
> [repeats a number of times]
> 
> Backtrace:
> 
> 
> Bad Address (null pointer deref?): Code=15 regs=0000000245b4f590 (Addr=00000625733a213a)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001011110100001111 Not tainted
> r00-03  000000ff0804bd0f 000000004050f8c0 0000000040311010 0000000084f664ff
> r04-07  00000000405038c0 0000000000000002 0000000084f664c1 000000007fe0a000
> r08-11  0000000000000000 000000007fe0a000 00000000000002b1 000000007ea85600
> r12-15  000000004f2241c0 000000007e96c000 000000007fe0a000 0000000000000040
> r16-19  0000000000000000 000000007fe0a494 000000007ad0b012 00000000404ba2d4
> r20-23  3c353e25733a2046 000000004050f8c0 000000007fe0a000 0000000000000000
> r24-27  0000000084f664c1 0000000000013c43 0000000078340400 00000000405038c0
> r28-31  0000000000000003 0000000245b4f560 0000000245b4f590 00000000404ba2c0
> sr00-03  0000000001436800 0000000000000000 0000000000000000 0000000001436800
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004031104c 0000000040311050

This looks like userspace. Odd.

>  IIR: 4a9c01e8    ISR: 000000003c353800  IOR: 00000625733a213a

And the IOR looks like garbage. :(

>  CPU:        0   CR30: 0000000241ee0000 CR31: 00000000404c4000
>  ORIG_R28: 00000054000000c8
>  IAOQ[0]: ip_route_input+0xb4/0xca8
>  IAOQ[1]: ip_route_input+0xb8/0xca8
>  RP(r2): ip_route_input+0x78/0xca8
> Kernel panic - not syncing: Bad Address (null pointer deref?)
>  <0>Rebooting in 5 seconds..

Right now, I don't trust the backtrace. *sigh*

FYI, ioz (800Mhz pa8800) crashed when booting 2.6.20-rc2.
I'm still looking at the PIM dump.
Last output was from ide driver. I'll try to disable DMA
and see if that works better.

cheers,
grant

> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
