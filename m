Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 25 Jan 2003 21:46:56 -0700
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030126044656.GB6057@dsl2.external.hp.com>
References: <3DED9A6600005A12@ocpmta3.freegates.net> <3E1AA52C0000167E@ocpmta1.freegates.net> <20030116014145.GC8543@dsl2.external.hp.com> <20030121235716.GA2193@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030121235716.GA2193@dsl2.external.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Jan 21, 2003 at 04:57:16PM -0700, Grant Grundler wrote:
> Stephan Eranian had a good idea - replace .o's in the gcc 3.2
> built kernel tree with .o's built using gcc-3.0. Then maybe we
> can narrow down where the issue is.

this worked. replacing drivers/char/pty.o with one built using
gcc-3.0 resulted in a kernel that ssh logins wouldn't crash.

Any advice on comparing .o's? or rather compare .S files?

I can probably also narrow down the code path a bit more.
I'm suspecting the initialization before calling tty_register_driver().

thanks,
grant
