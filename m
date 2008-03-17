From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc bug fixes for 2.6.25
Date: Mon, 17 Mar 2008 13:53:14 -0400 (EDT)
Message-ID: <20080317175315.E814B4E0E@hiauly1.hia.nrc.ca>
References: <20080317145236.GC3904@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080317145236.GC3904@phobos.i.cabal.ca> from "Kyle McMartin" at Mar 17, 2008 10:52:36 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I don't see this... what is the machine running? I'm concerned maybe one
> of the new syscalls is being used in glibc or something.

At a simpler level, pwck and grpck are also wierd.  For example,
grpck often says a user doesn't exist when it clearly does.  Tried
running grpck with strace but it dies:

...
open("/lib/libsepol.so.1", O_RDONLY)    = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0WL"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 265584, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x414e8000
mmap(0x41527000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) = 0x41527000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40002000
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40003000
munmap(0x404ea000, 96360)               = 0
brk(0)                                  = 0x21000
brk(0x42000)                            = 0x42000
open("/etc/selinux/config", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
upeek: ptrace(PTRACE_PEEKUSER,11233,4294967292,0): Input/output error
root@hiauly6:/etc#

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
