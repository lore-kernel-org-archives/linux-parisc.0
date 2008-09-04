From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: NTPL transition
Date: Thu, 4 Sep 2008 11:31:52 -0400
Message-ID: <119aab440809040831m2a4a3cffy3a8fbc747ca3b4a2@mail.gmail.com>
References: <20080904114551.GA18877@tilt.dandreoli.com>
	 <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com>
	 <20080904152329.GA24316@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Debian HPPA Port List" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "dann frazier" <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080904152329.GA24316@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 4, 2008 at 11:23 AM, dann frazier <dannf@dannf.org> wrote:
> I've already done the initial bootstrapping and John Wright and I have
> a buildd actively rebuilding bits against sid. We're rsyncing the
> results out to here:
>  http://parisc-linux.org/~dannf/hppa-nptl-mirror/unstable/
>
> Suffice to say, the rebuild is going fairly smoothly. But, I wonder
> how we're going to transition systems over to an NPTL userspace. Does
> anyone have a plan for that?

Isn't this the responsibility of the package manager?

Why wouldn't apt-get dist-upgrade work?

Cheers,
Carlos.
