Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06551
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Dec 2000 18:22:38 -0700
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Same boot problem on a 9000/720/50 HP machine as
 on 712/60 of Niskanen
In-Reply-To: Your message of "Wed, 27 Dec 2000 02:07:11 +0100."
             <3A4940BF.3EB18F61@dot.at>
References: <3A4940BF.3EB18F61@dot.at> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Dec 2000 18:27:41 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001227012741.A150937C97@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Christoph Plattner writes...

> On my 9000/720 (I have it since one week) I have the same problem
> booting the CD 0.5
> or
> a selfbuild kernel. The kernel boots, but on calling the
> init a trap is called with the text:
> 
> handle_interruption() pid=1 command='init'
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001011
> r0-3     00000000 000c0f38 00033a1b 000c0f3c
> r4-7     000c0f38 ffffffff 00000001 0002a1d8
> r8-11    c02ac640 00000000 00000000 c0145f30
> r12-15   00000000 00000000 00000000 00000000
> r16-19   c027b60c 00000000 c02ac000
> 
> and so on, running in a loop.

Yes, several people(myself included) saw this. IIRC a newer kernel fixes it.

> The code is in kernel/traps.c
> 
> Further I tried to build a statically linked bash-2.03,
> but I had problems setting up the build process to produce
> a HP PARISC user program. What I have to do to setup or
> prepare default source trees for cross building (the
> compiler runs....)

Which compiler are you using? You can grab a prebuilt hppa cross-compiler 
(that runs on i386-linux) at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tar.gz

bash is particularly hard to build. I was able to get the debian package to 
cross compile using the dpkg-cross tool and by making a few changes to the 
source tree. I still need to test the binary, if it works I'll post it.

-- 
Matt Taggart
taggart@fc.hp.com
