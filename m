From: "Helge Deller" <deller@gmx.de>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when compiling
 ruby1.9
Date: Thu, 18 Dec 2008 14:13:57 +0100
Message-ID: <20081218131357.260160@gmx.net>
References: <4949812D.7080608@gmx.de>	
 <119aab440812171746x5c3ec853x87b7f4a6ca12dba@mail.gmail.com>
 <119aab440812171802o4cb2837dt168092caf7c633da@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440812171802o4cb2837dt168092caf7c633da@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Dec 17, 2008 at 8:46 PM, Carlos O'Donell
> > Can we avoid copying code from do_page_fault and just call
> do_page_fault?
=2E..
> However! I think you should not duplicate code. Please split out this
> "bit" of code into a function in mm/fault.c and call it from
> handle_interruption.

Sure. This patch was just meant to be short and easy understandable for=
 review of the problem itself and without other noise like splitting ou=
t a function...

Helge
--=20
Sensationsangebot verl=E4ngert: GMX FreeDSL - Telefonanschluss + DSL=20
f=FCr nur 16,37 Euro/mtl.!* http://dsl.gmx.de/?ac=3DOM.AD.PD003K1308T45=
69a
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
