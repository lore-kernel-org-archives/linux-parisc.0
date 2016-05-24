From: Paul Moore <pmoore@redhat.com>
Subject: Re: Re: [PATCH] libseccomp: Add parisc architecture
 support (v3)
Date: Tue, 24 May 2016 15:09:33 -0400
Message-ID: <CAGH-Kgt=P7wkmBShe5bQ2b=mjQsGAPFfB9fEMxRFT6GTZyu32w@mail.gmail.com>
References: <20160213200731.GA18161@ls3530.box>
	<3673666.V2ZqGazvLY@sifl>
	<56C24911.8000200@gmx.de>
	<1907254.cBdVSxntFv@sifl>
	<20160409070549.GA5442@ls3530.box>
	<CAHC9VhSseu8kLg0W+Ee0bnOiPSKHfGq-zsq-xmrOfMFozohmZA@mail.gmail.com>
	<571103AD.20500@gmx.de>
	<20160415151103.GB11180@ls3530.dhcp.wdf.sap.corp>
	<57251ABF.4080201@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Paul Moore <paul@paul-moore.com>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>, libseccomp@googlegroups.com,
	Mike Frysinger <vapier@gentoo.org>
To: Helge Deller <deller@gmx.de>
Return-path: <libseccomp+bncBD5LRTF6QQMRB3ONSK5AKGQE2GZDFDY@googlegroups.com>
In-Reply-To: <57251ABF.4080201@gmx.de>
List-Post: <https://groups.google.com/group/libseccomp/post>, <mailto:libseccomp@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:libseccomp+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/libseccomp
List-Subscribe: <https://groups.google.com/group/libseccomp/subscribe>, <mailto:libseccomp+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+473669215327+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/libseccomp/subscribe>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 30, 2016 at 4:51 PM, Helge Deller <deller@gmx.de> wrote:
> Hi Paul,
>
> On 15.04.2016 17:11, Helge Deller wrote:
>> This patch (v3) adds support for the parisc and parisc64 architectures
>> to libseccomp.
>
> Linux kernel 4.5.2-1 with full seccomp support for parisc/hppa is
> now publically available in debian:
> https://buildd.debian.org/status/package.php?p=linux&suite=sid
>
> Any chance to get this patch (v3) applied to the libseccomp git tree now ?

Hi Helge,

I apologize for the delay, but I finally got around to merging your
code and noticed a problem: you're missing the parisc enablement code
in src/arch-syscall-check.c which has hidden a number of issues with
the parsic{64} syscall table (run 'make check').  Could you add the
missing code to arch-syscall-check.c and update the syscall table?

Thanks,
-Paul

>> I didn't split up the patch, because it's pretty trivial.
>> Those parisc-specific files gets added:
>>  src/arch-parisc-syscalls.c
>>  src/arch-parisc.c
>>  src/arch-parisc.h
>>  src/arch-parisc64.c
>>
>> All other changes are trivial because they simply add parisc-specific
>> case statements in variouse switch statements.
>>
>> I did ran a "make check" on parisc and all testcases suceeded.
>> All live testcases succeed as well when running "./regression -T live".
>>
>> The patch applies cleanly to current libseccomp git head.
>>
>> Changes between v2 and v1 of this patch:
>> - Enabled seccomp mode 2 regression tests on parisc. Kernel support for hppa
>>   was added in kernel 4.6-rc1 and backported into the kernel v4.5.2 stable
>>   series.
>>
>> Changes between v3 and v2 of this patch:
>> - Stipped out patch which reports if a check was skipped because valgrind
>>   isn't installed.
>> - Added tuxcall pseudo syscall for 19-sim-missing_syscalls testcase
>> - Added sysmips pseudo syscall for 29-sim-pseudo_syscall testcase
>>
>> Thanks,
>> Helge
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diffstat:
>>  include/seccomp.h.in              |    6
>>  src/Makefile.am                   |    2
>>  src/arch-parisc-syscalls.c        |  424 ++++++++++++++++++++++++++++++++++++++
>>  src/arch-parisc.c                 |   22 +
>>  src/arch-parisc.h                 |   38 +++
>>  src/arch-parisc64.c               |   22 +
>>  src/arch-syscall-dump.c           |    5
>>  src/arch.c                        |   13 +
>>  src/gen_pfc.c                     |    4
>>  src/python/libseccomp.pxd         |    2
>>  src/python/seccomp.pyx            |    8
>>  tests/26-sim-arch_all_be_basic.c  |    6
>>  tests/26-sim-arch_all_be_basic.py |    2
>>  tests/regression                  |    3
>>  tools/scmp_arch_detect.c          |    6
>>  tools/scmp_bpf_sim.c              |    4
>>  tools/util.c                      |    4
>>  17 files changed, 570 insertions(+), 1 deletion(-)

-- 
paul moore
security @ redhat

-- 
You received this message because you are subscribed to the Google Groups "libseccomp" group.
To unsubscribe from this group and stop receiving emails from it, send an email to libseccomp+unsubscribe@googlegroups.com.
To post to this group, send email to libseccomp@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
