From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] fpu emulation: another stupid question
Date: Fri, 14 Jan 2005 16:04:08 +0000
Message-ID: <20050114160408.GK30982@parcelfarce.linux.theplanet.co.uk>
References: <41DE4A3A0000261D@mail-1-bnl.tiscali.it>
	<20050114124102.GE30982@parcelfarce.linux.theplanet.co.uk>
	<20050114160233.GQ1281@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050114160233.GQ1281@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jan 14, 2005 at 11:02:33AM -0500, Carlos O'Donell wrote:
> > > So do we need the emaulation code in our kernel?
> > 
> > The emulation code also handles conditions that are not implemented by the
> > hardware.  I forget what they are exactly; some of the 128-bit wide FP
> > ops and some operations involving denormalised or infinite numbers.
> 
> Doesn't it also happen to handle cases where the operands are not
> aligned properly?

I'd've thought that'd be the unaligned trap handler rather than the FP
emulation code, but you may be right -- I don't care to look too hard ;-)

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
