From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Re: Next step in glibc test math failures analysis ;
	-)
Date: Sun, 14 May 2006 17:34:01 -0400
Message-ID: <119aab440605141434s1090ffb5k5322d14d3d959da8@mail.gmail.com>
References: <IZ03Y4$9E8A6266AB8A578EB25FE5A0BE2593A0@scarlet.be>
	<119aab440605091805q741bba07i3d50aee4299e6d82@mail.gmail.com>
	<44671D41.6010401@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44671D41.6010401@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> So my next question is: is some of you know a similar implementation of c=
acosf()?
> or what would be the results of cacosf() for various limit figure with na=
n, 0.0 and infinity?

Is the problem the setting of the V-bit by the operation?

The value of  "cacos (inf + NaN i)" is  "NaN + inf i", the problem is
that after the test the processor has turned on the V bit to indicate
that the operation is invalid.

In 10-9 of the PA 2.0 book there is a complete description of what
should and should
not trigger an "invalid" exception.

Do we have a case of:
1. Any arithmetic operation on a signaling NaN except for conversion
to integer formats.
2. Magnitude subtraction of intinities like (+inf + -inf)
3. Multiplication of 0 and inf
4. The division operations 0/0 and inf/inf
5. Square root if the operand is less than zero
6. Inproper comparison operations
7. Conversion to integer format as in table 10-6.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
