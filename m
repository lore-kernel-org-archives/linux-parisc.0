From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 16:13:56 -0400
Message-ID: <20050716201356.GJ5314@systemhalted.org>
References: <20050716191646.GH5314@systemhalted.org>
	<200507161948.j6GJmAvc010734@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507161948.j6GJmAvc010734@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 16, 2005 at 03:48:10PM -0400, John David Anglin wrote:
> > What sort of dependancy on CCFP? Do you have an example somewhere?
> 
> No.
> 
>   If your assembler instruction can alter the condition code register, add
>   @samp{cc} to the list of clobbered registers.  GCC on some machines
>   represents the condition codes as a specific hardware register;
>   @samp{cc} serves to name this register.  On other machines, the
>   condition code is handled differently, and specifying @samp{cc} has no
>   effect.  But it is valid no matter what the machine.
> 
> Thinking a little more, I believe specifying "r0" in the clobber list
> of the asm will do the job.  Register 0 is used to hold condition codes
> for both integer and floating point comparisons.  I don't think there's
> a way to express that the register is only used.  There's no constraint
> letter for r0, etc.

Will this ever happen during inlining?

fstd chain -> memory
operation 1
			fstd chain -> memory
fldd chain -> regs
			operation 2
			fldd chain -> regs

Operation 2 could trap when expected that it couldn't because the fstd
had cleared the traps.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
