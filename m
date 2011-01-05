From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Tue, 4 Jan 2011 22:49:23 -0500
Message-ID: <20110105034922.GA4120@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site> <20101229042346.GA973@hiauly1.hia.nrc.ca> <1293634281.2803.4.camel@fuzzy> <20101230155640.GA7058@hiauly1.hia.nrc.ca> <20101230160944.GA7360@hiauly1.hia.nrc.ca> <20110101183108.GA19035@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110101183108.GA19035@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 01 Jan 2011, John David Anglin wrote:

> On Thu, 30 Dec 2010, John David Anglin wrote:
> 
> > On Thu, 30 Dec 2010, John David Anglin wrote:
> > 
> > > Attached is an application that triggers similar errors:
> 
> Here is a simpler testcase:
> 
> int main ()
> {
>   asm ("stw %r0,0(%r0)"); /* Generate null pointer exception */
>   return 0;
> }
> 
> With the above, I get the following INEQUIVALENT ALIASES messages:
> 
> Jan  1 10:23:19 gsyprf11 kernel: [135942.140000] INEQUIVALENT ALIASES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so
> Jan  1 10:23:19 gsyprf11 kernel: [135942.224000] INEQUIVALENT ALIASES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so

This is what I see in the tasks maps file in /proc:

00010000-00011000 r-xp 00000000 08:30 6613687                            /home2/dave/inequiv/xxx1
00011000-00012000 rwxp 00000000 08:30 6613687                            /home2/dave/inequiv/xxx1
40000000-40005000 rw-p 00000000 00:00 0 
4002b000-4004b000 r-xp 00000000 08:03 2502157                            /lib/ld-2.11.2.so
4004b000-4004f000 rwxp 0001f000 08:03 2502157                            /lib/ld-2.11.2.so
4004f000-40050000 rwxp 00000000 00:00 0 
40138000-40291000 r-xp 00000000 08:03 2502172                            /lib/libc-2.11.2.so
40291000-40298000 rwxp 00158000 08:03 2502172                            /lib/libc-2.11.2.so
40298000-4029a000 rwxp 00000000 00:00 0 
fe09b000-fe0be000 rwxp 00000000 00:00 0                                  [stack]

As can be seen, there are duplicate maps with different protections for xxx1,
etc.  So, it's clear why we have the inequivalent aliases.  The map can
be accessed by the application (probably just for lines in the cache).
I have seen some discussions that even a read may lead to cache corruption.

These inequivalent maps are coming from glibc:

dave@gsyprf11:~/inequiv$ strace /lib/ld-2.11.2.so ./xxx1
execve("/lib/ld-2.11.2.so", ["/lib/ld-2.11.2.so", "./xxx1"], [/* 17 vars */]) = 0
brk(0)                                  = 0x4119a000
open("./xxx1", O_RDONLY)                = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\2\0\17\0\0\0\1\0\1\3T\0\0\0004"..., 512) = 512
fstat64(3, {st_mode=0, st_size=4380866642020, ...}) = 0
getcwd("/home2/dave/inequiv", 128)      = 20
mmap(0x10000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x10000
mmap(0x11000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x11000
...

Carlos what do you think?  arch_get_unmapped_area() accepts MAP_FIXED
requests even if it would violate cache aliasing constraints.  I don't
understand the purpose of the region at 0x11000.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
