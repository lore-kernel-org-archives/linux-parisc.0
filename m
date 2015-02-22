From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
 - optimized patches
Date: Sun, 22 Feb 2015 19:28:26 +0100
Message-ID: <54EA1FCA.1050609@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl> <201312191619.05005.vapier@gentoo.org> <5313A12E.7010307@gmx.de> <20140401182627.GA3285@drone.musicnaut.iki.fi> <533B0A57.2060700@gmx.de> <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com> <533C7C9A.5080703@gmx.de> <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl> <533DB961.9010607@gmx.de> <BLU0-SMTP7204937E7AF88D8736354E976C0@phx.gbl> <533DC3E8.5010701@gmx.de> <CAE2sS1iY6H3fnEJDHr6oPGywwGYmM_2gt2r_p+DUz+v0Rf2szg@mail.gmail.com> <BLU436-SMTP15952414B35EC498F0793B1972B0@phx.gbl> <BLU437-SMTP9274AAFB2636BF93781F02972B0@phx.gbl> <1424560158.2146.22.camel@HansenPartnership.com> <54E9141B.4050009@gmx.de> <1424563046.2146.41.camel@HansenPartnership.com> <BLU436-SMTP737CEA
 AA0E7C3EAEFB9DB097280@phx.gbl> <1424625475.2146.88.camel@HansenPartnership.com> <BLU437-SMTP61AF76DB80DF7F81524FCC97280@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP61AF76DB80DF7F81524FCC97280@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 22.02.2015 18:54, John David Anglin wrote:
> At one time, we thought this value needed to be 4 MB.
> Helge was working on improving the mmap allocation scheme but this
> work stalled after some improvement.

The patches are still available:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=parisc-mmap&id=34ae0a4620b50d27ce2f1314322275cbea7f2055
and
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=parisc-mmap&id=7a6e51ddfd3ab3b11a4ebdd995e26672e69a8efa

Basically the idea is:
- Currently we have a static calculation where the mapping should happen inside the 4MB range:
   see: arch/parisc/kernel/sys_parisc.c: (filp ? ((unsigned long) filp->f_mapping) >> 8 : 0UL)
- Replace that by a dynamic mapping, which searches best fit address in free mem area *if* the file hasn't been mapped yet, and save this mapping in the struct address_space. If another process then maps the same file again, then just reuse the last calculated "dynamic" mapping (offset).

This helps a lot to prevent userspace memory fragmentation, but Linus didn't liked this approach and proposed instead:
  https://lkml.org/lkml/2014/5/1/368

Sadly his patch didn't worked out of the box. I did tried various ways (I'm sure it can work somehow), but I couldn't solve it yet.
Maybe some Linux mm expert could help here?

Helge   
