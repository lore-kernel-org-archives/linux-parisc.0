Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4BBE4879
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 04:19:41 -0700 (MST)
Message-ID: <53604.193.161.152.244.1078831651.squirrel@www.puszczka.com>
Date: Tue, 9 Mar 2004 12:27:31 +0100 (CET)
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
From: "Andy Walker" <ajwalker@broadpark.no>
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<20040309053615.GA11669@colo.lackof.org>
In-Reply-To: <20040309053615.GA11669@colo.lackof.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Mon, Mar 08, 2004 at 12:28:37PM +0100, Andy Walker wrote:
>> Why is 8/12 (0x00089) reported as unknown in the device table and in
proc/interrupts? Its the Zalon HVD SCSI.
> ...
>> 6. unknown device at 0xfff8c000 [8/12] { 4, 0x0, 0x03c, 0x00089 }
>
> It means we don't have an entry for Zalon in
arch/parisc/kernel/hardware.c
> Can you submit a patch for that?
> (I confess: I'm being very lazy tonight and don't want to figure what
needs to go into the hardware.c array)

Try this then. I just followed the pattern for B160L, C110 et. al.

--- linux-2.6.4-rc1-pa3.bak/arch/parisc/kernel/hardware.c	Tue Mar  9
10:05:25 2004
+++ linux-2.6.4-rc1-pa3/arch/parisc/kernel/hardware.c	Tue Mar  9 10:27:23
2004
@@ -334,6 +334,7 @@
 	{HPHW_A_DMA, 0x027, 0x00089, 0x80, "Piranha 100 FW-SCSI"},
 	{HPHW_A_DMA, 0x032, 0x00089, 0x80, "Raven T' Core FW-SCSI"},
 	{HPHW_A_DMA, 0x03b, 0x00089, 0x80, "Raven U/L2 Core FW-SCSI"},
+	{HPHW_A_DMA, 0x03c, 0x00089, 0x80, "Merlin 132 Core FW-SCSI"},
 	{HPHW_A_DMA, 0x03d, 0x00089, 0x80, "Merlin 160 Core FW-SCSI"},
 	{HPHW_A_DMA, 0x044, 0x00089, 0x80, "Mohawk Core FW-SCSI"},
 	{HPHW_A_DMA, 0x051, 0x00089, 0x80, "Firehawk FW-SCSI"},

There are other issues with the hardware.c array though. I guess they're
not critical, and I've no idea how to resolve them as they seem to
indicate duplication on HP's part. I guess this is old news:

1. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
2. Merlin+ 132 Dino RS-232 at 0xfff83000 [3] { 10, 0x0, 0x022, 0x0008c }
5. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 }
19. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085},
   additional addresses: 0xf0011000

- Merlin+ 132 is B132L+, as far as I know. But this machine is
  a plain Merlin/B132L. The Dino ports are marked Merlin+. Weird.
  Could this imply mean Dino was upgraded to a non-broken rev. using
  Merlin+ parts? There are separate items in hardware.c for 'Merlin
  132 Dino PS/2 Port', and 'Merlin 132 Dino RS-232' but these don't
  match.

- what's listed as 'Coral SGC Graphics' is actually an A4071B_LZ GSC
  card, aka. HCRX-24 with hardware acceleration board. No separate items
  in hardware.c for any of A407[01][AB] or H?CRX-(8|24).

- what's listed as 'Gecko GSC Core Graphics' on my machine is actually
  the 'Merlin 132 Core Graphics' i.e. the builtin Vis-EG. There is a
  separate item in hardware.c for 'Merlin 132 Core Graphics' but it
  doesn't match.

BTW: Firmware rev. is 6.1 (i.e. latest available)

cheers,
-Andy
