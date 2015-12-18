From: Helge Deller <deller@gmx.de>
Subject: Re: Aw: Re: [RFC PATCH urcu on mips, parisc] Fix: compat_futex should
 work-around futex signal-restart kernel bug
Date: Fri, 18 Dec 2015 21:42:46 +0100
Message-ID: <56746FC6.10904@gmx.de>
References: <1450303792-27470-1-git-send-email-mathieu.desnoyers@efficios.com>
 <663068619.259007.1450356852694.JavaMail.zimbra@efficios.com>
 <trinity-0a355ae2-e5eb-40e5-8561-41a2e8e251e2-1450369370294@3capp-gmx-bs60>
 <1817225945.264082.1450468696180.JavaMail.zimbra@efficios.com>
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
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1817225945.264082.1450468696180.JavaMail.zimbra@efficios.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Mathieu,

On 18.12.2015 20:58, Mathieu Desnoyers wrote:
> ----- On Dec 17, 2015, at 11:22 AM, Helge Deller deller@gmx.de wrote:
> 
>> Hello Mathieu,
>>
>>>> When testing liburcu on a 3.18 Linux kernel, 2-core MIPS (cpu model :
>>>> Ingenic JZRISC V4.15  FPU V0.0), we notice that a blocked sys_futex
>>>> FUTEX_WAIT returns -1, errno=ENOSYS when interrupted by a SA_RESTART
>>>> signal handler. This spurious ENOSYS behavior causes hangs in liburcu
>>>> 0.9.x. Running a MIPS 3.18 kernel under a QEMU emulator exhibits the
>>>> same behavior. This might affect earlier kernels.
>>>>
>>>> This issue appears to be fixed in 3.18.y stable kernels and 3.19, but
>>>> nevertheless, we should try to handle this kernel bug more gracefully
>>>> than a user-space hang due to unexpected spurious ENOSYS return value.
>>>
>>> It's actually fixed in 3.19, but not in 3.18.y stable kernels. The
>>> Linux kernel upstream fix commit is:
>>> e967ef02 "MIPS: Fix restart of indirect syscalls"
>>
>> But that patch fixes mips only.
> 
> Indeed, I do not expect this commit to have any effect on parisc.
> 
>>
>>> I've created a small test program that could also be used on parisc
>>> to check if it suffers from the same issue (see attached).
>>>
>>> On bogus mips kernels, we see the following output:
>>> [OK] Test program with pid: 5748 SIGUSR1 handler
>>> [FAIL] futex returns -1, Function not implemented
>>
>> I tested it on a recent 4.2 kernel on parisc.
>> It fails as you describe:
>>
>> Testing futex sigrestart. Stop with CTRL-c.
>> [OK] Test program with pid: 1361 SIGUSR1 handler
>> [OK] Test program with pid: 1361 SIGUSR1 handler
>> [FAIL] futex returns -1, Function not implemented
>> [OK] Test program with pid: 1361 SIGUSR1 handler
>> [FAIL] futex returns -1, Function not implemented
>>
>> strace gives:
>> [pid  1329] futex(0x1210c, FUTEX_WAIT, -1, NULL <unfinished ...>
>> [pid  1328] nanosleep({1, 0},  <unfinished ...>
>> [pid  1329] <... futex resumed> )       = ? ERESTARTSYS (To be restarted if
>> SA_RESTART is set)
>> [pid  1329] write(2, "[FAIL] futex returns -1, Functio"..., 50[FAIL] futex
>> returns -1, Function not implemented)
> 
> Looks like parisc has an issue very similar to the one that
> has been fixed on MIPS by e967ef02 "MIPS: Fix restart of indirect syscalls".

Yes.

>>>> Therefore, fallback on the "async-safe" version of compat_futex in those
>>>> situations where FUTEX_WAIT returns ENOSYS. This async-safe fallback has
>>>> the nice property of being OK to use concurrently with other FUTEX_WAKE
>>>> and FUTEX_WAIT futex() calls, because it's simply a busy-wait scheme.
>>>>
>>>> We suspect that parisc might be affected by a similar issue (Debian
>>>> build bots reported a similar hang on both mips and parisc), but we do
>>>> not have access to the hardware required to test this hypothesis.
>>
>> If you want access to a machine, let me know.
>> I'll try the patch below as well..
> 
> This would be very useful indeed, just to make sure our approach to
> futex fallback in liburcu works fine on parisc.

Yes, but will take me some time...

> I'm no parisc assembly expert though, but I suspect the issue
> would be quite similar to the one already fixed on MIPS. The
> existing fix for MIPS would be a good starting point to see if
> something similar is missing on parisc.

Yes, I've already started to look into the parisc assembly parts.
The problems seems to be both the same, the syscall number is not
reserved during a syscall restart.
We have problems with pthread cancellation in glibc too, maybe
it's related to this bug.

> When time allows, we should consider cleaning up my test case for
> restart of indirect system calls and add it to kselftest. 

I was thinking of adding it to the Linux Test Project (LTP) :-)

> It's
> the second architecture that has the same defect, which means this
> behavior is seldom tested.

Helge

