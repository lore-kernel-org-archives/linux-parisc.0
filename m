From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 24 Mar 2005 15:33:46 -0700
Message-ID: <20050324223346.GE29361@colo.lackof.org>
References: <20050324212317.GB29361@colo.lackof.org>
	<200503242133.j2OLXl4R020985@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503242133.j2OLXl4R020985@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Mar 24, 2005 at 04:33:46PM -0500, John David Anglin wrote:
> > > 4.0 has a
> > > new option, -mfixed_range=, that was introduced so that a small range
> > > of fp registers could be used for the xmpyu multiplication insn.  It
> > > might be useful to experiment with this option to see if it useful.
> > 
> > I don't know enough about ABI to understand the issues here.
> > AFAIK, we currently are using FP registers because that's
> > the way multiplication is implemented in the integer math libs
> > we inherited.
> 
> No.  Currently in kernel builds, the use of FP registers is completely
> disabled and integer multiplication is done using the millicode library.

Erm...objdump disagrees:
grundler <541>hppa64-linux-objdump -rD vmlinux | fgrep xmpy | wc
   1654   11578   82683

First occurance is here:
000000001010bca0 <__muldi3>:
    1010bca0:   37 de 00 80     ldo 40(sp),sp
    1010bca4:   db 56 07 e0     extrd,s r26,31,32,r22
    1010bca8:   73 d6 3f 91     std r22,-38(sp)
    1010bcac:   53 d6 3f 93     fldd -38(sp),fr22
    1010bcb0:   73 d9 3f 91     std r25,-38(sp)
    1010bcb4:   53 d7 3f 93     fldd -38(sp),fr23
    1010bcb8:   3a d7 57 96     xmpyu fr22R,fr23R,fr22
    1010bcbc:   d3 53 1b f0     extrw,u r26,31,16,r19
    1010bcc0:   73 d6 3f 93     fstd fr22,-38(sp)
    1010bcc4:   53 d6 3f 91     ldd -38(sp),r22
...

objdump output is on still on gsyprf11:/tmp/2.6.12-rc1-objdump
In case you want to browse it more.

> However with a few FP regs, integer multiplication (32 bit) can be
> done in hardware except of course on machines that don't have FP
> hardware.  The downside is that the kernel has to save whatever
> FP registers it uses.

Yeah, I thought that was happening already.
I'm hoping "save_fp         %r25" in arch/parisc/kernel/entry.S
takes care of that.

> The -mfixed_range= option "fixes" a range if registers.  GCC won't
> use registers that are fixed.

Yeah, it might make sense to "document" current usage
and limit which FP regs the kernel can use. Ie we
could reduce FP state that needs to be save when
entering the kernel. Context switch would need to save
the rest.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
