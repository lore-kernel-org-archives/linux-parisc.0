Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 687CF48BB
	for <parisc-linux@parisc-linux.org>;
	Sat, 13 Mar 2004 10:31:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B2CzG-0005vQ-12; Sat, 13 Mar 2004 17:31:50 +0000
Date: Sat, 13 Mar 2004 17:31:49 +0000
From: Matthew Wilcox <willy@debian.org>
To: LaMont Jones <lamont@smallone.mmjgroup.com>
Subject: Re: [parisc-linux] real2.S patch
Message-ID: <20040313173149.GA2148@parcelfarce.linux.theplanet.co.uk>
References: <20040313172703.GA22696@smallone.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040313172703.GA22696@smallone.mmjgroup.com>
Sender: <willy@www.linux.org.uk>
Cc: lamont@mmjgroup.com, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Mar 13, 2004 at 10:27:03AM -0700, LaMont Jones wrote:
> Any objections to this patch?  It removes a duplicated calculation,
> and has the added advantage of surviving my woody build environment...

Looks good to me.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
