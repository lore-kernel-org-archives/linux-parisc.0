Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B195E482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 07:59:01 -0700 (MST)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id PAA11690 for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 15:59:00 +0100 (MET)
Message-Id: <sbfd2062.007@ms-zrt1>
Date: Thu, 22 Nov 2001 15:41:46 +0100
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: "<" <parisc-linux@lists.parisc-linux.org>, <peter@petescaff.com>
Subject: Betr.: [parisc-linux] working .config for C160/2.4.14 ?
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

>I am trying to build a bootable kernel for my C160 & am having a few
>problems. The box is currently running a kernel I tweaked for my 712/80i
>but it is rather old & I am suffering from SCSI problems.
>
>Does anyone have a usable .config they could mail me for this box for
>2.4.16-pa* ?
>
My C200 runs fine when I run

make oldconfig

in a pristine kernel tree.

You'll get the default config, which has some sensible values. All you =
have to
choose is the processor-type. I could choose PA8x00, but that still gives
errors when I run 'make mrproper' in the kernel tree, so I always choose =
PA7x00.

Good luck,
Jurriaan
