Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF379484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 09:04:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AX0du-0000bs-Ej; Thu, 18 Dec 2003 16:04:50 +0000
Date: Thu, 18 Dec 2003 16:04:50 +0000
From: Matthew Wilcox <willy@debian.org>
To: Christoph Hellwig <hch@lst.de>,
	parisc-linux@lists.parisc-linux.org, vserver@list.linux-vserver.org
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Message-ID: <20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031218150129.GA792@MAIL.13thfloor.at>
Sender: <willy@www.linux.org.uk>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 18, 2003 at 04:01:29PM +0100, Herbert Poetzl wrote:
> vserver folks really do not care whether or not the
> syscall is reserved on their architecture, as long 
> as it's there, and it will be there anyway, I just 
> wanted to be polite and correct, so if you 'think'
> we split up the switch just for parisc(64) again, 
> then I can assure you, that just won't happen ...

FYI, Christoph does not control syscall allocations on PA-RISC; I do.
I don't yet have a firm opinion on whether we should allocate this
syscall.  I see both sides of this argument, but personally, I believe
sys_vserver is a mistake.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
