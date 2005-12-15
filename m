From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Unknown FPU exception, help needed, please decode.
Date: Fri, 16 Dec 2005 07:54:59 +0800
Message-ID: <43A20253.6080408@tausq.org>
References: <20051215192204.GE1298@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051215192204.GE1298@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> arch/parisc/math-emu/decode_exc.c(351) Unknown FPU exception 0x23
> arch/parisc/math-emu/decode_exc.c(351) Unknown FPU exception 0x23
> ...
> 
> Could someone please decode the FPU exception and tell me if the kernel
> is doing the right thing?

 From page 10-3 in the PA2.0 arch book, this seems to be the 
"unimplemented" exception.

Pages 10-8 and 10-9 goes on to say:
A conversion to a floating poiint format always causes an unimplemented 
exception when the result overflows, the result lies too far outside the 
range for the exponent to be bias-adjusted, and the overflow trap is 
enabled. [...]

Similarly, an unimplemented exception is always caused by a conversion 
to a floating-point format that underflows, lies too far outside the 
range for the exponent to be bias-adjusted, and the underflow trap is 
enabled.  [...]

Finally, the unimplemented exception is always signaled when the operand 
of a conversion to an integer format is a NaN. Low-level trap handlers 
may choose to silently deliver a result or convert it to an invalid 
exception.

Do any of these apply to your test case?

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
