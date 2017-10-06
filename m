From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: HP-UX for C8000
Date: Fri, 6 Oct 2017 16:39:17 +0200
Message-ID: <20171006143917.GA4906@alpha.franken.de>
References: <20170930152506.GA10542@alpha.franken.de>
 <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net>
 <20171001114626.GA16118@alpha.franken.de>
 <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 01, 2017 at 11:02:01AM -0400, John David Anglin wrote:
> On 2017-10-01, at 7:46 AM, Tom Bogendoerfer wrote:
> 
> > does it have a working graphics card ? 
> 
> It's a FireGL T2:
> 80:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV350 GL [FireGL T2] (rev 80)

perfect.

Took me a little bit longer to play with a method to dump quicksilver
register. Since I don't have a working HP-UX 11 box, I looked how
to do it with Linux from userspace.

dd if=/dev/mem doesn't work, because it will only give access to memory.

So I recycled my small dump program, which I only used on Linux/MIPS
so far. The nice thing is, it also works for Linux/PARISC:-)

Now the challenge is to see, if it compiles and works on HP-UX the same
way...

A correct dump should start with

3c10b412 4601b002 10000006 20c00000 0c000040 00000000 00000000 00000000

Thomas.


#include <sys/types.h>
#define __USE_LARGEFILE64
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#define QUICKSILVER_ADDR 0xfffffffffed28000

int main(int argc, char **argv)
{
	int fd;
	int i;
	unsigned int *agp;

	fd = open("/dev/mem", O_RDWR|O_SYNC);
	agp = mmap64(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE, fd,
		    QUICKSILVER_ADDR);
	if (agp == (void *)-1) {
		perror ("mmap");
		exit (1);
	}

	for (i = 0; i < 0x800 / 4; i++) {
		printf ("%08x ", agp[i]);
		if ((i & 7) == 7) {
			printf ("\n");
		}
	}
	close (fd);
}



-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
