From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA glibc nls bug
Date: Sun, 22 Apr 2007 12:15:49 -0400 (EDT)
Message-ID: <200704221615.l3MGFndK016423__18502.8496700854$1416624340$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440704220854x34f07f78geb80b07647efd4f8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440704220854x34f07f78geb80b07647efd4f8@mail.gmail.com>
	from "Carlos O'Donell" at Apr 22, 2007 11:54:13 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > This started as GCC PR 31413:
> > http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31413
> >
> > The 4.cc test fails because this wchar string isn't being correctly
> > processed:
> >
> >   const wchar_t wstr[] = { 0x897f, 0x5143, L'2', L'0', L'0', L'3',
> >                            0x5e74, L'1', L'2', 0x6708, L'1', L'7',
> >                            0x65e5 , 0x0 };
> >
> > Note the first two values are the same as my x86 system returns.
> 
> Yes, that means my x86 and hppa debian boxes are broken.

Etch/stable is also broken.  Could this problem be present in the
upstream glibc sources as well?

> What do you think could be the problem?
> 
> > The issue is clearly in newlocale.  nl_langinfo_l just returns
> > a pointer that was previously setup.
> 
> newlocale calls nl_langinfo_l to fill in some structures. So it could
> still be a problem with nl_langinfo_l.

I think it will do this if the locale has already been setup.  When
a new locale needs to be setup, it malloc's some memory and sets up
the strings and pointers.

Yesterday, I was looking for something PA specific and not having
much success.  Now that we know that this is a generic problem, I would
file a Debian PR and look through recent changes to the locale files.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
