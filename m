From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] C240 and Linux 2.6.x
Date: Fri, 31 Dec 2004 13:27:39 +0000
Message-ID: <41D553CB.6070802__24606.8084416494$1416624523$gmane$org@tiscali.be>
References: <20041230231420.GA15674@nilpferd.asyl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: Alexander Bartolich <alexander.bartolich@gmx.at>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041230231420.GA15674@nilpferd.asyl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Alexander,

Alexander Bartolich wrote:
> I have a C240 satisfyingly running Debian Testing and kernels
> from 2.4.17 to 2.4.27-pa4, both stock and custom compiled.
> 
> However, no variation of 2.6.x ever booted. Since the last message
> I see is that infamous »you may need to switch your console« I
> eventually organized a serial cable, a second machine running
> minicom and got the same result:
> 
[...]
> 
> Where is this FAQ item mentioned above?
Simply at <http://www.parisc-linux.org/> :-)

> And how is this ment, anyway?
> Just switching consoles within HP's »BIOS«,
Two possibility:
     1) disconect all kdb from builtin interfaces (on my c110 there are ps2 and hp-hil) then pdc (hp's 'bios') will switch 
automaticaly to serial port 1 as console (then booting kernel will also use this)
     2) at pdc boot prompt (Main Menu: Enter command or menu > ) (this is the one of my c110) choose submenu "COnfiguration menu" in 
which option "PAth [PRI|ALT] [<path>]" would help you to select your console (see: help path) (e.g. to set serial1 as console: "path 
con serial_1"

> or passing some arguments via /etc/palo.conf,
only requested for some k model iirc (to force kernel to use ttyB0 for the mux)

> or compiling the kernel with different settings?
> 
At a first glance I would try first the b180 config (a quick look at <http://www.openpa.net/index.html>, seems to me the nearest):
prebuild kernel for different model are available at <http://cvs.parisc-linux.org/download/linux-2.6/> (see instruction at the top 
of page to install package :-)

or build your own: in the subdir arch/parisc/configs/ you would find b180_defconfig which you copy as .config in the top of your 
kernel tree then "make oldconfig; make vmlinux" ;-)

> I'd really like to help more, but without any diagnostics of 2.6.x ...
> Well, here is the start of dmesg when booting with a custom compiled
> kernel:
> 
Not trivial exercise, but you can try to build an equivalent one for 2.6 (simply copy the 2.4 .config into 2.6 was not enough for my 
c110, I realy have to check option by option)

[...]
> STI device: HPA4554A
> stifb: Unsupported gfx card id 0x2fc1066b
A few gfx card are supported (lack of doc) :-(

Even thought some foreign pci card (some ATI and Vodoo iirc) are reported to works (not using stifb obviously because couldn't be 
detected by pdc) for X (see m-l: <http://www.parisc-linux.org/mailing-lists/index.html> )

Hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
