From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video/fbdev/stifb: Fix spelling mistake in fall-through
 annotation
Date: Wed, 26 Sep 2018 18:52:56 +0200
Message-ID: <20180926165258eucas1p21fc564f4f9d3d33e551937f2ad44272a~YAV6Efwju0462904629eucas1p2M@eucas1p2.samsung.com>
References: <CGME20180903200806epcas2p1171387c9a1699140856911ce283f470c@epcas2p1.samsung.com>
        <20180903200728.GA22414@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903200728.GA22414@embeddedor.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 09/03/2018 10:07 PM, Gustavo A. R. Silva wrote:
> Replace "fall though" with a proper "fall through" annotation.
> 
> This fix is part of the ongoing efforts to enabling
> -Wimplicit-fallthrough
> 
> Addresses-Coverity-ID: 402013 ("Missing break in switch")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch queued for 4.19, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
