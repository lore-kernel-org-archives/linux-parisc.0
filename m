Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA11036
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Sep 2000 13:06:28 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 29 Sep 2000 19:07:18 -0000
Received: from dhd by tarwebok with local (Exim 3.12 #1 (Debian))
	id 13f5VJ-00018b-00
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Sep 2000 15:07:29 -0400
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] floating point exception error
References: <20000927195500.57241381CD@carmen.fc.hp.com>
	<873dilo9dp.fsf@tarwebok.i-did-not-set--mail-host-address--so-shoot-me>
	<87snqk1q2o.fsf@linuxcare.com> <87hf6znjc7.fsf@ottawa.linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 29 Sep 2000 15:07:29 -0400
In-Reply-To: David Huggins-Daines's message of "29 Sep 2000 14:28:40 -0400"
Message-ID: <87bsx7nhji.fsf@ottawa.linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> GAR!  So the problem is obvious.  Not only is GCC emitting the wrong
> comparison condition (<> vs. !=), but log(-8.0) is returning a
> signalling NaN on GNU/Linux, and a quiet one on HP/UX:

And yet, not so obvious.

According to the glibc documentation and comments, the GNU libm's
behaviour is correct and the HP/UX behaviour is not.

However, that's okay, because according to the glibc documentation,
the defined IEEE exceptions (the VZOUI bits in the status register)
should *not* cause SIGFPE by default, but should simply set the
appropriate flag bits in the status register.  This is consistent with
the behaviour of IEEE compliant floating point on all other GNU/Linux
platforms.

And, guess what, the register dump from the floating point exception
trap handler on Linux *clearly* shows that invalid traps are *not*
enabled in the status word (!!).

This program:

#include <signal.h>
#include <math.h>

double
div_by(x,y)
   double x ;
   double y ;
{
   return x/y ;
}

double overflow(x)
   double x ;
{
   double y ;

   do
   {
      y = x ;
      x *= x ;
   } while( y != x ) ;
   return x ;
}

int main()
{
	union {
		double d;
		unsigned long long l;
	} foo;

	div_by(30.0, 0.0);
	overflow(1000.0);

	foo.d = log(-8.0);
	printf("foo.l is %016llx\n", foo.l);
	sleep(1);
	if (foo.d == foo.d)
		return 1;

	return 0;
}

Generates the following output on my A180 (with my patch to traps.c to
show floating point status and exceptions):

avalanche:~# ./fptest3
foo.l is 7fffffffffffffff
!!die_if_kernel: fptest3(154): Floating point exception 14

PSW  : 0004ff0a  GR 1 : fffff000  GR 2 : 000015db  GR 3 : 20020100  
GR 4 : 40160600  GR 5 : 0000279e  GR 6 : 000027b6  GR 7 : 00000001  
GR 8 : 00002786  GR 9 : 000a5810  GR10 : 000afcd0  GR11 : 000afe50  
GR12 : 00000000  GR13 : ffffffff  GR14 : 000afdd0  GR15 : 00000000  
GR16 : 000914d0  GR17 : 00000001  GR18 : 20020128  GR19 : 40160600  
GR20 : 000000a2  GR21 : 00000000  GR22 : 00000001  GR23 : 00000008  
GR24 : 00000000  GR25 : 20020188  GR26 : 20020188  GR27 : 00002758  
GR28 : 00000000  GR29 : 00000300  GR30 : 20020180  GR31 : 4006d4df  
SR0  : 00000000  SR1  : 00002002  SR2  : 00000000  SR3  : 00002002  
SR4  : 00002002  SR5  : 00002002  SR6  : 00002002  SR7  : 00002002  

IASQ : 00002002 00002002 IAOQ : 000015e7 000015eb ORIG_R28 : 00000000
 IIR : 30002420 ISR : 00002002 IOR : 20020108

Floating point status/exception:

FR0: ec30004000000000
FR1: 26f60c1900000000
FR2: 0000000000000000
FR3: 0000000000000000
Floating point exception

The value of FR0L above can be read as:

  flag                                                 enable

V Z O U I C . . . . . . . . . . . . . . .  RM . . T D V Z O U I

1 1 1 0 1 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0

|  E   |   C   |   3   |   0   |   0   |  0    |   4   |   0  |

As you can see, the I enable bit is zero (so we should NOT have
trapped here according to the architecture manual), the T bit is on
(because obviously we *have* trapped), and the V, Z, O, and I flags
are also on (because we had previously triggered overflow,
div-by-zero, and invalid exceptions).

I have no idea why the exception shows up in FR1L instead of in FR0R
(pipeline mysteries I guess), but anyway that value can be read as:

|  2   |   6   |   F   |   6   |   0   |  C    |   1   |   9  |

0 0 1 0 0 1 1 0 1 1 1 1 0 1 1 0 0 0 0 0 1 1 0 0 0 0 0 1 1 0 0 1

  exc      |              non-opcode bits of instruction

This corresponds to the following instruction:

    15e0:       32 f6 0c 19     fcmp,dbl,<> fr23,fr22,

As you can see GCC has generated a trap-on-unordered comparison
condition (<>) here.  The HP compiler generates the != condition
instead.  However if I hex-edit the binary to change the condition:

    15e0:       32 f6 0c 1a     fcmp,dbl,!= fr23,fr22,

Then I still get a trap!

Well, on reflection, I notice that the high 6 bits indicate an
Unimplemented exception with opcode 0xC.  Yes, "Unimplemented", not
"Invalid".  WTF!

So, are unordered comparisons just not handled by the 7300LC?  Which
processors are they handled correctly on, if any?  Is there any HP
documentation on this?  Are there any HP/UX architects in the house? :)

It looks like we are going to need some floating-point completion
support in the kernel, which evidently is going to involve walking the
trap shadow and other fun things I thought you only had to do on DEC
machines ;)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
