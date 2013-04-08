From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Mon, 8 Apr 2013 11:18:15 +0200
Message-ID: <CAKgNAkj0xkP3c9M-KnkdzqUAp7P99hce9jgdY=4eAM_Ad-ogZg@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <201304010632.41520.vapier@gentoo.org> <CAKgNAkgG2kdCC1tyZQkYU7O_nP7RB8VoCmx6eb8FcudU1s6RgA@mail.gmail.com>
 <201304021917.17659.vapier@gentoo.org> <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com>
 <20130407135514.GW12938@bombadil.infradead.org> <1365346609.1992.10.camel@dabdike>
 <20130407151134.GX12938@bombadil.infradead.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>,
	Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>,
	linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	Kyle McMartin <kyle-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>,
	Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>,
	"James E.J. Bottomley" <jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org>,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130407151134.GX12938-PfSpb0PWhxZc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
List-ID: <linux-man.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 7, 2013 at 5:11 PM, Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org> wrote:
> On Sun, Apr 07, 2013 at 07:56:49AM -0700, James Bottomley wrote:
>> Actually, that's not quite correct.  on 64 bits it's arg1-8 are %r26-%
>> r19 but on 32 the convention is that arg1-arg4 are %r26-%r23 and the
>> rest on stack.  We can also do register pair combining on 32 bits for a
>> 64 bit argument.
>
> I guess the confusion is whether you're writing this from the kernel
> side or the userspace side. The syscall instruction is called with six
> arg registers, but we fix it on entry to the kernel when we call into C.> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks, Kyle.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
