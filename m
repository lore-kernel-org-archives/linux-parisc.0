Return-Path: <epotter@eep.burdell.org>
Received: from keymaster (dsl027-162-176.atl1.dsl.speakeasy.net
	[216.27.162.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2F554852
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 15 Feb 2004 09:32:27 -0700 (MST)
Date: Sun, 15 Feb 2004 11:27:53 -0500 (EST)
From: Elliott Potter <epotter@eep.burdell.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] C3000 video options
In-Reply-To: <1076861160.25519.1.camel@dhcp23.swansea.linux.org.uk>
Message-ID: <Pine.GSO.4.44.0402151123210.13137-100000@keymaster>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org, "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, 15 Feb 2004, Alan Cox wrote:

> On Sul, 2004-02-15 at 03:36, M. Grabert wrote:
> > [...]
> > You'll be lucky to get any (ix86) PCI graphics card working on Linux/PA-RISC.
> > The best bet would be to get a Visualize-EG, or some graphics card that
> > doesn't require initialization via (ix86-)BIOS (eg. Matrox Millenium).
>
> Older S3, Matrox fit that, the XFree86 code has an x86 emulator which
> will boot some more cards tho it does fail on some too where real vm86
> works (eg C&T video BIOS)

I've got the matroxfb driver built as a module, but so far all I can get
it to do is hard lock the machine (yay, ext3!  Otherwise I'd be in real
trouble).  I'm fiddling with driver options, but it's slow going because
of all the rebooting.  Last one I tried was

modprobe matroxfb_base noaccel nopciretry nobios noinit nomtrr
Warning:
/lib/modules/2.4.24-pa0/kernel/drivers/video/matrox/matroxfb_base.o
symbol for parameter mtrr not found

...then the hard lock.  I'm going to try it with just "nomtrr" next
time; that mtrr warning error comes up every time.



Ideally, this card will work on the machine, because I've got one (and I
don't have a Voodoo* or S3*).  We'll see...
--
Elliott
