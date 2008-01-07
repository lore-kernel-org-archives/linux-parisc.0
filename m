From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Nanoseconds times on EXT3 always seem to be zero
Date: Mon, 7 Jan 2008 14:50:10 -0500 (EST)
Message-ID: <200801071950.m07JoAqG000941@hiauly1.hia.nrc.ca>
References: <20080107180451.GA20148@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: matthew@wil.cx (Matthew Wilcox)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080107180451.GA20148@parisc-linux.org> from "Matthew Wilcox" at Jan 7, 2008 11:04:51 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, Jan 07, 2008 at 12:42:56PM -0500, Carlos O'Donell wrote:
> > Can you distill this into a testcase that uses the kernel fstat* syscalls?
> > 
> > That would definitely rule out glibc getting in the way.
> 
> ext3 doesn't store nanoseconds on disc ... unless <blah blah blah>

I was told today that 2.6.24 may provide nanoseconds with ext3, else ext4.
The documentation for <blah blah blah> seems lacking.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
