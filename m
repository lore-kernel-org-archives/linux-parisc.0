Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C2D04854
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 08:14:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1BI6sk-0004JV-7i; Mon, 26 Apr 2004 15:14:50 +0100
Date: Mon, 26 Apr 2004 15:14:50 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul <paul@techcenter3000.com>
Subject: Re: [parisc-linux] Harmony driver for 2.6 working,
	possible bug in top?
Message-ID: <20040426141450.GP22558@parcelfarce.linux.theplanet.co.uk>
References: <008301c42b95$f2ae30c0$0702a8c0@tfam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <008301c42b95$f2ae30c0$0702a8c0@tfam.org>
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

On Mon, Apr 26, 2004 at 08:54:08AM -0500, Paul wrote:
> Bug in top: Can anyone else verify this? Add WCHAN to the field list
> and tell me if you think it's right.

WCHAN has never been implemented properly.  Paul Bame did a bit of a
hack once but the Right Way to do it is to implement a stack unwinder.
Randolph said he may have time to look into it shortly.

PS, please wrap your lines at 80 columns.


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
