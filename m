From: Helge Deller <deller@gmx.de>
Subject: Re: PCI & AGP video options
Date: Fri, 09 Aug 2013 23:18:22 +0200
Message-ID: <52055C9E.9010503@gmx.de>
References: <199671375961574@web3d.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <199671375961574@web3d.yandex.ru>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Alex,

On 08/08/2013 01:32 PM, Alex Ivanov wrote:
> Which PCI/AGP local graphics options are you using today
> on PA-RISC machines? I mean Xorg usage.

I'm not sure if it makes much sense to use a PA-RISC
machine as desktop machine nowadays. Every Intel-based
machine is faster, cheaper, better supported (graphic cards)
and uses less power... 
 
> I'd like to use native option of my machine (FireGL X1/X3
> in C8000), but it's currently broken (no DRM and software
> accel is incredibly slow plus colors in 24bpp mode are wrong), 
> so i'm looking for the alternatives.

For all other parisc machines we have the stifb driver which
supports the built-in graphic cards like Visualize-EG.
Visualize-FX cards are not supported and probably will never
be supported.

The only other card I used once (at least I tested it shortly)
was a Vodoo 2 card. Sadly it only supported 800x600 with 16bit if
I remember correctly.
I tried a Matrox PCI once too, but I think it had some issues.

So, I still hope we can get the FireGL supported fully soon...

Helge
