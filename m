Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA6F84830
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 13:01:20 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3NJ1Aa11393; Fri, 23 Apr 2004 15:01:10 -0400
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
From: James Bottomley <James.Bottomley@steeleye.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200404231750.i3NHouD9019650@hiauly1.hia.nrc.ca>
References: <200404231750.i3NHouD9019650@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 23 Apr 2004 15:01:09 -0400
Message-Id: <1082746870.1913.48.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 2004-04-23 at 13:50, John David Anglin wrote:
> Yes, that's what gcc generates for PA 2.0.
> 
> Regarding the assembler, I'm wondering if we want the keep "bl" for
> generating 17-bit branches.  It's rather confusing and inconsistent
> with the mnemonic mapping given in the 2.0 manual.  On the otherhand,
> gas has been this way for 4-5 years.

Yes, I think our current pressing problem is to discover why hppa64-ld
is generating out of range PCREL17F branches instead of stubbing them. 
That's definitely what's causing the boot failure in 2.6.6-rc1-pa0.

It's so strange.  Since the init section is quite a way away, it should
already be stubbing jumps to the init section.  I can't work out why the
addition of yet another section (this time covering scheduler functions)
suddenly causes it to fail.

James
