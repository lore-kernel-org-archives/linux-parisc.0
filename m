From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C240 and Linux 2.6.x
Date: Mon, 3 Jan 2005 13:22:14 -0700
Message-ID: <20050103202214.GC3277@colo.lackof.org>
References: <20041230231420.GA15674@nilpferd.asyl>
	<41D553CB.6070802@tiscali.be>
	<20041231174649.GA21212@nilpferd.asyl>
	<20041231212330.GB23592@colo.lackof.org>
	<20050103181334.GB21212@nilpferd.asyl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Alexander Bartolich <alexander.bartolich@gmx.at>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050103181334.GB21212@nilpferd.asyl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 03, 2005 at 07:13:34PM +0100, Alexander Bartolich wrote:
> This gives me nice console output on booting, so there is definitely
> something wrong with Debian's kernel-image-2.6.8-1-32.

Good.

> Howver, now comes the bad news.

Thanks for capturing and sending the console log.

...
> Linux Tulip driver version 1.1.13 (May 11, 2002)
> Backtrace:

[ hrm...IOAQ is missing from the backtrace ... maybe that's intentional ]

>  [<10202ea4>] pci_device_probe_static+0x60/0x78
>  [<10202ed8>] __pci_device_probe+0x1c/0x34
>  [<10202f1c>] pci_device_probe+0x2c/0x58
>  [<1023dbe0>] driver_probe_device+0x48/0x90
...
> Kernel Fault: Code=26 regs=11474480 (Addr=00000004)

I don't see this with -pa2 or -pa3 on a500 or j6000.
Likely some problem with dino or ccio support.

>  IAOQ[0]: tulip_init_one+0x23c/0xdc0
>  IAOQ[1]: tulip_init_one+0x240/0xdc0
>  RP(r2): tulip_init_one+0x21c/0xdc0

Just have to figure out where in tulip_init_one() +0x240 is pointing.
I'll try to track this down after plowing through the
back-from-2-weeks-off email backlog.

> Alright. Where is the right place to send this? 

Normally just to parisc-linux@lists.p-l.o mailing list.
I've dropped debian-hppa since the bits aren't in debian (yet).

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
