From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] booting a 9000/785/C8000
Date: Tue, 4 Sep 2007 22:17:56 +0200
Message-ID: <200709042217.57061.deller__33247.2069575035$1416624431$gmane$org@gmx.de>
References: <200708311602.04193.rickv@hobi.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200708311602.04193.rickv@hobi.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Friday 31 August 2007, Rick Vernam wrote:
> I'm new to parisc (hppa) machines - never touched one before.
> I'm trying to boot into linux so that i can do a simple
> 	dd if=/dev/null of=/dev/[hard drive]
> I have about 25-30 machines to work on, so I'm looking for a rather clean 
> solution :-)
> 
> I've tried both Gentoo's and Debian's hppa offerings, but am having the same 
> problems on both (i've used gentoo x86/amd64 for years...):
> 1 - I can boot with 'console=tty0 sti=0/4/0/0' (as added by palo) and the boot 
> process will stop with
> 	Console: colour dummy device 160x64
> at this point, it is not hard locked - I can ctrl-alt-del to reboot.  it would 
> probably sit there indefinitely - I did leave it for about 16-18 hours 
> (running when I left work, still there the next day).
> 2 - I can boot without the 'console=tty0' and the kernel will load, but then 
> fail when it can't find initial console (panic: kernel not syncing).
> 
> I've tried with both the AGP 8x Fire GL X1 that comes in the machine, and a 
> PCI Rage XL of some sort.
> 
> The Gentoo kernel is 2.6.20 (most recent livecd, 2007.0), and debian's is also 
> recent cd with 2.6.18 kernel.
> In both cases, the complete kernel command line were pretty much the same 
> (maybe they varied in looptype? ...and order of arguments)
> 
> TERM=linux root=/dev/ram0 init=/linuxrc cdroot looptype=normal 
> loop=/image.loop hda=scsi hdb=scsi console=tty0 sti=/0/4/0/0 sti_font=VGA8x16 
> palo_kernel=0/vmlinux
> 
> while it is doing whatever it does prior to when it can be stopped to specify 
> a boot path (analogous to x86 post?) it does say something along the lines 
> of:
> 	console device			graph3
> 						0/4/0/0.0
> 	current console device	graph3
> 						0/04/0/0.256
> 
> So, upon seeing that tried to set the sti= kernel arg to those values, but 
> found the same results.
> 
> anybody, anything?

Yes.
Probably the reason is, that you are using unsupported graphic cards. 
Both, the Fire GL and the Rage XL are not supported, although maybe the Rage XL could be made working (if a developer will/can try).
Please see http://parisc-linux.org/faq/index.html#fxgfx  and  http://parisc-linux.org/faq/graphics-howto.html

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
