From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Wed, 4 Sep 2013 19:58:23 -0400
Message-ID: <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl> <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk> <52278FBD.2010304@bell.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Alex Ivanov <gnidorah@p0n4ik.tk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52278FBD.2010304@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Should have just given link:
http://developer.amd.com/resources/documentation-articles/developer-guides-manuals/

It is listed near bottom as "R5xx Family 3D Programming Guide".

On 4-Sep-13, at 3:53 PM, John David Anglin wrote:

> Alex,
>
> That was the general idea although I was looking at the code in  
> radeon_cp.c.  I now think my suggestion
> was incorrect as the CP data is loaded via registers.
>
> After a bit of searching, I found a document which describes reading  
> and writing to MicroEngine RAM.
> See page 22.  I think we need to confirm after writing that we can  
> read back the control program
> successfully.


Dave
--
John David Anglin	dave.anglin@bell.net



