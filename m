Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2B49482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 08:40:54 -0700 (MST)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id QAA04127 for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 16:40:52 +0100 (MET)
Message-Id: <sbf3efb0.007@ms-zrt1>
Date: Thu, 15 Nov 2001 16:33:27 +0100
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <parisc-linux@lists.parisc-linux.org>, <herbr@magma.ca>
Subject: Re: [parisc-linux] (no) HPMC on C200 and FX4 question
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

>In message * of Vol 1 #372, Jurriaan asks if anyone has tried a copy on
>FWSCSI in a C200.

that would be Grant, not me!

>I just got mine up with FWSCSI and tried the same copy - no HPMC.
>Now, this is 2.4.9pa79, nor one of the 2.4.14 kernels but it does work!
>

I just typed=20

sync; cp /boot/vmlinux* ./; sync

on my C200 running 2.4.14-pa2 and no HPMC occurred. The disk is the only
disk on the FWSCSI chain (internal).

>By the way does anyone know why an FX4 would not be set up. The message =
is:
>
>Trying PCI STI ROM at f1e00000, PCI hpa at f6000000
>I'm not trying to set up the PCI graphic card now... It would freeze your
>machine
>Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard =
Company)'
>
I get that message too; and I also wonder what it means exactly.

Good luck,
Jurriaan
