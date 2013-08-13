From: Helge Deller <deller@gmx.de>
Subject: Re: fanotify_mark()
Date: Tue, 13 Aug 2013 23:29:42 +0200
Message-ID: <520AA546.2070503@gmx.de>
References: <20130813154958.7514d525@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130813154958.7514d525@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08/13/2013 03:49 PM, Jeroen Roovers wrote:
> Trying out systemd I found that libc 2.17 does not build
> fanotify_mark() support[1]. When I got it to do that (see attached
> patch, which is probably incorrect), calls to fanotify_mark() still
> failed on a C8000 (64-bit kernel). I am sure I am missing something
> obvious.
> 
> [1] https://bugs.gentoo.org/show_bug.cgi?id=480268

In the Linux kernel we use the compat layer for 32bit syscalls on 64bit kernel:
arch/parisc/kernel/syscall_table.S:     ENTRY_COMP(fanotify_mark)
which means we call (with 32bit userspace on 64bit kernel):
fs/notify/fanotify/fanotify_user.c:COMPAT_SYSCALL_DEFINE6(fanotify_mark, int, fanotify_fd, unsigned int, flags,
                __u32, mask0, __u32, mask1, int, dfd, const char  __user *, pathname)
which has 6 parameters.

So, I assume you need one more "i" in this line here (change i:iiiis -> i:iiiiis {to 5 i's}):
> +fanotify_mark	EXTRA	fanotify_mark	i:iiiis	__fanotify_mark fanotify_mark@@GLIBC_2.17

Just an assumption...

Helge
