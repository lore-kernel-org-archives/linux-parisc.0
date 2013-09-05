From: Helge Deller <deller@gmx.de>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Thu, 05 Sep 2013 22:58:25 +0200
Message-ID: <5228F071.4040000@gmx.de>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl> <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk> <52278FBD.2010304@bell.net> <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Alex Ivanov <gnidorah@p0n4ik.tk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09/05/2013 01:58 AM, John David Anglin wrote:
> Should have just given link:=20
> http://developer.amd.com/resources/documentation-articles/developer-g=
uides-manuals/
> It is listed near bottom as "R5xx Family 3D Programming Guide".

I found this "older" one:
http://www.x.org/docs/AMD/R5xx_Acceleration_v1.1.pdf

Maybe section 4.5 (Chips et Coherency Issues) is relevant too: ?
The Rage128 product revealed a weakness in some motherboard chipsets in=
 that there is no mechanism to guarantee
that data written by the CPU to memory is actually in a readable state =
before the Graphics Controller receives an
update to its copy of the Write Pointer. In an effort to alleviate this=
 problem, we=E2=80=9Fve introduced a mechanism into the
Graphics Controller that will delay the actual write to the Write Point=
er for some programmable amount of time, in
order to give the chipset time to flush its internal write buffers to m=
emory.
There are two register fields that control this mechanism: PRE_WRITE_TI=
MER and PRE_WRITE_LIMIT.[...]

In the radeon DRM codebase I didn't found anyone using/setting those re=
gisters.
Maybe PA-RISC has some problem here?...

Just a thought.

Helge
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
