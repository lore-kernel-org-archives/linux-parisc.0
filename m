Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA15966
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 07:08:22 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 24 Oct 2000 13:09:50 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA13675;
	Wed, 25 Oct 2000 00:09:29 +1100
Date: Wed, 25 Oct 2000 00:09:29 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Stoyan Zoubev <s_zoubev@prosyst.bg>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Error building binutils
In-Reply-To: <010401c03dbe$7954b910$0bcea8c0@psb>
Message-ID: <Pine.LNX.4.21.0010250004280.11525-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 24 Oct 2000, Stoyan Zoubev wrote:

> Hi, 
> 
> I am trying to build the linux kernel for HP PA-RISC target on an Intel-based Linux machine, following the instructions in "Getting started with Linux/PARISC: How to Build the Toolchain":
> I am using binutils-2.10, gcc-2.95.2, glibc-2.1.3. And when I run

None of these versions have the support you need for pa-linux.

> 
> <path to binutils sources>/configure --host=i386-linux --prefix=/opt/parisc -- \         target=hppa-linux --enable-targets=hppa64-linux --disable-nls
> 
> I get the following error: 
> ...
> *** BFD does not support target hppa64-linux.
> *** Look in bfd/config.bfd for supported targets.
> Configure in /home/zoubev/build/binutils/opcodes failed, exiting.
> 
> Can someone explain me what the problem is? Do I have to download binutils-latest.tar.gz, gcc-latest.tar.gz, glibc-latest.tar.gz from ftp://puffin.external.hp.com?

Yes.

-- 
Linuxcare.  Support for the Revolution.
