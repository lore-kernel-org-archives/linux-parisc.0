From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: Aw: Re: [RFC PATCH urcu on mips, parisc] Fix: compat_futex
 should work-around futex signal-restart kernel bug
Date: Sun, 20 Dec 2015 14:11:41 +0000 (UTC)
Message-ID: <1106544409.268921.1450620701325.JavaMail.zimbra@efficios.com>
References: <1450303792-27470-1-git-send-email-mathieu.desnoyers@efficios.com> <663068619.259007.1450356852694.JavaMail.zimbra@efficios.com> <trinity-0a355ae2-e5eb-40e5-8561-41a2e8e251e2-1450369370294@3capp-gmx-bs60> <1817225945.264082.1450468696180.JavaMail.zimbra@efficios.com> <56746FC6.10904@gmx.de> <56753350.2060906@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
	Jon Bernard <jbernard@debian.org>,
	Michael Jeanson <mjeanson@efficios.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	linux-mips <linux-mips@linux-mips.org>,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Ed Swierk <eswierk@skyportsystems.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56753350.2060906@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

----- On Dec 19, 2015, at 5:37 AM, Helge Deller deller@gmx.de wrote:

> Hi Mathieu,
> 
> On 18.12.2015 21:42, Helge Deller wrote:
>> On 18.12.2015 20:58, Mathieu Desnoyers wrote:
>>>>>> When testing liburcu on a 3.18 Linux kernel, 2-core MIPS (cpu model :
>>>>>> Ingenic JZRISC V4.15  FPU V0.0), we notice that a blocked sys_futex
>>>>>> FUTEX_WAIT returns -1, errno=ENOSYS when interrupted by a SA_RESTART
>>>>>> signal handler. This spurious ENOSYS behavior causes hangs in liburcu
>>>>>> 0.9.x. Running a MIPS 3.18 kernel under a QEMU emulator exhibits the
>>>>>> same behavior. This might affect earlier kernels.
>>>>>>
>>>>>> This issue appears to be fixed in 3.18.y stable kernels and 3.19, but
>>>>>> nevertheless, we should try to handle this kernel bug more gracefully
>>>>>> than a user-space hang due to unexpected spurious ENOSYS return value.
>>>>>
>>>>> It's actually fixed in 3.19, but not in 3.18.y stable kernels. The
>>>>> Linux kernel upstream fix commit is:
>>>>> e967ef02 "MIPS: Fix restart of indirect syscalls"
> 
>>> Looks like parisc has an issue very similar to the one that
>>> has been fixed on MIPS by e967ef02 "MIPS: Fix restart of indirect syscalls".
> 
> Yes, parisc is affected the same way.
> I've posted a patch to the parisc mailing list which fixes this issue for
> parisc and which I plan to push into stable kernels:
> http://thread.gmane.org/gmane.linux.ports.parisc/26243
> 
> Regarding your patch for liburcu:
> 
>>>>>> Therefore, fallback on the "async-safe" version of compat_futex in those
>>>>>> situations where FUTEX_WAIT returns ENOSYS. This async-safe fallback has
>>>>>> the nice property of being OK to use concurrently with other FUTEX_WAKE
>>>>>> and FUTEX_WAIT futex() calls, because it's simply a busy-wait scheme.
> 
> I've tested your patch. It does not produce any regressions on parisc, but I
> can't
> say for sure if it really works. ENOSYS is returned randomly, so maybe I didn't
> faced a situation where your patch actually was used.

If you ran make check and make regtest, and nothing
fails/hangs, you should be OK. liburcu runs very heavy
stress-tests which makes it likely to hit race conditions
repeatedly.

Thanks!

Mathieu

> 
> Helge

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
