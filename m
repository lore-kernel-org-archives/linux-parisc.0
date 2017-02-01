From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: crashes in 4.10 because of "parisc: Enable KASLR"
Date: Thu, 2 Feb 2017 00:29:10 +0200
Message-ID: <20170201222910.yiqudzurzwcjqyw7@raspberrypi-3.musicnaut.iki.fi>
References: <alpine.LRH.2.02.1702011234060.25046@file01.intranet.prod.int.rdu2.redhat.com>
 <b24dbc17-2e13-0630-7969-3d12fe8d11bb@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>,
        linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <b24dbc17-2e13-0630-7969-3d12fe8d11bb@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Wed, Feb 01, 2017 at 08:54:57PM +0100, Helge Deller wrote:
> I know we still face random userspace crashes which happen with plain kernel 4.9/stable too.
> Dave is still trying various patches to resolve those crashes.

FWIW, I was able to run full GCC 6 bootstrap (> 20 hours) on C3700/PA8700
without any issues using plain 4.9 kernel.

A.
