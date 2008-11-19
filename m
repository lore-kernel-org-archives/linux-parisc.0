From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Wed, 19 Nov 2008 02:33:10 +0100
Message-ID: <7d01f9f00811181733q268a7221m256f4845494253b7@mail.gmail.com>
References: <49231FD0.9040409@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49231FD0.9040409@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 18, 2008 at 9:04 PM, Helge Deller <deller@gmx.de> wrote:

> Here ist just one of the latest crashes (c3k, UP, CONFIG_SMP not set,
> 2.6.28-rc5):
> .....
> SuperIO: ACPI at 0x7e0
> SuperIO: USB regulator enabled
> PDC Stable Storage facility v0.30
> Backtrace:
>  [<1018b6a4>] __kmalloc+0xa4/0xec
>  [<101718f4>] kstrdup+0x38/0x6c
>  [<101d9090>] sysfs_new_dirent+0x54/0xf4
>  [<101da0dc>] sysfs_do_create_link+0xcc/0x19c
>  [<106cd644>] pdc_stable_init+0x1cc/0x2b4

Wild guess since my baby's into this mess: somebody fucked
up^W^Wmodified some code in sysfs and didn't care enough about the
consequences.

Last time this code was touched it was Greg KH updating it for sysfs
changes, and the backtrace seems to point in that area again, hence
the guess...

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
