From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] Should I read SHR[DW] as SHRP[DW] in parisc2.pdf?
Date: Fri, 13 Aug 2004 17:54:29 -0500
Message-ID: <200408131754.29746.mszick@goquest.com>
References: <40FB9ACA0000BB69@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40FB9ACA0000BB69@ocpmta1.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed August 11 2004 12:35, Joel Soete wrote:
> Hi all,
> 
> About parisc 2.0 insn set at pages 7-49 and 7-51 I read SHRD,S,cond ...
> and SHRW,S,cond ... but I don't find this mnemonic elsewhere in this book;
> should I better read SHRPD and SHRPW respectively (mnemonic well defined)?
> 
Write as 'shd' either parisc-1.x or parisc-2.x for 32-bit operations.
I cut & pasted an example into a test source file, compiled (32 & 64),
objdump'd the *.o, then with the help of a hex-editor and
my Captain Midnight Decoder ring on the results:
	__asm__(
	"	ldi		0,%1\n"

/* compile & objdump the *.o; both 32-bit and 64-bit */
	"	shd		%%r0,%0,16,%2\n"	
	"	extru,=	%2,15,16,%%r0\n"	

/* Yields (see parisc2.0.pdf, appendix 'C'):
32-bit:
major op-code: 34, op-code extension: 011 (3)
  5c:   d2 80 09 f4     shrpw r0,r20,16,r20

major op-code: 34, op-code extension: 111 (7)
  60:   d2 80 39 f0     extrw,u,= r20,15,16,r0

Also on 64-bit, the identical bit pattern:
  80:   d2 80 09 f4     shrpw r0,r20,16,r20
  84:   d2 80 39 f0     extrw,u,= r20,15,16,r0

Then checking chapter 7 on 'shrpw' it very clearly
states that this instruction effects only the right
half of the registers. (no mention of left half)

Then checking chapter 7 on 'extrw' and it states
that the coded bit-position-number is internally
incremented by 32 so that it actually refers to (in
this example) pos=15+32, len=16.
(Claims left half is 'undefined')

Which means that 'int fls(int x)' as written would 
get its bit-position-numbers translated internally.
(and my earlier posting about it scanning the high
32 bits was wrong).

I still haven't figured out how the author gets that
the last bit to test is #0 rather than #31 - but then
that might be a typo in the code or another thinko
in my reasoning.
*/

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
