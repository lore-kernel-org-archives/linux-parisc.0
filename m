Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 12 Feb 2003 12:30:37 -0700
To: "CURRY,JOHN W (HP-Cupertino,ex1)" <john_w_curry@am.exch.hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Supported Cards
Message-ID: <20030212193037.GA29683@dsl2.external.hp.com>
References: <A5374D237E78D41195810090279CC91A0E0269A0@xcup04.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A5374D237E78D41195810090279CC91A0E0269A0@xcup04.cup.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Wed, Feb 12, 2003 at 10:49:41AM -0800, CURRY,JOHN W (HP-Cupertino,ex1) wrote:
> Hi,
> 	is there a place I can look to find out what are all the I/O cards
> and devices that are supported by the 32 bit parisc Linux kernel?

No. You are looking for the official HP *supported* version of parisc-linux.
(Which unfortunately doesn't exist)

Some *drivers* that I know work:
o tulip ("DEC" 100bt)
o eepro100 (Intel 100BT)
o sym53c8xx_2 (parallel SCSI LSI 53c8xx, 53c1010)
o acenic (Tigon2 1000SX)
o tg3 (tigon3 1000bt and 1000SX)
o cpqfc (but only with Agilent Tachlite 51xx series)
o stifb/sticon (most older HP gfx cards up to PCI Vis-EG)
o serial (under Dino, LASI, suckyio)

And how well particular drivers works depends alot on which kernel
version one tries. 2.4.19 seems to be pretty good overall.
Basic rule is to just try *something* and report problems on this list.

ESIEE maintains a "this worked for me" webpage.
Links to ESIEE are on www.parisc-linux.org.


> Will the same cards be supported by the 64 bit parisc kernel?

I think so. 64-bit is used mostly on A500 - so strictly PCI
though folks can run it on both older and newer generations of
C-class machines.

> I assume that the 64 bit kernel will run the drivers in wide mode?

yes.

grant
