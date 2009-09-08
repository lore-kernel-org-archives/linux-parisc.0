From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Transition hppa from linuxthreads to nptl is ready to proceed.
Date: Tue, 8 Sep 2009 14:35:17 -0400
Message-ID: <119aab440909081135n76898ac8o49adcb9d221da5fa@mail.gmail.com>
References: <119aab440909071454s7923b95atce6f5f5a7e5b469d@mail.gmail.com>
	 <200909081357.37995.vapier@gentoo.org>
	 <119aab440909081104s206d64dbxba7ef011839b2822@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Petr Salinger <Petr.Salinger@seznam.cz>,
	Grant Grundler <grundler@parisc-linux.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909081104s206d64dbxba7ef011839b2822@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 8, 2009 at 2:04 PM, Carlos O'Donell<carlos@systemhalted.org> wrote:
> git push -v
> Pushing to git://sourceware.org/git/glibc-ports.git
> fatal: The remote end hung up unexpectedly

Oh gosh this was lame, I kept checking out "git://" urls when I meant
to checkout the "ssh://" url.

Checking out the "ssh://" url (for which I have keys to sourceware)
allowed me to checkin the patches.

Checked in here:
http://sourceware.org/git/?p=glibc-ports.git;a=commit;h=be0f2008ac41c83db39d1d1112c0392dbb8b18e9

Cheers,
Carlos.
