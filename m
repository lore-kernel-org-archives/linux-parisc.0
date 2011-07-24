From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Sun, 24 Jul 2011 14:42:16 -0400
Message-ID: <CADZpyixCFm7YUfihEJs+eR+gyUcw+S_ty+v4w2bK2s0jMFwUQg@mail.gmail.com>
References: <4E177624.1030500@systemhalted.org>
	<201107081742.48874.vapier@gentoo.org>
	<4E1780EE.1010405@systemhalted.org>
	<BLU0-SMTP8777233F78FA13F6037090974E0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Frysinger <vapier@gentoo.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP8777233F78FA13F6037090974E0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 22, 2011 at 5:51 PM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> Do you have a userspace patch? =A0There was the thread stack allocati=
on bug
> and possibly futex related issues.

I do have a userspace patch, what would you like the patch against?

> The "Check Summary" is always 0x8400000000800000. =A0I think Kyle fix=
ed one of
> these last March.
> The cause was missing IPC system calls. =A0I'm a bit vague regarding =
whether
> the fix was installed
> or not.

I wouldn't expect a missing syscall to HPMC the machine, it should retu=
rn ENOSYS
and userspace should return a failure code... eventually something migh=
t fail to
check the function return and fail.

That's far from an HPMC though.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
