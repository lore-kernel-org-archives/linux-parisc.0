From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: NTPL transition
Date: Fri, 5 Sep 2008 08:17:31 -0400
Message-ID: <119aab440809050517v2d26e2f1nd2d3e5aa0efe14bd@mail.gmail.com>
References: <20080904114551.GA18877@tilt.dandreoli.com>
	 <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com>
	 <20080904152329.GA24316@colo.lackof.org>
	 <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com>
	 <20080904160407.GB24316@colo.lackof.org>
	 <1220550764.3276.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "dann frazier" <dannf@dannf.org>,
	"Debian HPPA Port List" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "James Bottomley" <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220550764.3276.45.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 4, 2008 at 1:52 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> Can we go via an intermediate library that would coexist with current
> glibc?  Something like libc6-nptl, then we do the transitional update
> with the tools and other libraries moving over to libc6-nptl, then the
> final piece of the upgrade is libc6 going to nptl based libc6.1 and we
> remove the transitional libc6-nptl?  This type of flip will have to be
> done via ld.so.conf magic, but it should be doable.

No, due to library-to-library dependencies you have the same problem.
You would either have to rebuild *all* the libraries or continue
splitting each library into two packages lib and lib-nptl.

Cheers,
Carlos.
