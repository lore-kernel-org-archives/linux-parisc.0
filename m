From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6 upgrade problems
Date: Mon, 17 Jan 2005 20:01:41 +0000
Message-ID: <20050117200141.GJ30982@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0501171521470.3385@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Steve Bromwich <hppa@fop.ns.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0501171521470.3385@brain.fop.ns.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 17, 2005 at 03:39:00PM -0400, Steve Bromwich wrote:
> I just upgraded my 715/100XC to 2.6.10-pa10 from 2.4.27, and I've hit a
> few snags. First is I've lost serial console ("if this is the last message
> you see..."). I did make oldconfig from the 2.4.27 config, but I think
> I've fluffed it and missed the driver. Can someone see what I've missed in
> the attached config?

Nothing, it seems to be fine.  You have CONFIG_GSC, CONFIG_GSC_LASI,
CONFIG_GSC_WAX and CONFIG_SERIAL_8250, which should be enough.  The
715/100 is pretty similar to the 725/100 I have, which works.

Could you send me your dmesg?  I'd like to figure out why this is failing.

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
