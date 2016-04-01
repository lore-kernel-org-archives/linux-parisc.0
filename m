From: Simone Mannori <simone.mannori@gmail.com>
Subject: Kernel hangs with ATI video cards
Date: Fri, 1 Apr 2016 11:28:13 +0200
Message-ID: <CACrbsaApY_w3EcCKnvexqij4fDxedYFvcPVaZPm23wrS+i5HPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi everyone,

after a complete "dist-update" I have successfully booted with a full
working SMP kernel:

simone@blsw:~$ uname -a
Linux blsw 4.4.0-1-parisc64-smp #1 SMP Debian 4.4.6-1 (2016-03-17)
parisc64 GNU/Linux

Switching to "graph3" console, the kernel hangs when it tried to
initialize the video card firmware. It said: r300 firmware not
available.

The very same issue happens with two ATI video cards: a Fire GL T2 and
a FireGL X3.

Now I have installed an old AGP NVIDIA; "lspci" produces
=2E...
80:00.0 VGA compatible controller: NVIDIA Corporation NV11GL [Quadro2
MXR/EX/Go] (rev a1)
=2E...

With this NVIA, everythings run fine: boot OK, MATE desktop perfect,
monitor automatically configured, etc.

During the first installation from serial terminal, after the
automatic hardware detection, the installation program asked for the
firmware of R300 video card (not embedded in the ditstro because
proprietary software). I have aswered "NO" becasue I don=C3=ACt have th=
is
sofware.
Usually, this binary blob should be included in the Linux kernel; or I
have missed something ?

Thanks in advance for your help.

Simone Mannori - Italy
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
