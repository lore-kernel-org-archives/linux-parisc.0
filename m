From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 12:18:16 -0400
Message-ID: <119aab440906210918v7ff1420cvb1c45fcf518419f8@mail.gmail.com>
References: <119aab440906202327x7093bd81q93f3914fcf6c2c70@mail.gmail.com>
	 <20090621152031.04E4B4F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090621152031.04E4B4F19@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 21, 2009 at 11:20 AM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> We never figured out why the fault actually occurred (Kyle got busy).
> It seems like there is a problem with the address mapping during sign=
als.
> However, there was some rebuilds in the above and I'm not sure the
> analysis is correct. =A0However, I'm sure the problem isn't with
> __canonicalize_funcptr_for_compare.

Hoccam's razor. It's a gcc bug.

The arg0 to __c_f_f_c is being clobbered by the previous call.
Rearrangeing the if-the-else cases into a set if cases fixes the
clobbering of arg0 and fixes strace.

The move of the fptr into r26 is moved before the call to umove, then
umove clobbers r26, then __c_f_f_c is called and crashes.

> So, the quick fix to get strace going is to rebuild casting the funct=
ion
> pointers to long. =A0However, I think you will find that it has other=
 problems.
> You might have more success with the old version that Kyle patched a
> year or so ago (posted in debian people). =A0Randolph was working on =
a program
> called atrace. =A0I tried it but didn't have much luck with it.

The quick fix is to reorganize the if-then-else statement.

> PS: Hows NPTL comming?

The implementation is done. The testsing shows no regressions. The
custom compat testsuite I wrote also passes every test.

Unfortunately last night I was up late working and I managed to both
erase (be careful of bind mounts) half of my custom compat testsuite
and the chroot I was going to use for more advanced testing.

On todays schedule is to rebuild the chroot and test gnome using
vnc4server with the new libs.

At a later date I'll have to rewrite the missing pieces of the custom
compat testsuite.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
