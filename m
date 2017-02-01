From: Helge Deller <deller@gmx.de>
Subject: Re: crashes in 4.10 because of "parisc: Enable KASLR"
Date: Wed, 1 Feb 2017 20:54:57 +0100
Message-ID: <b24dbc17-2e13-0630-7969-3d12fe8d11bb@gmx.de>
References: <alpine.LRH.2.02.1702011234060.25046@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1702011234060.25046@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Mikulas,

On 01.02.2017 18:37, Mikulas Patocka wrote:
> I had some crashes on parisc with the kernel 4.10 and I tracked them to 
> the patch 18d98a79382cbe5a7569788d5b7b18e7015506f2 "parisc: Enable KASLR".

If the patch is really guilty, then it's probably best to revert it
before 4.10 gets released, but...

> The crashes can be reproduced by compiling kernel in a loop - a crash 
> happens in a few hours. I have a C8000 workstation with two dual-core 
> PA8900 CPUs.
> 
> The kernel 4.9 is stable, 4.9 with the patch 18d98a79 isn't.

I'm not 100% convinced that 4.9 is fully stable and that the patch
is the reason for the crashes you see.
What kind of crashes do you see? Userspace or kernel ?
I know we still face random userspace crashes which happen with plain kernel 4.9/stable too.
Dave is still trying various patches to resolve those crashes.

Helge
