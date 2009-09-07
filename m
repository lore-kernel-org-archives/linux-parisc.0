From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Any way to emulate hppa? Was: gforth FTBFS on hppa
Date: Mon, 7 Sep 2009 11:08:50 -0400
Message-ID: <119aab440909070808w3eaa1a93s3d61a0cea1bfcbcb__26027.520633261$1252345612$gmane$org@mail.gmail.com>
References: <20090907133658.GA1267@straylight.m.ringlet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Thibaut VARENE <varenet@debian.org>
To: Peter Pentchev <roam@ringlet.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090907133658.GA1267@straylight.m.ringlet.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Sep 7, 2009 at 9:36 AM, Peter Pentchev<roam@ringlet.net> wrote:
> Now, a package of mine, gforth, has been exhibiting a weird FTBFS on
> the hppa architecture; it breaks in the GNU configure stage, trying to
> compile a series of programs that do a binary search to determine
> sizeof(char *).

Peter,

I'm a debian-hppa porter, do you have a test case along with a clear
description of the problem?

There are hppa developers who can give you access to an hppa machine
for testing.

Thibaut, do you have an hppa machine for Peter to run some tests on?

Cheers,
Carlos.
