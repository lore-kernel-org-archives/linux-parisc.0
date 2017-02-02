From: John David Anglin <dave.anglin@bell.net>
Subject: Re: crashes in 4.10 because of "parisc: Enable KASLR"
Date: Wed, 1 Feb 2017 19:25:24 -0500
Message-ID: <8DCE783F-17D4-457E-BA5D-4A8FB42AB61F@bell.net>
References: <alpine.LRH.2.02.1702011234060.25046@file01.intranet.prod.int.rdu2.redhat.com> <b24dbc17-2e13-0630-7969-3d12fe8d11bb@gmx.de> <20170201222910.yiqudzurzwcjqyw7@raspberrypi-3.musicnaut.iki.fi>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
        Mikulas Patocka <mpatocka@redhat.com>,
        linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170201222910.yiqudzurzwcjqyw7@raspberrypi-3.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-02-01, at 5:29 PM, Aaro Koskinen wrote:

> On Wed, Feb 01, 2017 at 08:54:57PM +0100, Helge Deller wrote:
>> I know we still face random userspace crashes which happen with plain kernel 4.9/stable too.
>> Dave is still trying various patches to resolve those crashes.
> 
> FWIW, I was able to run full GCC 6 bootstrap (> 20 hours) on C3700/PA8700
> without any issues using plain 4.9 kernel.

As noted in my previous message, the problem appears to only occur on machines that only support
equivalent aliases (PA8800/PA8900).  The C3700 doesn't have the large L2 cache.

Dave
--
John David Anglin	dave.anglin@bell.net



