From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 5/5] PA-RISC: fix compile errors
Date: Wed, 9 May 2012 18:22:09 -0400
Message-ID: <CAEdQ38H4MjAGKYW3jbcRs98qKnikPwgN_0k2KWbK8wLmJa8xxQ@mail.gmail.com>
References: <Pine.LNX.4.64.1205091758310.1272@file.rdu.redhat.com>
 <Pine.LNX.4.64.1205091816470.1272@file.rdu.redhat.com> <Pine.LNX.4.64.1205091817170.1272@file.rdu.redhat.com>
 <Pine.LNX.4.64.1205091818160.1272@file.rdu.redhat.com> <Pine.LNX.4.64.1205091818430.1272@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: torvalds@linux-foundation.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205091818430.1272@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 9, 2012 at 6:19 PM, Mikulas Patocka <mpatocka@redhat.com> w=
rote:
> From: Rolf Eike Beer <eike-kernel@sf-tec.de>
>
> This was defined in asm/pdc.h which needs to include asm/page.h for
> __PAGE_OFFSET. This leads to an include loop so that page.h eventuall=
y will
> include pdc.h again. While this is no problem because of header guard=
s, it is
> a problem because some symbols may be undefined. Such an error is thi=
s:
>
> In file included from /home/buildbot/repos/linux/include/linux/bitops=
=2Eh:35:0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/inclu=
de/asm-generic/getorder.h:7,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/arch/=
parisc/include/asm/page.h:162,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/arch/=
parisc/include/asm/pdc.h:346,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/arch/=
parisc/include/asm/processor.h:16,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/arch/=
parisc/include/asm/spinlock.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/arch/=
parisc/include/asm/atomic.h:20,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/inclu=
de/linux/atomic.h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/inclu=
de/linux/sysfs.h:20,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/inclu=
de/linux/kobject.h:21,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/inclu=
de/linux/device.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/inclu=
de/linux/eisa.h:5,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/buildbot/repos/linux/arch/=
parisc/kernel/pci.c:11:
> /home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h: In funct=
ion "set_bit":
> /home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h:82:2: err=
or: implicit declaration of function "_atomic_spin_lock_irqsave" [-Werr=
or=3Dimplicit-function-declaration]
> /home/buildbot/repos/linux/arch/parisc/include/asm/bitops.h:84:2: err=
or: implicit declaration of function "_atomic_spin_unlock_irqrestore" [=
-Werror=3Dimplicit-function-declaration]
>
> Signed-off-by: Rolf Eike Beer <eike-kernel@xxxxxxxxx>

Email address got eaten?

> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
