Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3DFA482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 03:39:52 -0700 (MST)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id LAA05941 for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 11:39:50 +0100 (MET)
Message-Id: <sbf4faad.061@ms-zrt1>
Date: Fri, 16 Nov 2001 11:28:50 +0100
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <alan@lxorguk.ukuu.org.uk>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Betr.: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240
	Graphics, 64bit kernel and more)
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

>> Alpha (gcc-2.95.4)        : real 5m45 user 5m13 system  9s
>> Alpha (gcc-3.0.2 20010924): real 4m36 user 4m12 system 10s
>> C200+ (gcc-3.0.2 20010922): real 8m23 user 7m48 system 33s
>> dual P3/700 (gcc-2.95.4)  : real 1m20 user 1m17 system  3s
>
>Be cautious. Unless you built cross compilers and each is building for
>the same target you are doing different amounts of work for each target
>CPU

In what way? It's not like the ./configure script will produce very =
different
results on alpha vs parisc, it doesn't even check for 64 bits/32 bits
differences. All this just demonstrated my gut feeling that compiling (
the kernel, for example) feels slower on parisc than it should be.

>
>Looking at the high system time I guess there is work to do on the hppa,
>but it doesn't suprise me. It takes a lot of time to tune a port after it
>actually works reliably
>
It's exciting to be involved in - I  fully agree.

Good luck,
Jurriaan
