From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] parisc: Export flush_cache_page() (needed by lustre)
Date: Thu, 5 Sep 2013 20:07:19 +0200
Message-ID: <CAMuHMdUmKFwpsN9c1qeGf7+=tqMkB=A1j2wSHBrsOYk+co5mog@mail.gmail.com>
References: <1378373595-29471-1-git-send-email-geert@linux-m68k.org>
	<1378396919.2142.5.camel@dabdike.int.hansenpartnership.com>
	<20130905171338.GB25882@merlin.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130905171338.GB25882@merlin.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 5, 2013 at 7:13 PM, Kyle McMartin <kyle@infradead.org> wrote:
> On Thu, Sep 05, 2013 at 09:01:59AM -0700, James Bottomley wrote:
>> > +EXPORT_SYMBOL_GPL(flush_cache_page);
>>
>> This is an internal API: no architecture exports this.  Whoever is
>> trying to use it needs to use the correct API, so this is the wrong
>> patch.
>>
>
> I suspect it's copy_{to,from}_user_page being called here:

Indeed. Sorry, I should have mentioned that.

> drivers/staging/lustre/lustre/libcfs/linux/linux-curproc.c:
> copy_to_user_page(vma, page, addr,
>
> which we could probably take out of line.

If you want to hide flush_cache_page() for modules, yes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
