From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Sat, 26 Mar 2005 14:35:05 -0700
Message-ID: <20050326213505.GA9287@colo.lackof.org>
References: <16965.9081.148972.856329@gargle.gargle.HOWL>
	<200503261548.j2QFm7eL005849@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503261548.j2QFm7eL005849@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 26, 2005 at 10:48:06AM -0500, John David Anglin wrote:
> I've had this problem from time to time, particularly on server
> machines.  My c3k is solid and this doesn't happen.  For some reason,
> the libjava build is most prone to the segfaults in sh/bash and
> sometimes make.  Grant's recent builds on gsyprf11 seem to have
> changed the nature of the faults.

The Astro chipset IOC_CTRL register was being programmed differently
by each firmware. The workstation firmware was more conservative.
I've aligned the chipset programming and it seems to have helped
on the a500 with this change:
	http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2005-February/035337.html

>   Now, the kernel panics instead
> of a segfault in sh.  Grant would know more as to what's causing
> these crashes.

Yeah, we are still seeing this a few times per month too. :^(
I don't understand the copy_user_page_asm/do_dp_write data page fault.
But I'm no VM guru either. Randolph thinks the parameter regs look
valid in the tombstone.

> > - The libjava build sometimes fails with an sh/bash error. Restarting
> >   the build usually fixes this.
> 
> :(  I've been hoping that some of these issues are caused by the put_user
> problem.

The Astro change above should stabilize it a bit better.
Please try a 2.6.11-pa[34] (or later) kernel.

Similarly on pa8800, for kernel builds gcc/make/et al will segfault
and gcc sometimes claims internal errors.
It stinks like a chipset/cache coherency issue but I don't see it.
jejb isn't seeing any that might be related to VIVT cache either.

My suspicion is we still have a bug outstanding that is causing
register corruption - similar to the GR26 corruption you found
last December. I've written builds-tools/regtest.c to try
to capture the corruption from the user space side but
it's not working:
	http://cvs.parisc-linux.org/build-tools/regtest.c

I'd like to extend that test to also cover FP regs.
Maybe after debugging ext2_find_next_zero and debugging
why mpt (u320 SCSI) HPMCs on module load.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
