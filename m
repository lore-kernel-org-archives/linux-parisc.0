From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 9 May 2010 10:14:53 -0400
Message-ID: <AANLkTinoLS90tJOl-SOYJ5ZVs8SPEyO3nlP-qLYufS-W@mail.gmail.com>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca>
	 <20100413115501.307040@gmx.net>
	 <20100419162653.GA106@hiauly1.hia.nrc.ca> <4BCDEB6E.1060408@gmx.de>
	 <20100509124339.GA6797@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	gniibe@fsij.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100509124339.GA6797@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

n Sun, May 9, 2010 at 8:43 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Attached is my latest 2.6.33.3 patch bundle. =A0It uses a slightly mo=
dified
> version of James' minifail fix.
>
> The big change is the management of PTE updates and the TLB exception
> support on SMP configs. =A0I have modified what was formerly the pa_d=
bit_lock
> and used it for all user page table updates. =A0I also added a rechec=
k of the
> PTE after TLB inserts. =A0The idea for this was derived from a simila=
r check
> in arch/ia64/kernel/ivt.S. =A0I also whack the TLB page in ptep_set_w=
rprotect
> and modified the TLB locking for clear_user_page (it's now in asm).
>
> So far, the change is lightly tested. =A0I've been burned enough to k=
now
> that there are likely still problems. =A0However, so far I haven't se=
en any
> random segvs on my rp3440 or gsyprf11.
>
> I would appreciate pa'ers testing this change. =A0If it looks good, I=
'll
> extract the new PTE handling and formally submit.

Thanks Dave! I'll run this through the glibc testsuite a couple of
times to see if anything shakes out.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
