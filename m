From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Wed, 7 Dec 2005 11:01:30 -0700
Message-ID: <20051207180130.GB11417__6591.86730995334$1416624571$gmane$org@colo.lackof.org>
References: <43971676.1010009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Fabio Bizzi <fbizzi@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43971676.1010009@gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 07, 2005 at 06:05:58PM +0100, Fabio Bizzi wrote:
> Hi Everybody!   :)
> 
> Yesterday I've got a monitor and I've connected it to my C200.
> At the boot I've selectet 1280x1024@75Hz VESA and the screen is 
> correctly displayed.
> The Graphic adapter is an HCRX-24 (A4071B) on GSC.
> The distribution is a Sarge with etch kernel 2.6.12-1
> The system boots correctly, but no one consolle is displayed on the 
> monitor only a blank screen (no other problems), I've checked inittab 
> and it's ok with all the consoles started!
> Here some DMESG output:
> 
> Kernel command line: root=/dev/sda5 HOME=/ console=tty0 sti=8/4 
> sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux
> 
> 14. Coral SGC Graphics at 0xf8000000 [10/8] { 10, 0x0, 0x004, 0x00077 }
> 
> STI GSC/PCI core graphics driver Version 0.9a
>     id 2bcb015a-9a02587, conforms to spec rev. 8.04
> STI init_graph failed (ret -1, errno 258)
> sti: probe of 10:8 failed with error 1

This has never worked and I don't know why.
See:
	http://lists.debian.org/debian-hppa/2003/10/msg00073.html
	http://lists.debian.org/debian-hppa/2005/02/msg00120.html

> Complete dmesg is attached.
> 
> I've also tried to change boot args in palo from sti=8/4 to sti=10/0 but 
>  it didin't worked!

I've previously asserted one does NOT need the sti= parameter if
there is only gfx card in the system and it's being used as the
firmware console. I don't know if that's still true.

> At Parisc-Linux Hardware Database is reported that Coral SGC Graphics is 
> supported and the version is the same "0x0,0x4,0x77" 
> (http://hwdb.parisc-linux.org/view.php?type=padevice&name=Coral%20SGC%20Graphics)
> 
> So, why this damned kernel does not initialize it? :)

STI firmware is failing to initialize itself, not the kernel
initializing the card.

> P.S. I've experienced some mail server problems, i'm sorry for eventual 
> duouble posts!

Double would have been nice. ;)
Next time, check the mailing list archives to determine if a particular
email reached the list(s).

ciao,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
