From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] BUG maxcpus=1 still sees 2 CPUs
Date: Sun, 5 Dec 2004 00:46:13 -0800
Message-ID: <20041205084613.GU6359@tausq.org>
References: <20041205064112.GA10169@colo.lackof.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041205064112.GA10169@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> It's late and I won't have a chance to chase this bug I just noticed
> when trying to boot 2.6.10-rc3-pa1 (64bit, SMP) kernel on a500.

fwiw that kernel booted on ios (a500 with 2xpa8500 @ 440mhz)

> I set "maxcpus=1" and still get the following output:
> CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
> Setting cache flush threshold to 231180 (1 CPUs online)

right, since that is an inventory message, and we still inventory all
the cpus, it will report all the available CPUs.

> I'm thinking that while two CPUs are present, only
> one is "online", it doesn't feel right to report both
> in the first line above. Is this expected behavior
> or should we be indicating something like
> 	CPU(s): 1 (of 2) x PA8500 (PCX-W) at 440.000000 MHz

we could do that easily enough if you think it's better...

> Other issues:
> o the box is hanging after sym2 resets the SCSI bus.
>   My first guess is something is wrong with interrupt delivery.

yes, that would explain this as well:
> o omitting "maxcpus=1", the box will hang for about 60 seconds
>   after printing the inventory. And then prints:
> 	Releasing cpu 1 now, hpa=fffffffffffa2000
>   and continues on to the SCSI bus resets.

that sounds like we timed out bringing up the 2nd cpu, altho if that
happened i would have expected an error message. if the 2nd cpu is not
processing interrupts, and we are assigning some of the interrupts to
the 2nd cpu, then the scsi bus resets will fail. you can try forcing
all the irqs to cpu0 and see if that lets the box boot....

> I have tried both gcc 3.0.4 and 3.3.4 (hppa64 versions) with the
> same results (AFAICT).

currently i'm using gcc-3.4.2 to build the kernel on ios, but in the
recent past i've tried 3.0.4 and 3.3.4 and both worked (but that was 
on -rc2)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
