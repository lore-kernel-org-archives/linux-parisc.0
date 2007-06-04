From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 21:02:24 -0400 (EDT)
Message-ID: <200706040102.l5412OUS022106__3986.59478310055$1416624387$gmane$org@hiauly1.hia.nrc.ca>
References: <20070603195133.GB23062@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: matthew@wil.cx,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070603195133.GB23062@fattire.cabal.ca> from "Kyle McMartin" at
	Jun 3, 2007 03:51:33 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00001000000001000000011100001110 Not tainted
> > r00-03  000000000804070e 00000000405107c0 000000004051aed4 0000000040103000
> > r04-07  0000000040503fc0 0000000000480000 00000000fffffff0 00000000f040dd30
> > r08-11  0000000000000258 0000000000000001 000000000804000e 0000000040514634
> > r12-15  0000000000000000 0000000000000001 0000000000000001 00000000000225c4
> > r16-19  00000000f0d00b0c 0000000000000000 00000000000f76f8 0000000080000000
> > r20-23  00000000e208b185 000000003ffffd90 0000000040103020 00000000404e5300
> > r24-27  0000000000000000 00000000403c3491 000000004010300d 0000000040503fc0
> > r28-31  00000000e208b185 00000000404c0260 00000000404c0290 000000000fec6fc0
> > sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > 
> > IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004051af34 000000004051af38
> >  IIR: 0e60109c    ISR: 0000000000000000  IOR: 0000000080000000
> >  CPU:        0   CR30: 00000000404c0000 CR31: 00000000404c4000
> >  ORIG_R28: 00000000401385a4
> >  IAOQ[0]: check_ivt+0x84/0xe0
> >  IAOQ[1]: check_ivt+0x88/0xe0
> >  RP(r2): check_ivt+0x24/0xe0
> > Kernel panic - not syncing: Kernel Fault
> > <0>Rebooting in 5 seconds..
> 
> binutils is fucked.

I don't think so.  There's some wierd stuff in check_ivt.  It looks
like the function is trying to see if it can compute a checksum for
the os_hpmc function without causing a panic.  However, the function
pointer stuff is all wrong.  Note that 32 and 64-bit function pointer
handling is completely different.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
