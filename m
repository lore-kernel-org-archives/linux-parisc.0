From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] J5600 Video
Date: Sat, 10 Feb 2007 11:50:08 +0100
Message-ID: <200702101150.08977.deller__4364.10935731164$1416624279$gmane$org@gmx.de>
References: <45CA42F4.2070207@cox.net>
	<e6eae0290702071605x213ec1cdq81dc168a390fb84b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: debian-glibc@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e6eae0290702071605x213ec1cdq81dc168a390fb84b@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 08 February 2007, Max Grabert wrote:
> On 07/02/07, Michael Greene <listsnews@cox.net> wrote:
> >
> > I have my old J5600 recompiled and running with 2.6.19.1 kernel. I put
> > an old Voodoo3 2000 rev 1 in the secondary pci slot and it is recognized
> > by the system (not compiled in the kernel just lspci).  Is there any
> > trick to getting it to work with linux in the J5600 before I waste time
> > trying?
> 
> 
> At one time I was trying to use a Voodoo3 3000 in a C3000, but I was
> unsuccessful (linux fb wouldn't initialise/turn on the display, and
> the native XFree86 driver would crash the machine).
> That was about 2 years ago I think, and some things have changed since
> then ... you might even be successful today. Just try and find out :-)

I think you will fail.
If I remember correctly Vodoo3 needs the on-board i386 Graphics-BIOS to get into a useful state which can be used by vodoo fbdev driver.
Vodoo1 or Vodoo2 do work as framebuffer devices though.

Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
