From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 0/8] constify parisc parisc_device_id
Date: Mon, 21 Aug 2017 22:42:42 +0200
Message-ID: <30fb04dd-118e-d866-0166-2f9a8e67ff1a@gmx.de>
References: <1503164546-31433-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, jejb@parisc-linux.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503164546-31433-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Arvind,

On 19.08.2017 19:42, Arvind Yadav wrote:
> parisc_device_id are not supposed to change at runtime. All functions
> working with parisc_device_id provided by <asm/parisc-device.h> work with
> const parisc_device_id. So mark the non-const structs as const.

Basically your patches are correct, but those structs aren't used
after bootup any longer.
So, they are much better placed in the __initconst or __initdata
sections so that they get dropped before the kernel enters userspace.
Changing it to __initconst includes more changes to those files
than just changing one line.

So, I won't apply your patches.
Instead I've hacked up new versions in my tree which move those to 
__init* sections.

Anyway, thanks for your patches!

Helge 
 
> Arvind Yadav (8):
>   [PATCH 1/8] parisc: asp: constify parisc_device_id
>   [PATCH 2/8] parisc: ccio: constify parisc_device_id
>   [PATCH 3/8] parisc: dino: constify parisc_device_id
>   [PATCH 4/8] parisc: hppb: constify parisc_device_id
>   [PATCH 5/8] parisc: lasi: constify parisc_device_id
>   [PATCH 6/8] parisc: lba_pci: constify parisc_device_id
>   [PATCH 7/8] parisc: sba_iommu: constify parisc_device_id
>   [PATCH 8/8] parisc: wax: constify parisc_device_id
> 
>  drivers/parisc/asp.c         | 2 +-
>  drivers/parisc/ccio-rm-dma.c | 2 +-
>  drivers/parisc/dino.c        | 2 +-
>  drivers/parisc/hppb.c        | 2 +-
>  drivers/parisc/lasi.c        | 2 +-
>  drivers/parisc/lba_pci.c     | 2 +-
>  drivers/parisc/sba_iommu.c   | 2 +-
>  drivers/parisc/wax.c         | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 
