From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: GCC 4.3 and PLABEL32 issues.
Date: Wed, 26 Mar 2008 06:37:41 -0600
Message-ID: <20080326123741.GH16721@parisc-linux.org>
References: <119aab440803251959j8596a72wc399174db02ed71f@mail.gmail.com> <20080326032001.357B74E7F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>, dave.anglin@nrc.ca,
	linux-parisc@vger.kernel.org, aurel32@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080326032001.357B74E7F@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Mar 25, 2008 at 11:20:00PM -0400, John David Anglin wrote:
> This definitely needs a PR.  It should be marked as a regression.
> This probably also breaks the unwind code in libjava as it has a
> similar check.  There's also __canonicalize_funcptr_for_compare.
> 
> It's something of a puzzle as to why this didn't appear in testing.
> It suggests we aren't testing the build libraries but installed libraries.

I thought Mozilla also used the low bits of pointers for special cases
... and the kernel even has macros to return 'either a pointer or an
error code' (PTR_ERR, ERR_PTR, IS_ERR).  Although the kernel probably
wouldn't trip this, as I can't think of any function which returns a
function-pointer-or-error (and besides the test isn't 'are the bottom
bits set', but 'if you cast this pointer back to an unsigned long, is it
greater than -4095'.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
