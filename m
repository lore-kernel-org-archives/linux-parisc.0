Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 707FE48A3
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Oct 2003 07:51:24 -0600 (MDT)
Date: Thu, 16 Oct 2003 15:51:11 +0200
Message-ID: <3F8A29A2000025F8@ocpmta1.freegates.net>
In-Reply-To: <Pine.LNX.4.10.10310151939440.181-102000@headcount.blah.pl>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] ATI rage xl and C360 (it works!)
To: hinzen@blah.pl
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

Thomas,

Thanks a lot, you config file was very helpfull to make it work:
root@fw02:~# modprobe atyfb
atyfb: using auxiliary register aperture
atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
230 MHz PLL, 83 Mhz MCLK, 63 Mhz XCLKConsole: switching to colour frame buffer
device 80x30
fb0: ATY Mach64 frame buffer device on PCI
root@fw02:~# lsmod
Module                  Size  Used by    Not tainted
atyfb                  29232  63 
fbcon-cfb16             5620   0  [atyfb]
fbcon-cfb8              5164   0  [atyfb]
fbcon-cfb32             5780   0  [atyfb]
fbcon-cfb24             5892   0  [atyfb]
root@fw02:~# tail -f /var/log/syslog
[...]
Oct 16 13:16:46 fw02 kernel: atyfb: using auxiliary register aperture
Oct 16 13:16:46 fw02 kernel: atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27]
8M WRAM, 14.31818 MHz XTAL, 230 MHzKOct 16 13:16:46 fw02 kernel: Console:
switching to colour frame buffer device 80x30
Oct 16 13:16:46 fw02 kernel: fb0: ATY Mach64 frame buffer device on PCI

and also fbset works fine:
root@fw02:/Sources# fbset --test

mode "640x480-60"
    # D: 25.172 MHz, H: 31.466 kHz, V: 59.934 Hz
    geometry 640 480 640 480 8
    timings 39726 48 16 33 10 96 2
    accel true
    rgba 8/0,8/0,8/0,0/0
endmode

root@fw02:/Sources# fbset 1024x768-60
root@fw02:/Sources# fbset --test

mode "1024x768-60"
    # D: 64.666 MHz, H: 48.115 kHz, V: 59.696 Hz
    geometry 1024 768 1024 768 8
    timings 15464 160 24 29 3 136 6
    accel true
    rgba 8/0,8/0,8/0,0/0
endmode

:)

Nice :). I just have to make works Xserver (xdm complaining to not find /usr/X11R6/lib/X11/xdm/Xsetup.
I will try to remember why)

Many thanks again,
    Joel

>-- Original Message --
>From: Tomasz Hinzmann <hinzen@blah.pl>
>Reply-To: hinzen@blah.pl
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: parisc-linux@lists.parisc-linux.org
>Date: Wed, 15 Oct 2003 20:21:35 +0200 (CEST)
>Subject: RE: [parisc-linux] ATI rage xl and C360 (it works!)
>
>
>
On Wed, 15 Oct 2003, Joel Soete wrote:

> Sorry but on the b180L on wich card is pluged in, i boot a kernel with
module
> support and build the new atyfb module and when I modprobe it the system
> crash (without oops message :( ).
> The only mes
>age I got is:
> atyfb: using auxiliary register aperture
> atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
> 230K
> 
> which seems more relevant then previous test (with original atyfb support).

Hi Joel,
this is wha
> I read when I modprobe the driver:

...
bigmama:~# modprobe atyfb
atyfb: using auxiliary register aperture
atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
230
MHz PLL, 83 Mhz MCLK, 63 Mhz XCLK
Console: switching to c
>lour frame buffer device 80x30
fb0: ATY Mach64 frame buffer device on PCI
bigmama:~# 
...

I also run a kernel with the driver built-in and it behaves fine.

> Never the less, I would like very much that it works and so ask you the
favor
> to s
>nd me your .config file to be sure I do not lost anything :) (btw with
> your XF86Config-4 :) )

Please find both configs attached; I hope they'll be helpful.

Thanks,
t.

-- 
hinzen@blah.pl

>
>Attachment: XF86Config-4.gz
>
>
>Attachment: config-2.4.22-pa12.gz
>


-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
