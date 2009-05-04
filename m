From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Random memory corruption with 64-bit SMP 2.6.30-rc4
Date: Mon, 4 May 2009 12:45:47 -0400
Message-ID: <119aab440905040945s3148cb76sf525be6dbd3e9049@mail.gmail.com>
References: <20090503182553.GA1579@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090503182553.GA1579@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, May 3, 2009 at 2:25 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> I'm not able to build gcc with 2.6.30-rc4. =A0Builds don't usually ge=
t
> beyond stage1. =A0A variety of applications generate SEGVs, the most =
common
> one being /bin/sh (bash). =A0I looked at one that seemed reasonably e=
asy
> to understand. =A0Quite a few of the SEGVs occur running _dl_fixup.

That is odd, but certainly a place where I would expect memory
corruption to bite you, since if you resolve the wrong address you
will likely crash.

> So, the values in $r20 and $ret0 are not consistent with the values i=
n
> memory pointed to by $r22. =A0I looked at the assembler code for do_l=
ookup_x
> and as far as I can tell, there is no way to avoid the path through
> do_lookup_x+364. =A0Further, $rp is consistent with do_lookup_x being
> called at its normal entry position. =A0So, either memory or $r22 is
> corrupt in the core dump.

Could you run the entire build with LD_BIND_NOW=3D1 set? Does it crash
anywhere else?

> The values like 0x000ca... probably are from bash.

Yes, the application would be at a low address.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
