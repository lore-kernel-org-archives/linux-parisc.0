From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 14:38:28 -0400
Message-ID: <20050716183827.GF5314@systemhalted.org>
References: <20050716011432.GD5314@systemhalted.org>
	<200507160154.j6G1sPI0006203@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507160154.j6G1sPI0006203@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 15, 2005 at 09:54:25PM -0400, John David Anglin wrote:
> > I think gcc is to blame, or the constraints in the assembly?
> > 
> > --- GCC 4.0 ---
> > 
> > 0x40349890 <feclearexcept+0>:   ldo 40(sp),sp
> > 0x40349894 <feclearexcept+4>:   ldo -38(sp),ret0
> > 0x40349898 <feclearexcept+8>:   stw r19,-20(,sp)
> > 0x4034989c <feclearexcept+12>:  fstd fr0,0(,ret0)
> > 0x403498a0 <feclearexcept+16>:  fldd 0(,ret0),fr0
> > 0x403498a4 <feclearexcept+20>:  ldi 0,ret0
> > 0x403498a8 <feclearexcept+24>:  bv r0(rp)
> > 0x403498ac <feclearexcept+28>:  ldo -40(sp),sp
> 
> PR time.  Please add danglin@gcc.gnu.org to the CC list.
> 
> > Notice that it thinks the argument is on the stack? Are the assembly
> > constraints confusing gcc?
> 
> Probably, but its not clear at the moment.  I think the asm's need
> the volatile keyword as they have side effects that aren't known to
> gcc (i.e., scheduling might move a floating point operation past
> the asm's should the functions be inlined.

I hadn't considered the effects of rescheduling. I guess this can happen
to any code between the asm statements.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
