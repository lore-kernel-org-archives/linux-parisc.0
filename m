Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4764A482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 08:44:43 -0700 (MST)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id QAA16845 for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 16:44:40 +0100 (MET)
Message-Id: <sbeffb9d.022@ms-zrt1>
Date: Mon, 12 Nov 2001 16:31:31 +0100
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <parisc-linux@lists.parisc-linux.org>, <xam@student.cs.ucc.ie>
Subject: Betr.: [parisc-linux] C240: Graphics, 64bit kernel and more
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

>Hello,
>
>I'm going to buy a C240 (I already have a 730 (not here) and had a F10).
>It has 512MB and FX/2 24bit graphics. I think it's rather good supported
>by parisc-linux, am I right ?

yup.

>
>Before I actually buy the computer, I wanted to know whether STI
>and/or the framebuffer for a 64bit kernel is working.

sti is just working, IIRC

>
>Moreover I've read that UW-SCSI is not working yet.
>So is it working in FAST-SCSI (narrow) mode ?

there's nothing wrong with the UW-SCSI to my knowledge.

>
>Are you aware of any other gcc/binutils bugs or should
>gcc/binutils NOW create proper executables for pa2.0 and
>pa1.1 (including the old CPUs like 730's PCX-S CPU) ?

There are still bugs.

>
>does produce gcc rather good optimized code for parisc
>(compared to HP's cc, is there a significant performance difference) ?

in general, comparing gcc to a manufacturers compiler; there is
such a difference.

>
>I can imagine that the Linux/HPPA kernel is not very optimized yet
>(can't compare the speed on my 730 with HP/UX since I don't
>have the OS software anymore ...). Is the speed difference just a
>few percent or can you 'feel' it (mhh, fuzzy question) ?
>
I can only say that compiling a kernel on my C200 takes about 2 times
as long as on my alpha (21164, 500 Mhz, 2 Mb cache). I feel it should
be faster.

Good luck,
Jurriaan
