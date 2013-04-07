From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Sun, 7 Apr 2013 14:48:42 -0400
Message-ID: <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com> <20130407135514.GW12938@bombadil.infradead.org> <201304071439.15297.vapier@gentoo.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	"linux-man" <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201304071439.15297.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7-Apr-13, at 2:39 PM, Mike Frysinger wrote:

> just to be clear, the only insn you need is:
> 	ble 0x100(%sr2, %r0);
>
> the kernel docs say sr2 holds the kernel gateway page (so i guess  
> 0x100 is a
> known offset into that).  the docs don't mention r0 that i can see,  
> so i'm
> guessing it's one of those "always 0" registers ?

Yes.  There is also an entry at offset 0xb0 for light-weight- 
syscalls.  Currently,
this implements an atomic CAS operation used for pthread support.

Dave
--
John David Anglin	dave.anglin@bell.net



