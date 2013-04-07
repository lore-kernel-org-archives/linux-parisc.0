From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Sun, 07 Apr 2013 07:56:49 -0700
Message-ID: <1365346609.1992.10.camel@dabdike>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
	 <201304010632.41520.vapier@gentoo.org>
	 <CAKgNAkgG2kdCC1tyZQkYU7O_nP7RB8VoCmx6eb8FcudU1s6RgA@mail.gmail.com>
	 <201304021917.17659.vapier@gentoo.org>
	 <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com>
	 <20130407135514.GW12938@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-man <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130407135514.GW12938@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2013-04-07 at 09:55 -0400, Kyle McMartin wrote:
> On Sun, Apr 07, 2013 at 12:00:50PM +0200, Michael Kerrisk (man-pages) wrote:
> > [Adding a few people to CC who may be able to help with Mike's doubts
> > on PA-RISC; folks, if any of you could have a quick look at the parisc
> > piece below, that would be helpful]
> > 
> 
> The syscall number is in %r20, everything else looks correct. The
> returned value is in %r28 and the args are %r26 through %r21.

Actually, that's not quite correct.  on 64 bits it's arg1-8 are %r26-%
r19 but on 32 the convention is that arg1-arg4 are %r26-%r23 and the
rest on stack.  We can also do register pair combining on 32 bits for a
64 bit argument.

Our register use is documented in 

Documentation/parisc/registers

James


