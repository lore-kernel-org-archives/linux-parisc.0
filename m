Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAF944838
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 15:09:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1BIDLv-00074t-M0; Mon, 26 Apr 2004 22:09:23 +0100
Date: Mon, 26 Apr 2004 22:09:23 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 tausq
Message-ID: <20040426210923.GQ22558@parcelfarce.linux.theplanet.co.uk>
References: <20040426202446.GB19643@engsoc.org>
	<200404262029.i3QKT5sE001532@hiauly1.hia.nrc.ca>
	<20040426203050.GG3965@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040426203050.GG3965@tausq.org>
Sender: <willy@www.linux.org.uk>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Apr 26, 2004 at 01:30:50PM -0700, Randolph Chung wrote:
> prefetching on 0 is valid on pa20 tho.

And required to be valid by the definition of the prefetch macros.

> willy is fixing this in the kernel now.

Not only did I fix it, but I put in a comment saying why we can't do
what I thought we could ;-)

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
