From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Splitted lasi_82596 driver
Date: Sat, 21 Apr 2007 16:14:19 +0200
Message-ID: <200704211614.19496.deller__23513.8997821652$1416624336$gmane$org@gmx.de>
References: <20070415144209.GA11196@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070415144209.GA11196@alpha.franken.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Thomas,

On Sunday 15 April 2007, Thomas Bogendoerfer wrote:
> as I needed a 82596 driver for a machine (SNI RM400), I took
> lasi_82596.c, cloned it and made it working on that machine. But
> I don't think it's a good idea to have another clone of 82596.c in
> linux, therefore I splitted my cloned driver and took the lasi parts
> to get one major file (lib82596.c) and two hardware specific parts
> (lasi_82596.c and sni_82596.c), which just holds the hardware things
> of the driver. This "new" driver works now on the RM400, so it's
> time to test it on parisc hardware. Unfortunatly my machines with
> lasi82596 are stored away, so I'm looking for someone, who is
> willing to try the patch below and give me feedback.

Tests sucessfully passed on my B160L :-)
 
> Are there any other things, which should be improved in the driver,
> before I'm going to submit this driver ?

Some basic ethtool support would be a nice-to-have.
E.g. name/driver name/Available speeds/link up&down/...

Greetings,
Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
