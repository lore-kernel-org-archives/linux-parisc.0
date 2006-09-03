From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 3 Sep 2006 16:30:22 -0400
Message-ID: <119aab440609031330i70b208cat9f347fe2ed6e8b52@mail.gmail.com>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<119aab440608311152m28ef65f6ud3db46b12c59d3@mail.gmail.com>
	<20060831214650.GC16032@colo.lackof.org>
	<119aab440609030754t5e0f869bq10b5c10770f14105@mail.gmail.com>
	<20060903195553.GC20217@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060903195553.GC20217@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 9/3/06, Grant Grundler <grundler@parisc-linux.org> wrote:
> I'll rework my code later today to try to match the discussion so far.

Original code:

 58         now = mfctl(16);
 60         next_tick = cpu_data[cpu].it_value;
 70         nticks = 0;
 71         while((next_tick - now) < halftick) {
 72                 next_tick += clocktick;
 73                 nticks++;
 74         }
 75         mtctl(next_tick, 16);
 76         cpu_data[cpu].it_value = next_tick;

1. Let us assume a 32-bit CPU with a 32-bit counter and a 32-bit
trigger register.
2. Assume that it_value is *near* the signed long boundary (0x7fffff)
3. The counter and trigger match, raising an interrupt.
4. During the interrupt delivery cr16 wraps into negative signed long,
but only a little bit.
    Let us say cr16 is ~(0x7fffffff + 50)
5. The value "next_tick - now" is equivalent to:
    "next_tick - (-now)" since now is negative.
    "next_tick + now"
6. The signed long math wraps, and the solution is a small negative
number, or small positive number, in this case it is +48.
7. The while loop adds clockticks until we are positive and bigger
than halftick. Adding 1 clocktick.

The signed math works correctly as an approximation (off by 2) and I
do admit I find no fault in the math, but it is still confusing.

However, as James points out, if the *real* cr16 gets ahead of the
newly set it_value, by delaying this function due to other interrupts,
then we will have to wait for a full wrap to have it trigger another
timer interrupt.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
