From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Re: front-panel LED and switch support broken (was:
	2.6.10-pa1 compile fails)
Date: Mon, 3 Jan 2005 03:19:07 +0000
Message-ID: <20050103031907.GM18080__20148.4752273702$1416624524$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0412301311180.17049-100000@hal.pp.fishpool.fi>
	<Pine.LNX.4.21.0412301639570.25032-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: =?iso-8859-1?Q?Martin-=C9ric?= Racine <q-funk@iki.fi>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.21.0412301639570.25032-100000@hal.pp.fishpool.fi>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 30, 2004 at 04:40:38PM +0200, Martin-Éric Racine wrote:
> On Thu, 30 Dec 2004, Martin-Éric Racine wrote:
> 
> > On Thu, 30 Dec 2004, Martin-Éric Racine wrote:
> > However, support for the front-panel LEDs and switches is BROKEN in 2.6.10-pa1:
> > when I press the power switch, it kills the AC power instead of sending a signal
> > to the kernel to shut itself down.  OUCH!  The power/status LED is also off.
> 
> This is still broken in 2.6.10-pa2 as well.

On which machine?  It works fine on my 725 and c3600.

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
