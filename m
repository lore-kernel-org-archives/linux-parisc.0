Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA21867
	for <parisc-linux@puffin.external.hp.com>; Sat, 21 Oct 2000 12:28:52 -0600
Message-Id: <200010211834.LAA17164@milano.cup.hp.com>
To: drepper@cygnus.com (Ulrich Drepper)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] __FUNCTION__ work? 
In-reply-to: Your message of "21 Oct 2000 10:45:09 PDT."
             <m37l72gkbe.fsf@otr.mynet.cygnus.com>
Date: Sat, 21 Oct 2000 11:34:36 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ulrich Drepper wrote:
> Grant Grundler <grundler@cup.hp.com> writes:
> 
> > The output I get from:
> > 	printk(__FUNCTION__ "() starts\n");
> 
> RTFM.  __FUNCTION__ and __func__ are identifiers, not string literals.

Ok. I'll update my usage. tnx.

I tried to find the manual (still looking) but found some other
interesting links instead:

http://gcc.gnu.org/ml/gcc-patches/1999-10n/msg00281.html
    Jason Merrill <jason at cygnus dot com> wrote:
    | In g++, __FUNCTION__ is a variable, not a string literal.
    | That change was necessary to support templates.

http://agnes.dida.physik.uni-essen.de/~janjaap/mingw32/gcc-announce.html
(gcc 2.8.0 release notes dated Wed, 14 Jan 98 05:59:05 EST)
    Richard Kenner wrote:
    | __FUNCTION__ and __PRETTY_FUNCTION__ are now treated as variables by
    | the parser; previously they were treated as string constants.  So code
    | like  `printf (__FUNCTION__ ": foo")' must be rewritten to `printf
    | ("%s: foo", __FUNCTION__)'.  This is necessary for templates.

I've been writing 'C' code since about 1985...old habits die hard. :^)

thanks,
grant

> -- 
> ---------------.                          ,-.   1325 Chesapeake Terrace
> Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
> Red Hat          `--' drepper at redhat.com   `------------------------

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
