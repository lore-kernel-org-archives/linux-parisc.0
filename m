From: Ed Swierk <eswierk@skyportsystems.com>
Subject: Re: [RFC PATCH urcu on mips, parisc] Fix: compat_futex should
 work-around futex signal-restart kernel bug
Date: Thu, 17 Dec 2015 05:16:57 -0800
Message-ID: <CAO_EM_n+_0=94CAjhE6XTCMVmjnqLOaDhTz-xaqZb77UL4o+hw@mail.gmail.com>
References: <1450303792-27470-1-git-send-email-mathieu.desnoyers@efficios.com> <663068619.259007.1450356852694.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
	Jon Bernard <jbernard@debian.org>,
	Michael Jeanson <mjeanson@efficios.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	linux-mips <linux-mips@linux-mips.org>,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <663068619.259007.1450356852694.JavaMail.zimbra@efficios.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I believe e967ef02 "MIPS: Fix restart of indirect syscalls" should be
backported to all stable kernels.

It would be a surprising coincidence if parisc suffers from the same problem.

--Ed


On Thu, Dec 17, 2015 at 4:54 AM, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
> ----- On Dec 16, 2015, at 5:09 PM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:
>
>> When testing liburcu on a 3.18 Linux kernel, 2-core MIPS (cpu model :
>> Ingenic JZRISC V4.15  FPU V0.0), we notice that a blocked sys_futex
>> FUTEX_WAIT returns -1, errno=ENOSYS when interrupted by a SA_RESTART
>> signal handler. This spurious ENOSYS behavior causes hangs in liburcu
>> 0.9.x. Running a MIPS 3.18 kernel under a QEMU emulator exhibits the
>> same behavior. This might affect earlier kernels.
>>
>> This issue appears to be fixed in 3.18.y stable kernels and 3.19, but
>> nevertheless, we should try to handle this kernel bug more gracefully
>> than a user-space hang due to unexpected spurious ENOSYS return value.
>
> It's actually fixed in 3.19, but not in 3.18.y stable kernels. The
> Linux kernel upstream fix commit is:
> e967ef02 "MIPS: Fix restart of indirect syscalls"
>
> I've created a small test program that could also be used on parisc
> to check if it suffers from the same issue (see attached).
>
> On bogus mips kernels, we see the following output:
> [OK] Test program with pid: 5748 SIGUSR1 handler
> [FAIL] futex returns -1, Function not implemented
>
> Let me know if someone can try it out on a parisc kernel.
>
> Thanks!
>
> Mathieu
>
>>
>> Therefore, fallback on the "async-safe" version of compat_futex in those
>> situations where FUTEX_WAIT returns ENOSYS. This async-safe fallback has
>> the nice property of being OK to use concurrently with other FUTEX_WAKE
>> and FUTEX_WAIT futex() calls, because it's simply a busy-wait scheme.
>>
>> We suspect that parisc might be affected by a similar issue (Debian
>> build bots reported a similar hang on both mips and parisc), but we do
>> not have access to the hardware required to test this hypothesis.
>>
>> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>> CC: Michael Jeanson <mjeanson@efficios.com>
>> CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> CC: Ralf Baechle <ralf@linux-mips.org>
>> CC: linux-mips@linux-mips.org
>> CC: linux-kernel@vger.kernel.org
>> CC: "James E.J. Bottomley" <jejb@parisc-linux.org>
>> CC: Helge Deller <deller@gmx.de>
>> CC: linux-parisc@vger.kernel.org
>> ---
>> compat_futex.c |  2 ++
>> urcu/futex.h   | 12 +++++++++++-
>> 2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/compat_futex.c b/compat_futex.c
>> index b7f78f0..9e918fe 100644
>> --- a/compat_futex.c
>> +++ b/compat_futex.c
>> @@ -111,6 +111,8 @@ end:
>>  * _ASYNC SIGNAL-SAFE_.
>>  * For now, timeout, uaddr2 and val3 are unused.
>>  * Waiter will busy-loop trying to read the condition.
>> + * It is OK to use compat_futex_async() on a futex address on which
>> + * futex() WAKE operations are also performed.
>>  */
>>
>> int compat_futex_async(int32_t *uaddr, int op, int32_t val,
>> diff --git a/urcu/futex.h b/urcu/futex.h
>> index 4d16cfa..a17eda8 100644
>> --- a/urcu/futex.h
>> +++ b/urcu/futex.h
>> @@ -73,7 +73,17 @@ static inline int futex_noasync(int32_t *uaddr, int op,
>> int32_t val,
>>
>>       ret = futex(uaddr, op, val, timeout, uaddr2, val3);
>>       if (caa_unlikely(ret < 0 && errno == ENOSYS)) {
>> -             return compat_futex_noasync(uaddr, op, val, timeout,
>> +             /*
>> +              * The fallback on ENOSYS is the async-safe version of
>> +              * the compat futex implementation, because the
>> +              * async-safe compat implementation allows being used
>> +              * concurrently with calls to futex(). Indeed, sys_futex
>> +              * FUTEX_WAIT, on some architectures (e.g. mips), within
>> +              * a given process, spuriously return ENOSYS due to
>> +              * signal restart bugs on some kernel versions (e.g.
>> +              * Linux kernel 3.18 and possibly earlier).
>> +              */
>> +             return compat_futex_async(uaddr, op, val, timeout,
>>                               uaddr2, val3);
>>       }
>>       return ret;
>> --
>> 2.1.4
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com
