From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [2.6 patch] binfmt_som.c: add MODULE_LICENSE
Date: Sun, 10 Aug 2008 09:14:33 -0600
Message-ID: <20080810151433.GO8618@parisc-linux.org>
References: <20080806211155.GV1702@cs181140183.pp.htv.fi> <20080810005511.GB2617@colo.lackof.org> <20080810010005.GL8618@parisc-linux.org> <1218375714.18157.56.camel@rover.gag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Adrian Bunk <bunk@kernel.org>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: Bdale Garbee <bdale@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1218375714.18157.56.camel@rover.gag.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 10, 2008 at 10:41:54AM -0300, Bdale Garbee wrote:
> On Sat, 2008-08-09 at 19:00 -0600, Matthew Wilcox wrote:
> > On Sat, Aug 09, 2008 at 06:55:11PM -0600, Grant Grundler wrote:
> > > Someone from HP needs to ACK this patch since I believe HP funded the code
> > > changes made during the parisc-linux port. This should be a no-brainer
> > > and I expect Bdale Garbee can quickly take care of this.
> 
> > I believe I did this work before joining Linuxcare,
> > so I don't believe HP has any claim to it at all.  You'd have to check
> > CVS history to be sure.  
> 
> If that is indeed the timing, I agree.  If not, let me know, and I'll
> see if I can push the right buttons in HP.

http://cvs.parisc-linux.org/obsolete/linux-2.2/fs/binfmt_som.c?rev=1.8&view=log

indicates I first committed the file in June 1999 and was the majority
committer to this file (prumpf also committed some code).  My last
commit to it was in November 1999 (while I still worked for Genedata).

At some point around then, we moved to the 2.4 CVS tree:

http://cvs.parisc-linux.org/linux-2.4/fs/binfmt_som.c?rev=1.21&view=log

and there are some commits from other people at HP and myself while at
Linuxcare and HP.

The 2.5 development tree:
http://cvs.parisc-linux.org/linux-2.5/fs/binfmt_som.c?rev=1.3&view=log

doesn't show anything of great interest.

and the 2.6 tree represents accurately how much effort we put into SOM:
http://cvs.parisc-linux.org/linux-2.6/fs/binfmt_som.c?rev=1.8&view=log


So while HP has a legitimate claim to some parts of the file, my initial
contributions before I worked for Linuxcare or HP were the largest and I
don't think that anyone has a legitimate claim that this is not a
derived work of GPL code, and hence I think Adrian's patch should be
accepted.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
