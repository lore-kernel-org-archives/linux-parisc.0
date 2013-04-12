From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Fri, 12 Apr 2013 10:01:12 -0400
Message-ID: <20130412140112.GD11525@bombadil.infradead.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <201304071439.15297.vapier@gentoo.org>
 <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl>
 <201304112155.46349.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@bell.net>,
	"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	linux-man <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201304112155.46349.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 11, 2013 at 09:55:43PM -0400, Mike Frysinger wrote:
> interesting.  sounds like a poor man's vDSO.  i'll document this the new 
> vdso(7) man page.
> -mike

fwiw ia64 does basically the same thing for a subset of syscalls
(fsys.c)

--Kyle
