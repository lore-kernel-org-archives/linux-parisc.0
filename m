Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id ECB4A4862
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 01:55:27 -0600 (MDT)
Date: Wed, 10 Jul 2002 00:55:25 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability 
In-Reply-To: <20020710053647.D282F4853@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0207100032050.19290-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 9 Jul 2002, Grant Grundler wrote:

> Jeremy Drake wrote:
> > After having read on this list that some SMP-related problems were fixed,
> > I decided to try out the latest kernel as SMP on my J5k.  I tried my old
> > test, apt-get update, on it.  It downloaded the package lists fine, but
> > stopped after printing "Reading Package Lists... 0%".
> 
> It Works For Me. (tm)
> 
> Did you build this kernel yourself or grab a debian kernel package?
> Can you provide "uname -a" output of the SMP kernel you tested?
Oops, I thought I said -pa52.  This is built from the cvs.parisc-linux.org
tree.  I won't be able to get the actual output of uname -a until
tomorrow, but I can guess what it will say: "Linux krakatoa 2.4.18-pa52
SMP #X Tues July 09 14:30:00 PDT 2002 parisc unknown".  Not too sure what
it says for the arch...  I sent my uniproc .config to the list earlier
today, but I can send you the smp one tomorrow if you want it.  I can even
send you the package that make-kpkg made for me, if you want.

I don't really understand what the deal is with SMP on this box, but 
various strange things happen: apt-get update kills it, samba kills it, 
and if I just leave it alone, it dies by itself after a while (I only 
witnessed the apt-get problem with this particular kernel).  I can build 
the kernel happily on it, it's just those certain things that crash it, 
usually after spitting an unaligned access message to the console, and 
sometimes causing an HPMC (the last one I remember was a "runway broad 
error").  I would chalk it up to hardware, because this box has a broken 
onboard USB connector (one is physically damaged and the other quit 
working when the pins in the damaged one got bent around), but I pulled 
the drive and stuck it in another J5k that is not damaged, and is 
virtually identical in configuration to the one I usually use, and it did 
the same thing.

Uniproc is perfectly stable, I have not ever seen it crash.  I just don't
like to let hardware sit unused like that second proc does.  (i have a
486sx25 running linux that I write emails on in pine, and a 286 running
dos and windows 3.1 sitting here on my KVM switch...;)

> > FYI, I've uploaded my a500 build (should work
on j5k as well > if it's using serial console) to:
> 	ftp://ftp.parisc-linux.org/kernels/a500/2.4.18-pa52.tgz
> 
> BTW, before I go to bed tonight, I expect the latest kernel to be -pa54.
> I'll be adding a one-liner sym53c8xx_2 driver patch to allow one to
> use the default CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1.
> One can use sym53c8xx_2 now with CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=0.
> Richard Hirst and Paul Bame (and a few others) have tested this out already.

I will look at the tgz and also cvs update tomorrow when I get in the same 
building with the box, and send uname -a and .config, and also any 
observations I can make of the box when I get to it (any messages on the 
LCD, any ser pim output that it may have, any log messages)...  Next time 
I'll leave a serial console open to it :)

> 
> thanks,
> grant
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
The gates in my computer are AND, OR and NOT; they are not Bill.
