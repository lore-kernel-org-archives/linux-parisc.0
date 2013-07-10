From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Thu, 11 Jul 2013 01:29:12 +0400
Message-ID: <518401373491752@web17h.yandex.ru>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com>
 <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org>
 <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org>
 <51DC7996.3010405@bell.net> <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl> <216411373487566@web6f.yandex.ru> <CAEdQ38FDuGy_yjB+yV93dtNxJ-kicavhOqFNWLiWesVrbd1uRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38FDuGy_yjB+yV93dtNxJ-kicavhOqFNWLiWesVrbd1uRA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

11.07.2013, 01:14, "Matt Turner" <mattst88@gmail.com>:
> On Wed, Jul 10, 2013 at 1:19 PM, Alex Ivanov <gnidorah@p0n4ik.tk> wro=
te:
>
>> =9AThank you so much! Your guess looks to be right. After applying o=
f your
>> =9Apatch there was no more KP and X just worked.
>
> Nice! Does DRI work?

Not on my side. Plus i can't visually jump over 8bit depth, although Xo=
rg=20
states 24bit in it's log.
As for DRI, i'm experiencing=20
"ring test failed (scratch(0x15E4)=3D0xCAFEDEAD)" with a firegl x3.

Can't figure out why, the ring vaddr (0x0000000060001000) is within the
limits of dma32. But the ring test fails. And i'm afraid that just addi=
ng a=20
buffer bounces in places will not help.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
