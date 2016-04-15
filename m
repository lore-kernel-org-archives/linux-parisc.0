From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] libseccomp: Add parisc architecture support (v2)
Date: Fri, 15 Apr 2016 17:07:25 +0200
Message-ID: <571103AD.20500@gmx.de>
References: <20160213200731.GA18161@ls3530.box> <3673666.V2ZqGazvLY@sifl>
 <56C24911.8000200@gmx.de> <1907254.cBdVSxntFv@sifl>
 <20160409070549.GA5442@ls3530.box>
 <CAHC9VhSseu8kLg0W+Ee0bnOiPSKHfGq-zsq-xmrOfMFozohmZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 John David Anglin <dave.anglin@bell.net>, libseccomp@googlegroups.com,
 Mike Frysinger <vapier@gentoo.org>
To: Paul Moore <paul@paul-moore.com>
Return-path: <libseccomp+bncBC23VB5X54DBBNUHYS4AKGQEZ3OSEGY@googlegroups.com>
In-Reply-To: <CAHC9VhSseu8kLg0W+Ee0bnOiPSKHfGq-zsq-xmrOfMFozohmZA@mail.gmail.com>
List-Post: <https://groups.google.com/group/libseccomp/post>, <mailto:libseccomp@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:libseccomp+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/libseccomp
List-Subscribe: <https://groups.google.com/group/libseccomp/subscribe>, <mailto:libseccomp+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+473669215327+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/libseccomp/subscribe>
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul,

On 15.04.2016 01:14, Paul Moore wrote:
> On Sat, Apr 9, 2016 at 3:05 AM, Helge Deller <deller@gmx.de> wrote:
>> This patch (v2) adds support for the parisc and parisc64 architectures
>> to libseccomp.
> 
> Great!

>> I noticed that when valgrind is not going to be used (e.g. because it's not
>> installed), the test testsuite will issue no information about that. With this
>> patch you will get informed if a testcase was SKIPPED because valgrind is not
>> installed. This additional info is useful for architectures which aren't as
>> fast as x86_64. On parisc it seemed that the whole testcase was hanging, now
>> people know what's actually happening.
> 
> Would you mind separating out the valgrind portion of the patch into a
> separate patch?  
> That is something we can merge regardless, as it
> isn't pa-risc specific, and would be a nice addition.

Sure. I'll send it out in a few seconds.

>> I did ran a "make check" sucessfully on x86_64 and parisc.
>> The x86_64 didn't showed any issues, while on the parisc architecture
>> the 29-sim-pseudo_syscall testcase failed. But it seems this testcase
>> failure is not caused by this patch, instead it seems that it will fail
>> on most other architectures beside x86_64 as well.
> 
> There should be no test failures on any of the arch/ABIs that
> libseccomp supports.  Can you elaborate on the failure you are seeing
> with 29-sim-pseudo_syscall? 

I found the problem. Those testcases needed "pseudo" syscalls: 
19-sim-missing_syscalls -> tuxcall
29-sim-pseudo_syscall -> sysmips
It's fixed in the new patch (v3) which I send out in separate mail.

> Are you using a current libseccomp from the master branch?

Yes.

> Also, it would be good to ensure that 'cd tests; ./regression -T live'
> worked correctly; 

Yes, the new patch (v3) works as expected:
test type:  live
Test 20-live-basic_die%%001-00001 result:   SUCCESS
Test 20-live-basic_die%%002-00001 result:   SUCCESS
Test 20-live-basic_die%%003-00001 result:   SUCCESS
Test 21-live-basic_allow%%001-00001 result:   SUCCESS
Test 24-live-arg_allow%%001-00001 result:   SUCCESS
Test 32-live-tsync_allow%%001-00001 result:   SUCCESS
Regression Test Summary
 tests run: 6
 tests skipped: 0
 tests passed: 6
 tests failed: 0
 tests errored: 0

> So all necessary kernel support is now part of the 4.6-rcX kernels?

Yes, 4.6-rc1 has everything needed for libseccomp.
In addition, 4.5.2 (stable) will have the patches as well (4.5.1 was just released, 
but the patches are already queued up for 4.5.2 by the stable maintainers).

Helge

-- 
You received this message because you are subscribed to the Google Groups "libseccomp" group.
To unsubscribe from this group and stop receiving emails from it, send an email to libseccomp+unsubscribe@googlegroups.com.
To post to this group, send email to libseccomp@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
