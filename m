From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Fri, 4 Feb 2011 10:20:05 -0500
Message-ID: <AANLkTim9oXFf7ksuj9o-g2J4aL4xi-JPH3PsayMayxMt@mail.gmail.com>
References: <20110203022420.A73F54E7B@hiauly1.hia.nrc.ca>
	<alpine.SOC.1.00.1102041150390.8218@math.ut.ee>
	<20110204150703.GA9254@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110204150703.GA9254@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 4, 2011 at 10:07 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Fri, 04 Feb 2011, Meelis Roos wrote:
>
>> 2363 =A0clone( <unfinished ...>
>> 2349 =A0<... futex resumed> ) =A0 =A0 =A0 =A0 =A0 =A0 =3D 1
>> 2363 =A0<... clone resumed> child_stack=3D0, flags=3DCLONE_CHILD_CLE=
ARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=3D0x460df4a8) =3D 2372
>> 2349 =A0--- SIGSEGV (Segmentation fault) @ 0 (0) ---
>> 2372 =A0rt_sigaction(SIGPIPE, {SIG_DFL, [], SA_RESTART}, =A0<unfinis=
hed ...>
>> 2349 =A0write(1, "\33[56;1H\33[34h\33[?25h", 18 <unfinished ...>
>>
>> Something futex-related. Full log temprarilty available at
>> http://www.cs.ut.ee/~mroos/aptitude-strace.txt
>
> This is possibly the infamous COW bug.

The COW bug that is triggered by a COW from an LWS-CAS? The solution
to which is to use locks around the LWS-CAS even on UP? I'd forgotten
about this issue actually, I should push that patch out to James.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
