From: Graham Gower <graham.gower@gmail.com>
Subject: Re: Kernel hangs with ATI video cards
Date: Fri, 1 Apr 2016 22:27:27 +1030
Message-ID: <CAFk90B_NF6WZrOHii7F+F1Hb1YE8YxpJ+nTxmO5nhsc=1N=6MQ@mail.gmail.com>
References: <CACrbsaApY_w3EcCKnvexqij4fDxedYFvcPVaZPm23wrS+i5HPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaApY_w3EcCKnvexqij4fDxedYFvcPVaZPm23wrS+i5HPg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

You need to install the firmware-linux-nonfree package. I think I just
downloaded it manually, because the package was not installable from
the hppa repo directly. But you're on a wild goose chase here. There
is no support for graphics acceleration on hppa64. Search the
archives.

I've played with both ATI and NVIDIA cards, both drivers fail during
firmware initialisation. The problem is not yet known, and from the
archives it appears several competent individuals have tinkered and
given up.

-G

On 1 April 2016 at 19:58, Simone Mannori <simone.mannori@gmail.com> wro=
te:
> Hi everyone,
>
> after a complete "dist-update" I have successfully booted with a full
> working SMP kernel:
>
> simone@blsw:~$ uname -a
> Linux blsw 4.4.0-1-parisc64-smp #1 SMP Debian 4.4.6-1 (2016-03-17)
> parisc64 GNU/Linux
>
> Switching to "graph3" console, the kernel hangs when it tried to
> initialize the video card firmware. It said: r300 firmware not
> available.
>
> The very same issue happens with two ATI video cards: a Fire GL T2 an=
d
> a FireGL X3.
>
> Now I have installed an old AGP NVIDIA; "lspci" produces
> ....
> 80:00.0 VGA compatible controller: NVIDIA Corporation NV11GL [Quadro2
> MXR/EX/Go] (rev a1)
> ....
>
> With this NVIA, everythings run fine: boot OK, MATE desktop perfect,
> monitor automatically configured, etc.
>
> During the first installation from serial terminal, after the
> automatic hardware detection, the installation program asked for the
> firmware of R300 video card (not embedded in the ditstro because
> proprietary software). I have aswered "NO" becasue I don=C3=ACt have =
this
> sofware.
> Usually, this binary blob should be included in the Linux kernel; or =
I
> have missed something ?
>
> Thanks in advance for your help.
>
> Simone Mannori - Italy
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
