From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: Sun, 21 Nov 2004 02:36:28 +0000
Message-ID: <20041121023628.GB25636@parcelfarce.linux.theplanet.co.uk>
References: <20041116063733.GA27633@colo.lackof.org>
	<20041116150748.GI26623@parcelfarce.linux.theplanet.co.uk>
	<20041116160939.GB4176@colo.lackof.org>
	<20041116163403.GJ26623@parcelfarce.linux.theplanet.co.uk>
	<20041116181427.GG4176@colo.lackof.org>
	<419FC7C4.5030606@tiscali.be>
	<20041120234201.GD11503@colo.lackof.org>
	<20041120234518.GA25636@parcelfarce.linux.theplanet.co.uk>
	<20041121000256.GE11503@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041121000256.GE11503@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 20, 2004 at 05:02:56PM -0700, Grant Grundler wrote:
> Ah good. But don't most EISA devices only support 24-bits?
> Oh wait...maybe that's just an ISA bus limitation that was
> carried along into EISA?

AFAIK, that's purely an ISA card limitation.  If you plug an ISA card into
an EISA slot, it'll only be able to DMA to 24-bit addresses.  But an
ISA card in an EISA slot don't get an eisa_device.

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
