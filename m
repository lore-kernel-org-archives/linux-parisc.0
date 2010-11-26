From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: C8000 problems, WIP patch
Date: Fri, 26 Nov 2010 11:35:37 +0100
Message-ID: <20101126103537.GA29629@alpha.franken.de>
References: <20101125233608.GA26896@alpha.franken.de> <AANLkTimS9j2O79WVM1_9C41shUx8J+H+V_dU_ftLRkfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimS9j2O79WVM1_9C41shUx8J+H+V_dU_ftLRkfw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 25, 2010 at 10:50:36PM -0500, Matt Turner wrote:
> On Thu, Nov 25, 2010 at 6:36 PM, Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > 2. Is the PCI_MMAP implementation correct ? If yes, I'd split it ou=
t
> > =A0 and send it with a Signed-By. Newer Xorgs need pci_mmap...
>=20
> With a FireGL, you should try radeon kernel modesetting. With KMS,
> pci_mmap isn't needed, I think. But that's orthogonal.

this is not about mode settings, it's about how the Xorg xserver
maps framebuffer and registers. Xorg from lenny tries the old method,
which fails on the C8000 for some reason, I haven't understood, yet.
Xorg from sid only uses mapping of the pci node from sysfs, which uses
pci_mmap inside the kernel. And the current upstream parisc kernel
has not support for mapping via pci sysfs nodes.

Thomas.

--=20
Crap can work. Given enough thrust pigs will fly, but it's not necessar=
y a
good idea.                                                [ RFC1925, 2.=
3 ]
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
