Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 805A2482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Oct 2001 13:54:33 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15yJQS-0000aQ-00; Mon, 29 Oct 2001 20:54:28 +0000
Date: Mon, 29 Oct 2001 20:54:28 +0000
From: Matthew Wilcox <willy@debian.org>
To: jean-yves GUILLEVIC <jean-yves.guillevic@wanadoo.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 715S/33 aka Strider-33
Message-ID: <20011029205428.A31924@parcelfarce.linux.theplanet.co.uk>
References: <005401c160ba$56bd13a0$010101a8@TPDEV.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <005401c160ba$56bd13a0$010101a8@TPDEV.local>; from jean-yves.guillevic@wanadoo.fr on Mon, Oct 29, 2001 at 09:43:12PM +0100
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

On Mon, Oct 29, 2001 at 09:43:12PM +0100, jean-yves GUILLEVIC wrote:
> if someone can help he will be welcome.
> if someone wants more info just ask.

> High Priority Machine Check (HPMC): Code=1 regs=102a5080 (Addr=00000000)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111000001111
> r0-3     00000000 1021e800 102fab98 10373810
> r4-7     10374004 1035a5d8 1035a010 1035a010
> r8-11    102b5010 fc4ff000 0004000e 102e8fd4
> r12-15   001a5a59 000ff000 f0001018 00000000
> r16-19   00000001 08000058 f000069c 0000000f
> r20-23   00000000 102d5d40 1021fed0 0000ffff
> r24-27   102d5c68 10295c10 f1000001 102a2010
> r28-31   000000ff 00000780 104fc600 1021f244
> sr0-3    00000000 00000000 00000000 00000000
> sr4-7    00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 1021efe8 1021efec
>  IIR: e840c000    ISR: 00000000  IOR: 102fab98
>  CPU:        0   CR30: 104fc000 CR31: 10350000
>  ORIG_R28: 00000000

Let's start by decoding 1021efe8 in your System.map.  102fab98 is probably
in the function which called it.  It may or may not be useful to decode
some of the earlier addresses in the stack dump -- normally IAOQ and r2
are enough to give an initial starting point for investigating.

I'm going to guess though that you were in gsc_readb or similar.  The first
argument is in gr26 and it's 0xf1000001.  Given your output:

> 8. Strider-33 Audio (10) at 0xf1000000, versions 0xd, 0x0, 0x7b

I would guess that disabling sound would allow the kernel to boot a
little further.  Could you investigate this please?

-- 
Revolutions do not require corporate support.
