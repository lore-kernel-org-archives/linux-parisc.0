From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Fri, 24 Jan 2003 18:18:32 -0700
Message-ID: <20030125011832.GA6228__5814.53761919892$1416622142$gmane$org@dsl2.external.hp.com>
References: <20030121235716.GA2193@dsl2.external.hp.com> <3E30242300000111@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Joel Soete <joel.soete@tiscali.be>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E30242300000111@ocpmta8.freegates.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Jan 24, 2003 at 12:02:25PM +0100, Joel Soete wrote:
> Trust me, in this test the only variable is gcc release. Does it help?

not alot. We need to narrow down *what* is broken and then show that
to the compiler/toolchain experts. They need either a test case or
shown broken asm output.

> That said, always in the continuity of this idea, I also notice that ld is
> used to build some kernel parts. Is it  possible (even manually just for
> test) to use gcc in place of ld? (if yes, howto?)

hmm...offhand I don't know.

grant
