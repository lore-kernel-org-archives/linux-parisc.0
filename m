Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 11 Aug 2003 16:39:55 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030811223955.GC25311@dsl2.external.hp.com>
References: <20030811043457.GA5653@dsl2.external.hp.com> <200308112038.h7BKc61c020812@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308112038.h7BKc61c020812@hiauly1.hia.nrc.ca>
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

On Mon, Aug 11, 2003 at 04:38:06PM -0400, John David Anglin wrote:
> First, I gave you the wrong advice on the option to get verbose info from ld.
> I gave you the hpux option.  The GNU option is `--verbose' or `-Wl,--verbose'
> when using the gcc driver.

ok. -debug was good.

> Here is the linker path on gsyprf11:
> 
> SEARCH_DIR("/usr/hppa-linux/lib"); SEARCH_DIR("/usr/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");
> 
> Here is where ld found libgcc_s.so.1:
> found libgcc_s.so.1 at /usr/local/lib/libgcc_s.so.1

ugh. `dpkg -S /usr/local/lib' comes up empty.
I've deleted everything older than a few days (python/texmf remain).
My expectation is hppa64-linux-* tool chain is self contained in
/opt/palinux and can go away when someone points me at a hppa64 .deb.

> The version of libgcc_s.so.1 in /usr/local/lib is old and appears to have
> been built using dwarf2 exception support.
> 
> Probably, the version of GCC installed in /usr/local should be removed.
> I believe it was the initial port with support for Ada.  However, this
> is now part of the regular debian distro.

deleted. Apologies for the goose chase.

But this is probably an excellent example for versioned symbols.
glxinfo would have broken in other weird ways at run time and
would have been even harder to track down.

Now I can go back and rebuild xfree86 again...

thanks,
grant
