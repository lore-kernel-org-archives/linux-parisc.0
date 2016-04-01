From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Kernel hangs with ATI video cards
Date: Fri, 1 Apr 2016 15:11:43 +0200
Message-ID: <CACrbsaAdyUQFSJpq9h859LX5z2Kixr2HJLQvWqeDsBgKRVn00A@mail.gmail.com>
References: <CACrbsaApY_w3EcCKnvexqij4fDxedYFvcPVaZPm23wrS+i5HPg@mail.gmail.com>
	<CAFk90B_NF6WZrOHii7F+F1Hb1YE8YxpJ+nTxmO5nhsc=1N=6MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Graham Gower <graham.gower@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAFk90B_NF6WZrOHii7F+F1Hb1YE8YxpJ+nTxmO5nhsc=1N=6MQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Success!

As you have suggested, I have manually downloaded the package

--> firmware-linux-nonfree_0.36+wheezy.1_all.deb

from here:

https://packages.debian.org/wheezy/all/firmware-linux-nonfree/download

then I have installed it (as root) with "dpkg -i
firmware-linux-nonfree_0.36+wheezy.1_all.deb"

During the installation of the deb package, the initramdisk of the
kernel has been automatically updated with the proprietary firmware.

As you have correctly point out, both the previously working NVIDIA
QUADRO MXR 32M and the actual FileG2 T2

VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
RV350 GL [FireGL T2] (rev 80)

have DRI/OpenGL support in software (no hardware acceleration):

OpenGL vendor string: Mesa Project
OpenGL renderer string: Software Rasterizer
OpenGL version string: 2.1 Mesa 11.1.2
OpenGL shading language version string: 1.20

This is _very_strange because both "nouveau" and "radeon" should
support OpenGL / DRI in hardware ! Apparently, they run OK (X11 is OK)
but they switch to software rendering.

Question: inside X11 drivers, video card register setting is done
directly OR via VGA BIOS? In the second case, video card BIOS contains
x86 code that cannot be executed by pa risc processors (this is the
reason because the c8000 BIOS include an x86 emulator to set-up the
video card as console). This is a possible clue to find the source of
this issue.

Anyway, just a loose cannon like me can chase a wilde goose :-).

  Simone Mannori - Italy




On 01/04/2016, Graham Gower <graham.gower@gmail.com> wrote:
> You need to install the firmware-linux-nonfree package. I think I jus=
t
> downloaded it manually, because the package was not installable from
> the hppa repo directly. But you're on a wild goose chase here. There
> is no support for graphics acceleration on hppa64. Search the
> archives.
>
> I've played with both ATI and NVIDIA cards, both drivers fail during
> firmware initialisation. The problem is not yet known, and from the
> archives it appears several competent individuals have tinkered and
> given up.
>
> -G
>
> On 1 April 2016 at 19:58, Simone Mannori <simone.mannori@gmail.com> w=
rote:
>> Hi everyone,
>>
>> after a complete "dist-update" I have successfully booted with a ful=
l
>> working SMP kernel:
>>
>> simone@blsw:~$ uname -a
>> Linux blsw 4.4.0-1-parisc64-smp #1 SMP Debian 4.4.6-1 (2016-03-17)
>> parisc64 GNU/Linux
>>
>> Switching to "graph3" console, the kernel hangs when it tried to
>> initialize the video card firmware. It said: r300 firmware not
>> available.
>>
>> The very same issue happens with two ATI video cards: a Fire GL T2 a=
nd
>> a FireGL X3.
>>
>> Now I have installed an old AGP NVIDIA; "lspci" produces
>> ....
>> 80:00.0 VGA compatible controller: NVIDIA Corporation NV11GL [Quadro=
2
>> MXR/EX/Go] (rev a1)
>> ....
>>
>> With this NVIA, everythings run fine: boot OK, MATE desktop perfect,
>> monitor automatically configured, etc.
>>
>> During the first installation from serial terminal, after the
>> automatic hardware detection, the installation program asked for the
>> firmware of R300 video card (not embedded in the ditstro because
>> proprietary software). I have aswered "NO" becasue I don=C3=ACt have=
 this
>> sofware.
>> Usually, this binary blob should be included in the Linux kernel; or=
 I
>> have missed something ?
>>
>> Thanks in advance for your help.
>>
>> Simone Mannori - Italy
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pari=
sc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
