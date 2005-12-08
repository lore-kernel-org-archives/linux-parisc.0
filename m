From: Andy Walker <andy@puszczka.com>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Thu, 08 Dec 2005 11:56:32 +0100 (CET)
Message-ID: <1354.193.160.141.5.1134039392.squirrel__28156.4105804593$1416624574$gmane$org@www.puszczka.com>
References: <43971676.1010009@gmail.com>
 <20051207180130.GB11417@colo.lackof.org>
 <20051207182913.GB32168@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Fabio Bizzi <fbizzi@gmail.com>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-reply-to: <20051207182913.GB32168@quicksilver.road.mcmartin.ca>
Resent-Message-ID: <nl-acC.A.BxC.UkAmDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> On Wed, Dec 07, 2005 at 11:01:30AM -0700, Grant Grundler wrote:
>> > STI GSC/PCI core graphics driver Version 0.9a
>> >     id 2bcb015a-9a02587, conforms to spec rev. 8.04
>> > STI init_graph failed (ret -1, errno 258)
>> > sti: probe of 10:8 failed with error 1
>
> Someone should probably turn on debugging. Edit
> drivers/video/sticore.h and change the initial #if 0 to #if 1 and
rebuild and boot.
>
> As far as I know, this is failing the initial call to STI init_graph, I
suspect either it doesn't like the default init values, or something is
not quite right when setting up the glob_cfg. As I understand it, we set
up the glob_cfg structures with nothing but the region pointers, and
then call init_graph to set up the rest of the context which is
passed
> between every further called STI function.
>
> Or the STI rom is completely broken on this card and HP-UX uses software
instead of the firmware routines.
>
> I think I have a HCRX here (A4070 with A4072), I can try and fix this
but not until at least January.
>
> Cheers,
> 	Kyle
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Hi folks,

Here's a datapoint with 2.6.15-rc5-pa1 on a B132L

Linux version 2.6.15-rc5-pa1 (root@weasel) (gcc version 3.3.5 (Gentoo Linux
3.3.5-r1, pie-8.7.7)) #1 Wed Dec 7 23:02:54 CET 2005

Kernel command line: root=/dev/sda2 sti=8/8 stifb=bpp:0 console=tty0
sti_font=VGA8x16 palo_kernel=2/boot/vmlinux

Found devices:
15. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 } 16.
Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085 },
additional addresses: 0xf0011000

STI GSC/PCI core graphics driver Version 0.9a
    id 2bcb015a-9a02587, conforms to spec rev. 8.04
    graphics card name: HPA4071B
    id 2d08c0a7-9a02587, conforms to spec rev. 8.07
    graphics card name: INTERNAL_EG_1280
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, HPA4071B, id: 2bcb015a, mmio:
0xf4100000
fb1: stifb 1280x1024-8 frame buffer device, INTERNAL_EG_1280, id:
2d08c0a7, mmio:
0xf8100000

Note that the A4071B/HCRX24 gets detected just fine. Its set in PDC as
the console path, and also via the sti=8/8 parameter.

Nothing crashes, but the console is unusable. Most of the output is
black on black, though I get bits of text in magenta, yellow and green
depending on the intended colour. Tux has a bright green background and
is otherwise pretty psychedelic. Back to Vis-EG for the time being.

As far as A4071B on C-Class goes, my company ran 50-60 C110's with that
card and never had any trouble (HP-UX 10.20). I'm pretty sure I've had
one in my C180 and it behaved exactly as it does in the B132L. If I get
time I'll check tonight. C180 and C200 are basically the same Raven
architecture, so if there's a general problem with initializing the card
on Ravens it should show up.

Fabio: have you got the latest firmware on that C200? (apologies if you've
already mentioned that before.)

ftp://ftp.itrc.hp.com/firmware_patches/hp/cpu/PF_CC2X0063.txt
ftp://ftp.itrc.hp.com/firmware_patches/hp/cpu/PF_CC2X0063

-Andy




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
