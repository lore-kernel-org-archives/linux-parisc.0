Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Tue, 09 Jul 2002 19:40:52 PDT." <Pine.LNX.4.44.0207091919340.19290-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0207091919340.19290-100000@garibaldi.apptechsys.com> 
Date: Tue, 09 Jul 2002 23:36:47 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020710053647.D282F4853@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> After having read on this list that some SMP-related problems were fixed,
> I decided to try out the latest kernel as SMP on my J5k.  I tried my old
> test, apt-get update, on it.  It downloaded the package lists fine, but
> stopped after printing "Reading Package Lists... 0%".

It Works For Me. (tm)

Did you build this kernel yourself or grab a debian kernel package?
Can you provide "uname -a" output of the SMP kernel you tested?

FYI, I've uploaded my a500 build (should work on j5k as well
if it's using serial console) to:
	ftp://ftp.parisc-linux.org/kernels/a500/2.4.18-pa52.tgz

The -pa52 kernel built 100+ kernels/modules successively until
I stopped it on the a500-44. The same kernel on a500-6X (PA8700)
crashes after 12 or so hours of building gcc bits. I've also seen
eth0 (tulip driver) spontaneously go to an unconfigured state
without saying anything on the console. It's possible a cron job
or something else ifdown'd it but I don't know why.

BTW, before I go to bed tonight, I expect the latest kernel to be -pa54.
I'll be adding a one-liner sym53c8xx_2 driver patch to allow one to
use the default CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1.
One can use sym53c8xx_2 now with CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=0.
Richard Hirst and Paul Bame (and a few others) have tested this out already.

thanks,
grant
