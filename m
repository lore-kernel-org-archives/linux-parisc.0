Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA04999
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 11:26:13 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 19 Dec 2000 18:29:05 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1FCA0B005; Tue, 19 Dec 2000 18:22:57 +0000 (GMT)
Date: Tue, 19 Dec 2000 18:22:57 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001219182257.O7166@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc and ptrace
List-ID: <linux-parisc.vger.kernel.org>

I have a problem with ptrace.  The ptrace syscall for PTRACE_PEEK*
saves the result in *data (4th arg), whereas the man page says
it returns the result as the return value, and the 4th arg is
ignored.  userland things, like strace for example, expect the
man page behaviour.  I assumed glibc should be providing a wrapper
to translate from kernel to userland syntax, but our glibc doesn't
appear to do so.

I had a look at glibc and found the wrapper code in
sysdeps/unix/sysv/linux/ptrace.c but that isn't included in the
build.  Instead I end up with misc/ptrace.o being a raw syscall.
I then found sysdeps/unix/sysv/linux/hppa/syscalls.list and commented
out the ptrace line in there and rebuilt.  This time it looks like
misc/ptrace.o has the proper wrapper in it (although I havn't
actually tried to run it).

So, should I be fixing glibc (if removing that line is indeed a fix),
or should I be fixing our kernel source so the glibc wrapper isn't needed?
ia64, for example seems to fix it in the kernel, while sparc64 looks
like it uses the glibc wrapper.

(my strace port only works atm because it has its own wrapper, and
I'm trying to tidy that up).

Richard
