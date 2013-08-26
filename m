From: Helge Deller <deller@gmx.de>
Subject: Re: fanotify_mark()
Date: Mon, 26 Aug 2013 23:27:39 +0200
Message-ID: <521BC84B.4090602@gmx.de>
References: <20130813154958.7514d525@marga.jer-c2.orkz.net> <520AA546.2070503@gmx.de> <20130814005400.3766f068@marga.jer-c2.orkz.net> <20130826014657.05f4c466@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130826014657.05f4c466@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08/26/2013 01:46 AM, Jeroen Roovers wrote:
> On Wed, 14 Aug 2013 00:54:00 +0200
> Jeroen Roovers <jer@gentoo.org> wrote:
> 
>> On Tue, 13 Aug 2013 23:29:42 +0200
>> Helge Deller <deller@gmx.de> wrote:
>>
>>>> [1] https://bugs.gentoo.org/show_bug.cgi?id=480268
>>>
>>> In the Linux kernel we use the compat layer for 32bit syscalls on
>>> 64bit kernel: arch/parisc/kernel/syscall_table.S:
>>> ENTRY_COMP(fanotify_mark) which means we call (with 32bit userspace
>>> on 64bit kernel):
>>> fs/notify/fanotify/fanotify_user.c:COMPAT_SYSCALL_DEFINE6(fanotify_mark,
>>> int, fanotify_fd, unsigned int, flags, __u32, mask0, __u32, mask1,
>>> int, dfd, const char  __user *, pathname) which has 6 parameters.
>>>
>>> So, I assume you need one more "i" in this line here (change i:iiiis
>>> -> i:iiiiis {to 5 i's}):
>>
>> I tried that too with a similarly bad result
> 
> After the 5 i patch =and= recompiling fatrace, fanotify_mark() now works
> properly.

Great!
I didn't checked, but will the "5 i" work on 32bit too? Don't think so...

> Which brings me no closer to systemd support on HPPA, I'm
> afraid, but at least systemd now installs properly. I'm working on
> writing up another e-mail about the next hurdle[1] systemd presents us.
> [1] Sneak preview: https://bugs.gentoo.org/show_bug.cgi?id=482214

Did you already filed this signal-problem upstream as suggested in comment #3 (https://bugs.gentoo.org/show_bug.cgi?id=482214#c3)?

Helge

