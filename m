From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: ab3100_core.c fails to build w/ gcc-4.3.3 on hppa
Date: Sat, 15 Aug 2009 16:36:28 +0200
Message-ID: <63386a3d0908150736ke9bfb14j3a885fef848bafbb@mail.gmail.com>
References: <20090811154038.GA10371@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: dann frazier <dannf@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090811154038.GA10371@ldl.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/8/11 dann frazier <dannf@debian.org>:

> hey,
> =A0While testing a 2.6.31-rc5-based snapshot of the Debian kernel
> builds, I hit this build failure:
>
> /home/dannf/linux-2.6-2.6.31~rc5/debian/build/source_hppa_none/driver=
s/mfd/ab3100-core.c:563:
> warning: initialization from incompatible pointer type

I think I have fixed this problem atleast.

> /home/dannf/linux-2.6-2.6.31~rc5/debian/build/source_hppa_none/driver=
s/mfd/ab3100-core.c:647:
> error: ab3100_init_settings causes a section type conflict

Still wandering in darkness about this one :-(
The init_settings are __initdata and the function using it is __init,
I don't get it...

> Same source/compiler seems to build fine on other archs.

Never saw it anywhere else. Is there something special in the parisc li=
nkfile?

Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
