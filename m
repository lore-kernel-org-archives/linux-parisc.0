From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
	bad operands of fic, m
Date: Sat, 24 Sep 2005 12:54:39 -0600
Message-ID: <20050924185439.GC7824__47063.9892424971$1416623923$gmane$org@colo.lackof.org>
References: <1127580340.10496.7.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: 329888@bugs.debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1127580340.10496.7.camel@localhost>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Sep 24, 2005 at 10:45:40AM -0600, dann frazier wrote:
> As discussed on irc:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=329888

binutils-2.15 has this in include/opcodes/hppa.h:
{ "fdc",        0x04001280, 0xfc003fdf, "cZx(s,b)", pa10, 0},
{ "fdc",        0x04001280, 0xfc003fdf, "cZx(b)", pa10, 0},
{ "fic",        0x04000280, 0xfc001fdf, "cZx(S,b)", pa10, 0},
{ "fic",        0x04000280, 0xfc001fdf, "cZx(b)", pa10, 0},

And the binutils_2.16.1cvs20050902 version has only:
{ "fdc",        0x04001280, 0xfc00ffdf, "cZx(b)", pa10, 0},
{ "fdc",        0x04001280, 0xfc003fdf, "cZx(s,b)", pa10, 0},
{ "fic",        0x04000280, 0xfc001fdf, "cZx(S,b)", pa10, 0},

The order of the with 's' vs without 's' was switched and
in the process dropped one "fic" line.

Can binutils maintainer/folks please just add it back
in the new location?

Is the fix obvious enough or is a patch necessary?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
