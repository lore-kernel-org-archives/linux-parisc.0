Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 235ED484B
	for <parisc-linux@parisc-linux.org>;
	Sun,  8 Feb 2004 15:59:45 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1Apxtv-0001Cz-KM; Sun, 08 Feb 2004 22:59:43 +0000
Date: Sun, 8 Feb 2004 22:59:43 +0000
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Merge status with 2.6
Message-ID: <20040208225943.GJ24334@parcelfarce.linux.theplanet.co.uk>
References: <20040207172108.GV24334@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040207172108.GV24334@parcelfarce.linux.theplanet.co.uk>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 07, 2004 at 05:21:08PM +0000, Matthew Wilcox wrote:
> kernel/sysctl.c: Have we really removed these sysctls or is this a merge
> 	artifact?

Merge botch, needs to be removed from upstream.  Art Haas coincidentally
pointed this one out to me today.  It's going in via akpm.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
