Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA21656
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 08:28:27 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Jul 2000 14:29:56 -0000
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@thepuffingroup.com, debian-parisc@lists.debian.org
Subject: Re: [parisc-linux] Architecture string change
References: <20000711015547.19021BEC2@rover.gag.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Jul 2000 10:28:21 -0400
In-Reply-To: Bdale Garbee's message of "Mon, 10 Jul 2000 19:55:47 -0600 (MDT)"
Message-ID: <87k8esbv22.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bdale Garbee <bdale@gag.com> writes:

> When I asked about the apparent confusion a while back, I got the very
> strong indication that the parisc-linux community wanted to use 'parisc' for
> the arhitecture string in Debian space... so that's the direction I've been

Well, there's no reason why DEB_HOST_GNU_CPU has to be the same as
DEB_HOST_ARCH.  Although I think I've seen a few debian/rules files
(including one of my own at one point) that do things like this:

build:
        ./configure --host=$(DEB_HOST_ARCH)-linux

Just to make it clear, this discussion is about DEB_HOST_GNU_CPU,
i.e. the CPU part of the string returned by config.guess and accepted
by configure, autoconf, and automake.

> I have no emotional loading on this one, I just want to know the answer.  :-)

I'm a bit biased towards 'hppa' just because it is the currently
accepted convention with all the GNU software out there.  Also it will
be a bit of a hack to config.guess to return parisc*, because we'll
end up only doing it on Linux.  Also, if we go with 'parisc', then:

(a) We need to send patches for config.guess and config.sub to the
    automake and autoconf people NOW.
(b) We must be prepared to manually update config.guess and config.sub
    in basically every piece of software we build. [1]

> We *must* decide this once and for all *very* soon.  Pretty please.

Yup :-)

[1] On Alpha, there continue to be annoying problems when building GNU
software because config.guess (which is part of autoconf) knew about
the PCA56 and EV6 subarchitectures long before config.sub (which is
part of automake) did, and thus configuring would always fail unless
--host=alpha-linux (or some other recognizable architecture string)
was specified.  Because the maintainer has to manually update
config.guess and config.sub, lots of packages still have old versions
that break...

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
