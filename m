From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Sun, 7 Apr 2013 11:11:34 -0400
Message-ID: <20130407151134.GX12938@bombadil.infradead.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <201304010632.41520.vapier@gentoo.org>
 <CAKgNAkgG2kdCC1tyZQkYU7O_nP7RB8VoCmx6eb8FcudU1s6RgA@mail.gmail.com>
 <201304021917.17659.vapier@gentoo.org>
 <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com>
 <20130407135514.GW12938@bombadil.infradead.org>
 <1365346609.1992.10.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-man <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1365346609.1992.10.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 07, 2013 at 07:56:49AM -0700, James Bottomley wrote:
> Actually, that's not quite correct.  on 64 bits it's arg1-8 are %r26-%
> r19 but on 32 the convention is that arg1-arg4 are %r26-%r23 and the
> rest on stack.  We can also do register pair combining on 32 bits for a
> 64 bit argument.

I guess the confusion is whether you're writing this from the kernel
side or the userspace side. The syscall instruction is called with six
arg registers, but we fix it on entry to the kernel when we call into C.
