Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F9CF4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jun 2003 04:07:05 -0600 (MDT)
Date: Mon, 16 Jun 2003 12:07:02 +0200
Message-ID: <3ED725B100003425@ocpmta8.freegates.net>
In-Reply-To: <20030615161948.GA12995@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Re: HP C180 video card
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Joel Soete" <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>>
>>On Sun, Jun 15, 2003 at 04:11:46PM +0000, Joel Soete wrote:
>> I tried to use a "PGX64 alias Rage xl " pluged in the first slot of my

>> b180L. It seems to be well supported by kernel 2.4.21 (modeprobe 
>> ati128fb; # modules were well loaded).

# lsmod
Module                  Size  Used by    Not tainted
aty128fb               20244   0  (unused)
fbcon-cfb32             5956   0  [aty128fb]
fbcon-cfb8              5244   0  [aty128fb]
fbcon-cfb24             5876   0  [aty128fb]
fbcon-cfb16             5828   0  [aty128fb]

>cool - that's a good first step. I don't know where to go from there.
>
>> But no success to make XFree86 
>> works (fbset /dev/fb0 not found)

>Maybe it's as simple as "mknod /dev/fb0 ..." ?

I do it (rm /dev/fb*; cd /dev ; MAKEDEV fb; fb* were well rebuild) but no
more success?

>> if the driver loads without complaining, I'd expect fbset command
>> to work too.

Hope so too.

Even "cat /proc/fb" don't show me anything?

>> and even when I change console path to 
>> graphics(1[a]) I never reach to obtain boot prompt on the screen (which

>> never seems to recieve init signal?).
>
>PDC/IODC/STI won't know anything about the Rage XL card.
>There's no way you can use that as a console.

Ok so I swicth to "path con serial_1"

>> I do not understand, it seems to be a common pci gfx card? any idea?

>I don't either really. Just guessing.

Just in case some more X(pert) read this mail, here is some more info:

root@fw02:/CVS/SRC.TMP# lspci
00:01.0 VGA compatible controller: ATI Technologies Inc Rage XL (rev 27)
00:02.0 Serial controller: Equinox Systems, Inc.: Unknown device 90f0 (rev
04)
...

/var/log/XFree86.0.log:
[...]
(WW) Open APM failed (/dev/apm_bios) (No such file or directory)
(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:01:0: chip 1002,4752 card 0000,0000 rev 27 class 03,00,00 hdr
00
(II) PCI: 00:02:0: chip 113f,90f0 card 0000,0000 rev 04 class 07,00,80 hdr
00
(II) PCI: 00:13:0: chip 1000,000f card 0000,0000 rev 04 class 01,00,00 hdr
00
(II) PCI: 00:14:0: chip 1011,0019 card 103c,104f rev 41 class 02,00,00 hdr
00
(II) PCI: End of PCI scan
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (-1,0,0), BCTRL: 0x00 (VGA_EN is cleared)
(II) Bus 0 I/O range:
        [0] -1 0        0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
(--) PCI:*(0:1:0) ATI Mach64 GR rev 39, Mem @ 0xf1000000/24, 0xf0fec000/12,
I/O @ 0xfd00/8, BIOS @ 0xf0f80000/17
(II) Addressable bus resource ranges are
        [0] -1 0        0x00000000 - 0xffffffff (0x0) MX[B]
        [1] -1 0        0x00000000 - 0x0000ffff (0x10000) IX[B]
[...]
(II) FBDEV: driver for framebuffer: fbdev
(II) VGA: Generic VGA driver (version 4.0) for chipsets: generic
(II) v4l driver for Video4Linux
(II) Primary Device is: PCI 00:01:0
(EE) open /dev/fb0: No such device
(EE) No devices detected.

Fatal server error:
no screens found


Thanks for your attention,
    Joel


---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
