Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FDFE4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 10:00:12 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2097AB005; Thu, 22 Feb 2001 17:00:50 +0000 (GMT)
Date: Thu, 22 Feb 2001 17:00:50 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010222170050.B4660@linuxcare.com>
References: <20010222130359.F1129@linuxcare.com> <Pine.LNX.4.21.0102230011340.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <Pine.LNX.4.21.0102230011340.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Fri, Feb 23, 2001 at 12:27:44AM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 23, 2001 at 12:27:44AM +1100, Alan Modra wrote:
> suit.  What's the betting you can't reproduce this? :-(

atm the child dies for me before the two get to talk over the pipes at
all.

Beware: strace output is wrong after a traced program does execve:

main()
{
        execl("/bin/true", "true", 0);
}


...
...
getpid()                                = 13025
execve("/bin/true", ["true"], [/* 20 vars */]) = 0
execve("ê À", [ptrace: umoven: Input/output error
0x1], [/* 1 var */])     = 1073851560
newuname({sys="Linux", node="merlin", ...}) = 0
brk(0)                                  = 0x2f
open("/etc/ld.so.preload", O_RDONLY)    = 9
open("/etc/ld.so.cache", O_RDONLY)      = 3
newfstat(3, {st_mode=S_IFREG|0644, st_size=7103, ...}) = 0
mmap(NULL, 7103, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4001c000
close(3)                                = 1073863222
open("/lib/libc.so.6", O_RDONLY)        = 1073848888
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2k\314"..., 1024) = 1073856336
