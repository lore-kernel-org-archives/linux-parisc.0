Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 713DB484A
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Apr 2004 05:41:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1BFtd2-0002qE-2V; Tue, 20 Apr 2004 12:41:28 +0100
Date: Tue, 20 Apr 2004 12:41:28 +0100
From: Matthew Wilcox <willy@debian.org>
To: Roy Keene <parisc@rkeene.org>
Subject: Re: [parisc-linux] Kernel 2.4 bug (fwd)
Message-ID: <20040420114128.GE18329@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0404200039410.31608@hammer.oc9.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0404200039410.31608@hammer.oc9.org>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Apr 20, 2004 at 12:41:23AM -0500, Roy Keene wrote:
> Btw, `submit@bugs.parisc-linux.org' doesn't work.

Where do you see that email address still?  It should have been removed ...

> (double free() shouldn't cause the kernel to give page faults, running it
>  enough times eventually crashes the kernel)

What you see there is debug information to help you diagnose your app's
breakage ;-).  You can turn it off by changing #define PRINT_USER_FAULTS
to #undef PRINT_USER_FAULTS in arch/parisc/mm/fault.c.  I believe the
Debian kernel does this by default.

Eventually crashinig the kernel is a different matter.  Can you provide
more information about this?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
