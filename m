Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9C904829
	for <parisc-linux@parisc-linux.org>; Fri, 10 Jan 2003 23:12:49 -0700 (MST)
Date: Fri, 10 Jan 2003 22:16:38 -0800
From: Randolph Chung <randolph@tausq.org>
To: Jim Hull <jim.hull@hp.com>
Cc: 'John David Anglin' <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: floating point exception error
Message-ID: <20030111061638.GH31470@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200301101848.h0AImToB004181@hiauly1.hia.nrc.ca> <005c01c2b8f7$e79cc8c0$6763f40f@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <005c01c2b8f7$e79cc8c0$6763f40f@cup.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Ok, that's good to hear.  Your info, along with Randolph's info that it
> traps on the 8500, 8600, and 8700 CPUs, leads me to the same conclusion
> as Randolph came to.  It looks like there's something wrong with the
> fcnv emulation in the linux kernel's emulation handler, even though it
> was derived from the hpux handler, where everything appears to work
> fine.

I think i found it....

for class 1 ops (fcnv) pa20 has a 3-bit subop field, pa11 has a 2-bit
subop field, which determines the source/target formats. our code is not
correctly determining pa11 vs pa20, so it defaults to pa11 and uses
subop==1 instead of subop==5

now, the tricky part is how to get it to detect the right type. the code
looks like this:

fpu_type_flags=fpregs[FPU_TYPE_FLAG_POS];  /* get fpu type flags */
if  (fpu_type_flags & PA2_0_FPU_FLAG)
    subop = get_subop1_PA2_0(ir);
else
    subop = get_subop1_PA1_1(ir);

FPU_TYPE_FLAG_POS is defined as
#define EM_FPU_TYPE_OFFSET 272
#define FPU_TYPE_FLAG_POS (EM_FPU_TYPE_OFFSET>>2)
(272>>2 == 68)

so, i wonder:
1) why those numbers? (where is it documented?)
2) is there a special way to read that fpu type from the fpu? or do we
use boot_cpu_data.cpu_type?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
