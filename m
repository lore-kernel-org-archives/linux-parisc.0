From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Fri, 15 Jul 2005 21:14:33 -0400
Message-ID: <20050716011432.GD5314@systemhalted.org>
References: <20050715234448.GA5314@systemhalted.org>
	<200507160008.j6G08hdg005634@hiauly1.hia.nrc.ca>
	<20050716005715.GC5314@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050716005715.GC5314@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 15, 2005 at 08:57:15PM -0400, Carlos O'Donell wrote:
> I don't quite understand how something like "fpclassify" can *ever* fail
> under any implementation.
> 
> Could you review these files:
> http://cvs.parisc-linux.org/glibc/sysdeps/hppa/fpu/
> 
> With an eye to correct asm statement? If these don't work then it all
> goes down the tubes. I'm sure gcc is probably doing the right thing and
> that asm is doing the wrong thing.

I think gcc is to blame, or the constraints in the assembly?

--- GCC 4.0 ---

0x40349890 <feclearexcept+0>:   ldo 40(sp),sp
0x40349894 <feclearexcept+4>:   ldo -38(sp),ret0
0x40349898 <feclearexcept+8>:   stw r19,-20(,sp)
0x4034989c <feclearexcept+12>:  fstd fr0,0(,ret0)
0x403498a0 <feclearexcept+16>:  fldd 0(,ret0),fr0
0x403498a4 <feclearexcept+20>:  ldi 0,ret0
0x403498a8 <feclearexcept+24>:  bv r0(rp)
0x403498ac <feclearexcept+28>:  ldo -40(sp),sp

Notice that it thinks the argument is on the stack? Are the assembly
constraints confusing gcc?

The above is competely bogus.

--- GCC 3.3.5 ---

00000000 <feclearexcept>:
   0:   37 de 00 80     ldo 40(sp),sp
   4:   d7 5a 0b 7b     depw,z r26,4,5,r26
   8:   6b d3 3f c1     stw r19,-20(,sp)
   c:   37 d4 3f 91     ldo -38(sp),r20
  10:   2e 80 12 00     fstd fr0,0(,r20)
  14:   4b d5 3f 91     ldw -38(,sp),r21
  18:   0b 55 00 1a     andcm r21,r26,r26
  1c:   6b da 3f 91     stw r26,-38(,sp)
  20:   2e 80 10 00     fldd 0(,r20),fr0
  24:   34 1c 00 00     ldi 0,ret0
  28:   e8 40 c0 00     bv r0(rp)
  2c:   37 de 3f 81     ldo -40(sp),sp

This one properly loads the value from r26.
This one works.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
