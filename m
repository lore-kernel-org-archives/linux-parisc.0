From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Sun, 4 Aug 2013 09:28:33 -0700
Message-ID: <CAEdQ38EBZV5EB_hxrwd_AQQwStoOjibE8g1xgNHk_S0ooUN4Pg@mail.gmail.com>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com>
 <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org>
 <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org>
 <51DC7996.3010405@bell.net> <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl>
 <216411373487566@web6f.yandex.ru> <CAEdQ38FDuGy_yjB+yV93dtNxJ-kicavhOqFNWLiWesVrbd1uRA@mail.gmail.com>
 <518401373491752@web17h.yandex.ru> <51DF0B90.3040506@gmx.de>
 <51DF0BEF.6020304@gmx.de> <995101375614033@web11d.yandex.ru> <BLU0-SMTP82333D1594F12973C8706697530@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Alex Ivanov <gnidorah@p0n4ik.tk>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP82333D1594F12973C8706697530@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 4, 2013 at 8:44 AM, John David Anglin <dave.anglin@bell.net> wrote:
> I wonder if there is a endian issue in the microcode load.

It should work on PowerPC (big-endian).
