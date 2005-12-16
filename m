From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Unknown FPU exception, help needed, please decode.
Date: Thu, 15 Dec 2005 20:13:18 -0500
Message-ID: <20051216011318.GL1298@baldric.uwo.ca>
References: <20051215192204.GE1298@baldric.uwo.ca> <43A20253.6080408@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43A20253.6080408@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 16, 2005 at 07:54:59AM +0800, Randolph Chung wrote:
> >arch/parisc/math-emu/decode_exc.c(351) Unknown FPU exception 0x23
> >arch/parisc/math-emu/decode_exc.c(351) Unknown FPU exception 0x23
> >...
> >
> >Could someone please decode the FPU exception and tell me if the kernel
> >is doing the right thing?
> 
> From page 10-3 in the PA2.0 arch book, this seems to be the 
> "unimplemented" exception.

Cool, I assume it should print "Unimplemented" exception instead of
"Unknown."
 
> Pages 10-8 and 10-9 goes on to say:
> A conversion to a floating poiint format always causes an unimplemented 
> exception when the result overflows, the result lies too far outside the 
> range for the exponent to be bias-adjusted, and the overflow trap is 
> enabled. [...]

Might have some of this.

> Similarly, an unimplemented exception is always caused by a conversion 
> to a floating-point format that underflows, lies too far outside the 
> range for the exponent to be bias-adjusted, and the underflow trap is 
> enabled.  [...]

Might have some of this.

> Finally, the unimplemented exception is always signaled when the operand 
> of a conversion to an integer format is a NaN. Low-level trap handlers 
> may choose to silently deliver a result or convert it to an invalid 
> exception.

Might have some of this.

> Do any of these apply to your test case?

It's the glibc fp testsuite. We test for a lot of things, I need to
narrow down the insn sequence causing the exception.

I've never seen this print before. Atleast not with the older
sysdeps/hppa/fpu/* bits in place.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
