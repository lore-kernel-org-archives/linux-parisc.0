From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: fanotify_mark()
Date: Wed, 14 Aug 2013 00:54:00 +0200
Message-ID: <20130814005400.3766f068@marga.jer-c2.orkz.net>
References: <20130813154958.7514d525@marga.jer-c2.orkz.net>
	<520AA546.2070503@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <520AA546.2070503@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 13 Aug 2013 23:29:42 +0200
Helge Deller <deller@gmx.de> wrote:

> > [1] https://bugs.gentoo.org/show_bug.cgi?id=480268
> 
> In the Linux kernel we use the compat layer for 32bit syscalls on
> 64bit kernel: arch/parisc/kernel/syscall_table.S:
> ENTRY_COMP(fanotify_mark) which means we call (with 32bit userspace
> on 64bit kernel):
> fs/notify/fanotify/fanotify_user.c:COMPAT_SYSCALL_DEFINE6(fanotify_mark,
> int, fanotify_fd, unsigned int, flags, __u32, mask0, __u32, mask1,
> int, dfd, const char  __user *, pathname) which has 6 parameters.
> 
> So, I assume you need one more "i" in this line here (change i:iiiis
> -> i:iiiiis {to 5 i's}):

I tried that too with a similarly bad result (I forgot to keep a
binary tarball of the packages glibc for easy switching, and I didn't
keep the strace output of the first attempt either).

As noted on the bug report. The bug report lists the relevant strace
output of the delightfully simple implementation of fanotify_mark in
the fatrace[1] tool as well:

# grep fanotif fatrace.strace
361   fanotify_init(0, 0)               = 3
361   fanotify_mark(0x3, 0x11, 0x4800003b, 0, 0xffffff9c) = -1 EINVAL
(Invalid argument)

I have since tried with a 32-bit kernel on a C3600, and there I get a
different one:

# grep fanotif fatrace.strace
2810  fanotify_init(0, 0)               = 3
2810  fanotify_mark(0x3, 0x11, 0x4800003b, 0, 0xffffff9c) = -1 EBADF
(Bad file descriptor)


     jer


[1] https://launchpad.net/fatrace
