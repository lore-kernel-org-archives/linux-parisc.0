Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA26611
	for <hppa-linux@sod.res.cmu.edu>; Fri, 19 Mar 1999 14:13:11 -0500
From: Michael Shalayeff <mickey@lucifier.dial-up.user.akula.net>
Message-Id: <199903191853.NAA15832@lucifier.dial-up.user.akula.net>
Subject: Re: [hppa-linux] memory layout
In-Reply-To: <36F14F9B.AD1968C3@netscape.com> from Mike Shaver at "Mar 18, 99 02:10:19 pm"
To: hppa-linux@thepuffingroup.com
Date: Fri, 19 Mar 1999 13:53:02 -0500 (EST)
Cc: hppa-linux@thepuffingroup.com
Reply-To: mickey@openbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Mike Shaver:
> Alan Cox wrote:
> > If you want to run PH/UX binaries then you need to probably follow their
> > layout
> 
> Yeah, but OpenBSD runs their binaries and seems to use the 0xC0000000
> division.
hey! thank you very much, but we are not running hp/ux binaries on hppa yet (;
syscalls are done in hpux/lites/mklinux/osf/linux(?;) compatible way.
not all sources are in the repo tho (i'm doing things one at a time)

> > The m68k people use the 'spaces' equivalent on the m68k quite heavily
> 
> So we should be reading up on the spaces use in the arch/m68k code, then
> =).
and hp300 (which is m68k) is doing syscalls throught the trap#n actually
(for both hpux and bsd)

cu

> 
> Mike
> 
> -- 
> 351839.03 300276.13
> 
> -------------------------------------------------------------------------
> To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
    paranoic mickey       (my employers have changed but, the name has remained)
