From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] ext2 vs ext3 on hppa
Date: Fri, 11 Feb 2005 14:42:44 +0000
Message-ID: <20050211144244.GD17242@parcelfarce.linux.theplanet.co.uk>
References: <20050211071629.GA32318@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20050211071629.GA32318@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Feb 11, 2005 at 12:16:29AM -0700, Grant Grundler wrote:
> Hi all,
> ext3 perf isn't so good on parisc.
> I've posted profile data for kernel builds:
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2004-November/025196.html
> 
> But not for "tar". I can't find the data I collect before. :^(
> ISTR the culprit in ext3 was the bitmap search using atomic ops.
> On parisc, atomic ops are terrible since it requires a spinlock/op/unlock
> sequence.

I switched the ext2/3 bitops to use the non-atomic ops.  Tried it on nicol
(dual 550MHz PA8600) ...

$ time tar xjf ~/linux-2.6.11-rc3.tar.bz2 

real    25m4.557s
user    1m7.262s
sys     24m59.092s

ouch.  time to do some profiling, i guess, instead of assuming I saw
the problem and the fix ...

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
