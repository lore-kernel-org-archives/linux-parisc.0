From: "B. Douglas Hilton" <bdhilton@charter.net>
Subject: [parisc-linux] Re: C200 Voodoo2 Progress Report
Date: Fri, 06 Sep 2002 20:09:21 -0400
Message-ID: <3D7943B1.3050406__6924.62773663482$1416621692$gmane$org@charter.net>
References: <3D77D183.2080905@charter.net> <20020906034656.A26580@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: palinux <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hrrmm... things aren't quite so easy as I first thought.
For one, the Voodoo2 is a 5V PCI card so it will not fit
into the Cujo slots, only Dino.

Likewise, glide3-alpha wants to use <sys/io.h> which just
isn't there on hppa because that file is particular to
alpha and x86 archs as I understand it. I tried hacking
it to use <asm/io.h> instead which caused a cascade of
about a hundred errors when it got to that point. So
glide3-alpha needs some looking at.

On the kernel front, I can build the sstfb module allright,
which it must be made as a module or else an invisible
HPMC apparently occurs. I know this because after it switches
to fb console mode, nothing more is seen and hitting the
power button causes instant power-off rather than the normal
graceful shutdown.

When I "modprobe sstfb" it appears to load, except it is
reporting that my 12Mb card only has 2Mb. The fbset program
does not segfault, but complains about "Obsolete Major on
/dev/fb1". The con2fb util doesn't report any errors but
neither does it seem to do anything, and finally, a subsequent
"$export FRAMEBUFFER=/dev/fb1; startx -- :0 -bpp 16 vt06"
causes a lockup and suspected HPMC.

So, it seems like this stuff will require some working on.
If anybody else wants to help out too that would be great
because my time is limited and programming video cards is
a bit above my level, but I'll keep tinkering with it in
the meantime. I know some assembly and hardware basics but
am not very familiar with pa-risc yet.

- Doug



Matthew Wilcox wrote:
> On Thu, Sep 05, 2002 at 05:49:55PM -0400, B. Douglas Hilton wrote:
> 
>>  This is the Debian source for Glide3 on the Alpha arch,
>>  which is also big-endian. Initial compilation failed in
> 
> 
> nope.  alpha is little-endian.
> 
> LE: alpha, arm, cris, i386, ia64, superh
> BE: m68k, mips, parisc, ppc, s390, sparc
> 
> (yes, i know many of these CPUs are bi-endian, but these are the default
> configs)
> 
