From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] PRINTK_TIME make panicing very early b2k?
Date: Mon, 27 Jun 2005 16:01:07 +0100
Message-ID: <20050627150107.GG5200@parcelfarce.linux.theplanet.co.uk>
References: <42BAE7C300000EB4@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BAE7C300000EB4@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 27, 2005 at 04:30:21PM +0200, Joel Soete wrote:
> Hello all,
> 
> I hope to get help from CONFIG_PRINTK_TIME to debug my d380 64bit slowness
> pb but tested first on a b2k it panics (waht siad lcd display at leat) very
> early in the boot and unfortunately pim lakes of relievant info:

I'm not sure why you say it lacks relevant info.  Seems pretty clear to me:

> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x0000000000000000

... a null pointer dereference, in kernel space.

> General Registers 0 - 31
> 00-03   0000000000000000  0000000000000000  000000001012799c  0000000000800327

called from 1012799c.  Where's that in your System.map?

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
