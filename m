From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Wed, 29 Dec 2004 22:03:45 +0000
Message-ID: <20041229220345.GF18338@parcelfarce.linux.theplanet.co.uk>
References: <200412260504.40205.vapier@gentoo.org>
	<200412291419.36568.vapier@gentoo.org>
	<1104355710.5298.16.camel@mulgrave>
	<200412291649.29411.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412291649.29411.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 29, 2004 at 04:49:29PM -0500, Mike Frysinger wrote:
> On Wednesday 29 December 2004 04:28 pm, James Bottomley wrote:
> > So now I'd like to see what this is ... it causes your nice ultra3 drive
> > only to work at async speeds (about 4MB/s).
> 
> i'll be the first to admit that i dont know much about scsi ... but even 
> though my drive is an ultra3, i thought my built in C360 controller didnt 
> support that ?

That's right, but your drive is capable of FAST-40 and the controller is capable of FAST-20.  They should negotiate a FAST-20 (40MB/s) transfer contract, but
because the drive is doing weird stuff, it keeps falling back ... until it
reaches async, which is just about the slowest contract defined.

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
