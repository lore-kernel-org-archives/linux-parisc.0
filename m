From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: Gcc bug or I missunderstand? [ftsd %fr22,
	56(%sr0, %r20) failed to build?]
Date: Wed, 15 Dec 2004 17:18:13 +0000
Message-ID: <20041215171813.GA28058@parcelfarce.linux.theplanet.co.uk>
References: <418A80250000FC28@mail-2-bnl.tiscali.it>
	<20041215163907.GZ29171@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: dave@hiauly1.hia.nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041215163907.GZ29171@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 15, 2004 at 08:39:07AM -0800, Randolph Chung wrote:
> > it seems that if d>8 there is a pb?
> > Did I miss something?
> 
> No, this is a known bug with binutils; nobody has bothered to look
> into/fix it yet :(

Quick look at page 9-24 of the Kane book indicates that for d between +15
and -16 we use format 42 and for d outside that range, we use format 3.
Looks like nobody bothered to teach binutils about this longer form yet.
Is it possible it's only available for PA2.0 processors?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
