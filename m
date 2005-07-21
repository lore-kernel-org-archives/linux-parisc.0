From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Latest palinux crash
Date: Thu, 21 Jul 2005 11:34:22 +0000
Message-ID: <42DF883E.1020607@tiscali.be>
References: <20050720122227.GK10156@parcelfarce.linux.theplanet.co.uk>
	<20050721043626.GY30182@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050721043626.GY30182@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Carlos O'Donell wrote:
> On Wed, Jul 20, 2005 at 01:22:27PM +0100, Matthew Wilcox wrote:
> 
[...]
> 
> We need better tools for this... I wonder if we still have lkcd support
> for hppa.
> 
> If we had lkcd support would you be willing to run a modified kernel on
> parisc-linux?
> 
Afaik unfortunately there wasn't any more support of lkcd on hppa since 2 or 3 years :-(
(iirc Bruno Vidal made this effort in 2.4 but never ported in 2.6 :_( ?

But I totaly agree with you, we would need better tool, specialy when the situation is not clear:
some weeks ago, with jda's help I manage to compile p-l kernel with gcc-4.0 and some fpr constraint.
This kernel seems to be very more stable (passed with success some stress test of mine during severall days when it would crash in 
few ours or less when compile with gcc-3.3).
But I also tried to rebuild gcc-4.1 to just reproduce the pb encountered by jda in a c++ test:
efectively, the kernel 'hang' or 'freeze' during this test and it's hard to guess what's hapening;
no more network responds (no ping, no ssh, ...), no more console responds, ...
but pressing TOC button launched well a panic, and unfortunately pim analisys didn't help at all :-?
(fyi: <http://lists.parisc-linux.org/pipermail/parisc-linux/2005-July/026855.html>)

So am I also looking for way to help: lkcd? instrumenting the kernel like kprobes/dprobes? (but not yet hppa support)
Unfortunately, I definetily don't have deep enough knowledge of linux kernel to help more, sorry.

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
