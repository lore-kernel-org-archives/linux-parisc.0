From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] NPTL: The Bad News.
Date: Thu, 7 Sep 2006 08:54:28 -0700
Message-ID: <20060907155428.GA5447@titanium.v3.ca>
References: <119aab440609061723r168cc628x3bf2dfb18bac1641@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440609061723r168cc628x3bf2dfb18bac1641@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 06, 2006 at 08:23:18PM -0400, Carlos O'Donell wrote:
> The bad news is that I didn't work much on my thesis this long weekend.
> The good news is that I fixed many serious flaws related to:
> 
> 1. Stack direction, stack guards, and stack permissions.
> 2. Low level locking primitives returning the wrong values.
> 3. EAGAIN != EWOULDBLOCK snafu's
> 4. Compiler bugs.
> 5. Makefile bugs.
> 
> My current set of libc + tls + nptl failures is now down to:

Nice!  I don't see these in CVS yet.  Is there a branch or something
you're working on?

> make[2]: [libc-tls-nptl/posix/annexc.out] Error 1 (ignored)

Why is this under the "not cool" set?  This is there for every arch.

> make[2]: *** [libc-tls-nptl/elf/tst-audit2.out] Error 139

Aside from the segfault, is the audit interface even written?

Tks,
Jeff Bailey

-- 
I do not agree with a word you say, but I will defend to the death your
right to say it. 
 - Voltaire
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
