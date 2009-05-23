From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Sat, 23 May 2009 16:03:58 -0400 (EDT)
Message-ID: <20090523200359.E57194FA5@hiauly1.hia.nrc.ca>
References: <4A184FCD.90903@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A184FCD.90903@gmx.de> from "Helge Deller" at May 23, 2009 09:34:37 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I mentioned in my original mail that this is not the final version:
> > The patch below is just a hack. It will need a cleanup and is just to open
> > discussions here on the list.
> 
> But instead of cleaning it up right now, I would be very much interested if
> this patch fixes the kernel stalls you see as well?

I can't say that I see kernel stalls on any of my machines.  However,
I do see memory corruption that I have reported a number of times.  I also
see a user/group id bug that also could be a memory corruption bug
(pam cache).  I think there's a good possibility that your patch may
help.

I have a version installed on top of 2.6.30-rc6 on my rp3340.  I haven't
done a lot of testing with it, but it boots and I have done one kernel
build with it.  Didn't include lock in macro as you show below.

I was looking a couple of the warnings:
arch/parisc/kernel/time.c:184: warning: initialization from incompatible pointer type
arch/parisc/kernel/irq.c:123: warning: passing argument 1 of 'cpumask_setall' from incompatible pointer type
arch/parisc/kernel/irq.c:141: warning: passing argument 1 of 'cpumask_copy' from incompatible pointer type
arch/parisc/kernel/irq.c:300: warning: passing argument 1 of 'cpumask_copy' from incompatible pointer type
arch/parisc/kernel/irq.c:357: warning: passing argument 2 of 'cpumask_copy' from incompatible pointer type

The first is due to the missing argument in read_cr16.  I believe a fix
was posted to the list.

The latter warnings seem due to a change in the type of the affinity field
of the irq_desc struct.

> If it does, then I agree that we should add a "flags" argument to purge_tlb_xxx() functions, e.g.
> - purge_tlb_start(lock, flags) 
> - purge_tlb_end(lock, flags)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
