Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "James Braid" <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dodgy SCSI in L2000 
In-Reply-To: Message from "James Braid" <james.braid@peace.com>
   of "Tue, 07 May 2002 17:28:13 +1200." <006001c1f587$fbc0c830$5e01000a@bongo>
References: <006001c1f587$fbc0c830$5e01000a@bongo> 
Date: Tue, 07 May 2002 00:21:18 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020507062119.F0744482A@dsl2.external.hp.com>
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

"James Braid" wrote:
> Okay, I have got my RAID array working now :-)
> 
> BUT...

Which kernel version?


> In the window I have open to the GSP (in a console session) on the
> L2000, I see this:
> 
> sym4:0:0: ABORT operation started.
> sym4:0:0: ABORT operation timed-out.
> sym4:0:0: ABORT operation started.
> sym4:0:0: ABORT operation timed-out.
...

This suggests something is wrong with that device.
Are all RAID0 disks internal? Or connected to external box?
I see further down they seem to be working fine individually.

...
> It also does the same thing using the sym5c8xx version 1 driver as well
> as the version 2 driver (the above errors are from the version 2
> driver).

Can you post lspci -v output from you L2000?
I just want to verify the built-in SCSI chips are the
same as on my A500: sym53c896.

...
> One thing I have noticed with mke2fs is that the indode table numbers
> tick away pretty fast until it gets to 205, then it slows down big time,
> and then it speeds up again until it gets to ~340, at which point the
> scsi ABORT errors will sometimes start happening.

I noticed the slow down/speed up when I built the RAID0 on the B180 as well.
No idea what causes it though.

> I have tested all the disks individually (making filesystems, running
> dbench), and the filesystems get made fine, and dbench works okay up to
> about 100 odd clients.

Can you try running two different dbench instances at the some time on
two different disks?

I had to steal the serial port from my A500 or I could do more
to at least reproduce this.

> I have *no* idea what is causing any of this....anyone else have any
> hints/info/fixes for this problem? (Sorry for the long email, but I
> figured it would be best to paste the full errors)
> 
> I can provide clarification or more details if needed.
> 
> Cheers, James
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
