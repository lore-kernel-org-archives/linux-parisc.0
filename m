From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Nanoseconds times on EXT3 always seem to be zero
Date: Mon, 7 Jan 2008 11:04:51 -0700
Message-ID: <20080107180451.GA20148@parisc-linux.org>
References: <200801062013.m06KDdht008111@hiauly1.hia.nrc.ca> <119aab440801070942v2693dfc2y556cc4aa415c5179@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440801070942v2693dfc2y556cc4aa415c5179@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jan 07, 2008 at 12:42:56PM -0500, Carlos O'Donell wrote:
> Can you distill this into a testcase that uses the kernel fstat* syscalls?
> 
> That would definitely rule out glibc getting in the way.

ext3 doesn't store nanoseconds on disc ... unless <blah blah blah>

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
