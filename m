From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc:generic-64bit_defconfig build failures due to 'kbuild: handle libs-y archives separately...'
Date: Tue, 18 Jul 2017 19:11:28 -0400
Message-ID: <7751C468-68C3-439F-A270-469B47F22B1A@bell.net>
References: <20170718152125.GA15577@roeck-us.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170718152125.GA15577@roeck-us.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-07-18, at 11:21 AM, Guenter Roeck wrote:

> Hi,
> 
> parisc64 builds, specifically generic-64bit_defconfig, fail to build
> in mainline as follows.


It's likely this patch fixes the problem:
https://patchwork.kernel.org/patch/9832033/

Dave
--
John David Anglin	dave.anglin@bell.net



