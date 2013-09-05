From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Thu, 05 Sep 2013 13:23:28 +0400
Message-ID: <90151378373008@web24h.yandex.ru>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl> <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk> <52278FBD.2010304@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52278FBD.2010304@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

04.09.2013, 23:54, "John David Anglin" <dave.anglin@bell.net>:
> Alex,
>
> That was the general idea although I was looking at the code in
> radeon_cp.c. =9AI now think my suggestion
> was incorrect as the CP data is loaded via registers.
>
> After a bit of searching, I found a document which describes reading =
and
> writing to MicroEngine RAM.
> See page 22. =9AI think we need to confirm after writing that we can =
read
> back the control program
> successfully.
>
> Dave

I disregarded this too, though WREG32 macro name evidently says that
it does writing to registers.
I'm touching the r100.c, as they've opted out a radeon_cp.c one.

Good find! I though that it would be worth to check the load somehow,
as well. I've added the following piece after the load:

                WREG32(RADEON_CP_ME_RAM_RADDR, 0);
                for (i =3D 0; i < size; i +=3D 2) =20
                        if (RREG32(RADEON_CP_ME_RAM_DATAH)
                                !=3D be32_to_cpup(&fw_data[i]) ||
                                RREG32(RADEON_CP_ME_RAM_DATAL)
                                !=3D be32_to_cpup(&fw_data[i+1])) {
                                printk(KERN_WARNING "RADEON_CP_ME_RAM_D=
ATAH "
                                        "MISMATCH!\n");
                                break;
                        }

I've recompiled with this and booted to the new kernel, but seeing no w=
arning,
so it looks like it passes.

What's strange though is why they write zero instead of concrete memory=
 address
to the CP_ME_RAM_ADDR register...
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
