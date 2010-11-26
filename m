From: Matt Turner <mattst88@gmail.com>
Subject: Re: C8000 problems, WIP patch
Date: Thu, 25 Nov 2010 22:50:36 -0500
Message-ID: <AANLkTimS9j2O79WVM1_9C41shUx8J+H+V_dU_ftLRkfw@mail.gmail.com>
References: <20101125233608.GA26896@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101125233608.GA26896@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 25, 2010 at 6:36 PM, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> 2. Is the PCI_MMAP implementation correct ? If yes, I'd split it out
> =A0 and send it with a Signed-By. Newer Xorgs need pci_mmap...

With a FireGL, you should try radeon kernel modesetting. With KMS,
pci_mmap isn't needed, I think. But that's orthogonal.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
