Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BFE84829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Jan 2003 08:02:27 -0700 (MST)
Date: Thu, 16 Jan 2003 16:02:19 +0100
Message-ID: <3E1AAEFA0000192C@ocpmta6.freegates.net>
In-Reply-To: <Pine.LNX.4.44.0301161427060.31815-100000@sal.ucc.ie>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-default for hppa
To: "M. Grabert" <xam@cs.ucc.ie>,
	"Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: "Randolph Chung" <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi,
>
>This is EXACTLY what happened to me when I conpiled a kernel for my C240=

>(just using the built-in network card) with a (buggy) gcc-3.2. Incoming
>network traffic will crash the system, outgoing will work.
>
>gcc-3.2 obviously miscompiles parts of the network code of the kernel,
>whereas gcc-3.0 (with the very same kernel, same config) produced a
>working kernel. I can't remember exactly what kernel/config and compiler=
,
>but I sent the details to the list some months ago (I cann look them up
>if somebody is interested).
>
>Perhaps this helps to narrow down which part (driver or networking code)=

>of the kernel is affected by the miscompilation.
>
May be still have to do a test: recompile the kernel with config file men=
tioned
my Grant earlier (the 2.4.20-pa14 for c3k). Do not know if it can help us=

more? I will try and let inform.

Thanks,
    Joel

*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
