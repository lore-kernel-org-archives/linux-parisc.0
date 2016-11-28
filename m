From: Helge Deller <deller@gmx.de>
Subject: Re: Aw: Re: parsic: strange boot crash on a500
Date: Mon, 28 Nov 2016 20:41:21 +0100
Message-ID: <664aac8f-f2cd-07bd-9fad-c65ec21d314f@gmx.de>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
 <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
 <alpine.LRH.2.20.1611272329430.19497@math.ut.ee>
 <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>
 <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
 <trinity-e31b21fb-9eb0-43ac-9d20-c8882740e7d6-1480347397040@3capp-gmx-bs03>
 <trinity-2cc16b5d-53b2-4332-8a92-566526865345-1480347604360@3capp-gmx-bs71>
 <alpine.LRH.2.20.1611282036240.11649@math.ut.ee>
 <02c86f80-c5c8-c652-21b4-2a32d51c15fe@gmx.de>
 <98c1d3ba-53be-57f6-5a06-5c4895c4bf6c@gmx.de>
 <alpine.LRH.2.20.1611282220060.12618@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1611282220060.12618@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Meelis,

On 28.11.2016 21:23, Meelis Roos wrote:
>> The only differences I currently see between your and my setup are:
>> 1. My palo partition contains a vmlinux file (you need to add a vmlinux file to your /etc/palo.conf file and rerun "palo -v").
> 
> I pondered about that - what do you mean...

Inside the palo partition, a vmlinux & initrd file can be stored,
just in case if /boot isn't readable.
Those two files need to be configured in /etc/palo.conf with those parameters:
--recoverykernel=/boot/vmlinux.recovery
--ramdisk=/boot/initrd.recovery
Afterwards you need to run "palo -v" once.

When the IPL loader from palo is started, you can select those kernel/initrd files
via partition "0", e.g. 0/vmlinux and 0/initrd.
partition 1 is the palo partition, partition 2 is usually the /boot (ext2) partition.

It's a fallback solution for booting a system.
 
> and then it dawned on me - I have wrong symlink under /boot. On most 
> machines I have symlink named test that points to my latest test kernel, 
> but on parisc I had default vmlinux since installerkenl worked out of 
> the box with it. So it just worked, until I removed vmlinux and created 
> "test" symlink by mistake whern testing 4.9-rc*. Now I recreated the 
> vmlinux symlink and the new kernels just work.
> 
> So it was a bad user error my side, probably from staying up too late 
> some day :)
> 
> However, palo seems to miss error handling in that case.

Agreed, I'll try to fix that.

>> 2. In my setup I didn't added "console=ttyS0". palo does that by itself if you run via serial console.
> 
> Yes, I removed it and serial console just keeps working.

Ok.

> Thank you!

No problem.
Helge

