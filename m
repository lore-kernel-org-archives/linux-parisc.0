From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Re: atlas3 on hppa: unexpected reloc type
Date: Mon, 14 Jun 2004 22:06:17 +0100
Message-ID: <20040614210617.GF20511@parcelfarce.linux.theplanet.co.uk>
References: <20040614205346.4B6031D377@nala.cs.utk.edu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: R Clint Whaley <rwhaley@cs.utk.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040614205346.4B6031D377@nala.cs.utk.edu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 14, 2004 at 04:53:46PM -0400, R Clint Whaley wrote:
> My understanding from the docs is that pa11 doesn't define any prefetch
> instructions, which means these formulations are loads to an invalid
> register, which, since they are loads and not prefetches, could have
> side effects (eg., seg fault).  Therefore, you need to use them only
> on pa20, even if they compile on pa11.  I take it this is what you are saying?

That's correct.

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
