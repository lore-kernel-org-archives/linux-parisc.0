From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: review sg_format
Date: Fri, 11 Mar 2005 10:39:29 -0700
Message-ID: <20050311173929.GA15070@colo.lackof.org>
References: <4210A33A.5020004@torque.net>
	<1110428346.17563.89.camel@bluto.andrew>
	<423006B1.2030008@torque.net>
	<20050311064021.GA7208@colo.lackof.org>
	<42314D8B.1080202@torque.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Douglas Gilbert <dougg@torque.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42314D8B.1080202@torque.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 11, 2005 at 05:49:31PM +1000, Douglas Gilbert wrote:
> >The problem is with the asm/unistd.h header file that comes from
> >the debian kernel-headers-2.4.26 package.

I think I'm wrong about this - I should be using "linux-kernel-headers"
package like on gsyprf3. Below is more analysis on the problem.

Bottomline: My guess is we could modify asm-parisc syscall
  to be "-std=c99" friendly. I'd like to hear other peoples
  opinions on that.

> >Linue 46 of llseek.c is static decl of _syscall5
> >and that collides with the "#define _syscall5"
> >in asm/unistd.h. The same #define is in our current 2.6 kernel
> >(see gsyprf11:/usr/src/linux-2.6/include/asm/unistd.h).
> >All the asm-*/unistd.h have this #define. 

...and _syscall5 is just a "victim".

> Grant,
> Thanks for picking that up. That llseek.c has an "asm"
> keyword in it which isn't kosher C90 nor C99 . So the
> "-pendantic" adds some warnings and the "-std=c99"
> promotes them into errors.

Hrm...I've generated the pre-processed file on
	gsyprf11:/usr/src/sg3_utils-1.13/llseek.P

The offending code is coming from K_INLINE_SYSCALL() macro
that's defined in asm/unistd.h.
I expect Line 1754 is the offending one.
I've reformatted below so it's readable:

static int _llseek(unsigned int fd, unsigned long offset_high,
	 unsigned long offset_low, llse_loff_t * result, unsigned int origin)
{
	return (
	{ unsigned long __sys_res;
	{ register unsigned long __res asm("r28");
	register unsigned long __r22 __asm__("r22") = (unsigned long)origin;
	register unsigned long __r23 __asm__("r23") = (unsigned long)result;
	register unsigned long __r24 __asm__("r24") = (unsigned long)offset_low;
	register unsigned long __r25 __asm__("r25") = (unsigned long)offset_high;
	register unsigned long __r26 __asm__("r26") = (unsigned long)fd;
	asm volatile(	"ble  0x100(%%sr2, %%r0)\n\t"
			" ldi %1, %%r20"
			: "=r" (__res)
			: "i" ((0 + 140)) , "r" (__r26), "r" (__r25), 
				"r" (__r24), "r" (__r23), "r" (__r22) );
	__sys_res = __res;
	}
	if (__sys_res >= (unsigned long)-4095) {
		(*__errno_location ()) = -__sys_res;
		 __sys_res = (unsigned long)-1;
	}
	__sys_res;
	}
	);
} 

If "asm" is the only offending bit, can that be fixed in the kernel
header files and/or submit a patch against glibc header files so
that future releases can be compiled with "-std=c99"?

Looking at code in llseek.c inside the #ifdef __linux__, a few things
strike me as odd:
o None of the architectures in recent 2.4 or 2.6 kernel define HAVE_LLSEEK.
  This looks obsolete because all linux arches support llseek now.

o Why the #if alpha || ia64 || s390x to use a private my_llseek wrapper?
  "my_llseek" also seems obsolete like HAVE_LLSEEK.
  Are they the only ones to NOT define llseek because they only have
  64-bit user space? (ie lseek is a synonym to llseek for those three?)

  FWIW,  I added defined(__hppa__) to the #if and it properly linked.
  sg_dd seems to work correctly but I'm certain I'm not excercising the
  code properly (e.g. testing syscall restart) or able to verify the results.
  And I've also not tested on older (2.4) kernels where other things
  might be broken.


> I built the latest util-linux
> on gsyprf11 (llssek.c is in the fdisk directory) and it
> went ok (until I added "-std=c99" to llseek.c's compile
> line).

ok. But I still wonder if parisc port needs to change anything.

> Just rolling two new versions:
>    sg3_utils-1.13.tgz    [without "-pedantic -std=c99"]
>    sg3_utils-1.13-pedantic.tgz  [with "     "]
> 
> They will be on gsyprf3 (which has no problem with llseek.c)
> + gsyprf11 shortly.

AFAICT, gsyprf3 builds/links fine because my_llseek gets used
instead of unistd.h.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
