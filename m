From: Steve Bromwich <hppa@fop.ns.ca>
Subject: [parisc-linux] Re: 2.6 upgrade problems
Date: Sat, 5 Feb 2005 12:23:14 -0400 (AST)
Message-ID: <Pine.LNX.4.58.0502051211590.12670@brain.fop.ns.ca>
References: <Pine.LNX.4.58.0501171521470.3385@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0501171521470.3385@brain.fop.ns.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

OK, I had the chance to sit down and do some research and
fixed/ameliorated most of these problems - hopefully this will help
someone else out!

On Mon, 17 Jan 2005, Steve Bromwich wrote:

> I just upgraded my 715/100XC to 2.6.10-pa10 from 2.4.27, and I've hit a
> few snags. First is I've lost serial console ("if this is the last message
> you see..."). I did make oldconfig from the 2.4.27 config, but I think
> I've fluffed it and missed the driver. Can someone see what I've missed in
> the attached config?

make oldconfig didn't transfer across the settings for serial console, for
some reason; CONFIG_SERIAL_8250_CONSOLE didn't get set (I'm assuming this
is the right one for my machine rather than CONFIG_SERIAL_MUX_CONSOLE).
I'm going to upgrade the kernel to the latest version rather than
recompile this one, and reboot it when I next open the case.

> Next, vmstat appears to fail with a segfault:

OK, this is a bit fiddly. Add the following to /etc/apt/sources.list:

deb-src http://www.backports.org/debian woody procps

Then apt-get source --compile procps. This will fail will an error from ld
before it completes creating the package. Copy
./debian/procps/lib/libproc-3.2.3.so to /lib and run ldconfig. Rename
/usr/bin/vmstat to /usr/bin/vmstat.old and copy vmstat to /usr/bin. Not
the ideal solution (debsums will complain, if you use it) but it works.

> brain:/var/adm# vmstat 1
> Unknown HZ value! (7) Assume 100.

I'm not sure about Unknown HZ. I happened to upgrade an x86 box with the
backported procps and got the same error.

> Finally (and it may not have been a great idea to do this at the same time
> as doing the kernel upgrade) I put in a DAT drive I acquired. This is
> failing when I try to write to it with the following error in dmesg:
>
> st0: Error with sense data: Info fld=0x14, Current st0: sense = f0  3
> ASC= c ASCQ= 0
> Raw sense data:0xf0 0x00 0x03 0x00 0x00 0x00 0x14 0x2c 0x00 0x00 0x00 0x00
> 0x0c 0x00 0x00 0x00 0x00 0x85 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0
> x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
> 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

This looks to be a problem with termination, from discussion with other
people. I'm going to crack the case in my CFT and check the jumpers on all
the drives to make sure.

Cheers, Steve
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
