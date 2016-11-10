From: Richard Henderson <rth@twiddle.net>
Subject: Re: Aw: hppa qemu and string functions
Date: Thu, 10 Nov 2016 10:38:51 +0100
Message-ID: <8367e614-68db-c3a2-bb32-c314c42a7b58@twiddle.net>
References: <21645bc2-f005-5e60-d26a-41af60e3c035@twiddle.net>
 <trinity-8a5a9da3-1e08-4571-bbfb-b230bd20f15b-1478703076818@3capp-gmx-bs52>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc@vger.kernel.org,
        GNU C Library <libc-alpha@sourceware.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-8a5a9da3-1e08-4571-bbfb-b230bd20f15b-1478703076818@3capp-gmx-bs52>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/09/2016 03:51 PM, Helge Deller wrote:
> Hi Richard,
>
>> Off and on, I've been working on a user-only target of hppa to qemu.  It's now
>> about 95% working.  If anyone would like to try it out, it's available at
>>    git://github.com/rth7680/qemu.git tgt-hppa
>
> COOL!
> I'm happy to test, but can you shortly describe the required steps how I can build & test it?

Check out the indicated branch, configure --target-list=hppa-linux-user, make, 
install.  qemu-hppa will be the user-mode emulator.

>
> With "user-only target of hppa" I assume this means that I can run hppa binaries
> on e.g. x86-64, similiar to what is described here: https://wiki.debian.org/QemuUserEmulation ?

Yes, exactly.


r~
