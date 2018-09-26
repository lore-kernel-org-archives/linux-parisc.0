From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] parisc: Remove PTE load and fault check from L2_ptep
 macro
Date: Wed, 26 Sep 2018 06:29:55 -0700
Message-ID: <4ac3d6fe-ef61-546d-e9fa-c8189edd288a@roeck-us.net>
References: <20180926032101.GA2458@roeck-us.net>
 <dcb9250d-f811-90be-2c5a-4d15cb29b474@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: jejb@parisc-linux.org, Helge Deller <deller@gmx.de>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dcb9250d-f811-90be-2c5a-4d15cb29b474@bell.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09/26/2018 05:09 AM, John David Anglin wrote:
> Hi,
> 
> On 2018-09-25 11:21 PM, Guenter Roeck wrote:
>> This patch causes my parisc qemu tests to fail.
>> Unfortunately I don't have any useful log output; the failure
>> is silent. Reverting the patch fixes the problem.
> Can you be more specific on how to run these tests?
> 
> Dave
> 

Sorry. Please see

https://github.com/groeck/linux-build-test/tree/master/rootfs/parisc

My tests enable a number of device and debug options on top of defconfig.
Those are not necessary, though. The problem can be reproduced with defconfig.

With the initrd available from there, and with an image built using 'defconfig',
run

qemu-system-hppa \
	-kernel vmlinux -no-reboot \
	-initrd rootfs.cpio.gz \
	-append 'rdinit=/sbin/init console=ttyS0,115200' \
	-nographic -monitor null

I tested with qemu 2.12 and 3.0. Using "arch/parisc/boot/bzImage" as kernel
image does not make a difference.

Note: The initrd auto-reboots. To avoid that, add "noreboot" as additional
command line option.

Hope this helps,

Guenter
