From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 24 Mar 2005 05:07:52 -0800
Message-ID: <20050324130751.GK2485@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

i've been looking at the extreme slowness of ext3 during some workloads.
came across this bit of code... not that it will make any difference,
but i wonder if we can make gcc a bit smarter?

given this bit of C code:

static inline int test_bit(int nr, const void * addr)
{
	const unsigned char *ADDR = (const unsigned char *) addr;
	return (ADDR[nr >> 3] >> (nr & 7)) & 1;
}

int proc1(int nr, int foo)
{
	int ret;
	char *buf1, *buf2;

	if (test_bit(nr, buf1))
		return 0;

	if (foo)
		ret = 1;
	else
		ret = !test_bit(nr, buf2);
	return ret;
}

int proc2(int nr, int foo)
{
	char *buf1, *buf2;

	if (test_bit(nr, buf1))
		return 0;

	if (foo)
		return 1;
	else
		return !test_bit(nr, buf2);
}

i would have expected gcc to produce the same code for proc1() and
proc2() (and in fact it does for 32-bit), but for 64-bit, proc2() is 2
insn shorter than proc1().  it seems like there are also some
opportunities for further optimizations if gcc can recognize that the
return value can only be 0 or 1, so the sign extension (?) extrd insn at
the end is not needed, and we can deposit the result directly into ret0
instead of r20. that should save us 2 insns.

.globl proc2
	.type	proc2, @function
proc2:
	.PROC
	.CALLINFO FRAME=0,NO_CALLS
	.ENTRY
	extrd,s %r26,63,32,%r26
	extrw,u %r26,31,3,%r19
	extrd,s %r25,63,32,%r25
	mtsarcm %r19
	extrd,s %r26,60,61,%r26
	ldb %r26(%r20),%r19
	extrw,s %r19,%sar,32,%r19
	bb,*< %r19,63,.L10
	ldi 0,%r28
	ldi 1,%r28
	cmpb,*<> %r0,%r25,.L10
	ldi 0,%r20
	ldb %r26(%r21),%r19
	extrw,s %r19,%sar,32,%r19
	extrd,s,*< %r19,63,1,%r0
	ldi 1,%r20
	extrd,s %r20,63,32,%r28
.L10:
	bve,n (%r2)
	.EXIT
	.PROCEND

is this worth looking into? :)
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
