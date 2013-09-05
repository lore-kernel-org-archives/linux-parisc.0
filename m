From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Thu, 05 Sep 2013 17:35:15 -0400
Message-ID: <5228F913.4060608@bell.net>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl> <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk> <52278FBD.2010304@bell.net> <90151378373008@web24h.yandex.ru> <BLU0-SMTP629706DAEF1E3714BE163097330@phx.gbl> <413F00CF-396F-472B-8476-DF1C4084FA81@p0n4ik.tk>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R; format=flowed
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <413F00CF-396F-472B-8476-DF1C4084FA81@p0n4ik.tk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/5/2013 5:15 PM, Alex Ivanov wrote:
> I've added hex printing in a check and at brief view the output seems to match cp firmware.
> In my case, it's a r420_cp.bin
OK, so the problem is probably not in the firmware load.  Maybe it's
the chipset coherency issue mentioned by Helge.  This may break ring 
test, etc.

Dave

-- 
John David Anglin    dave.anglin@bell.net

