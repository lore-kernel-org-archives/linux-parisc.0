From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] "Unknown machine at ..." on N4k
Date: Thu, 15 Jul 2004 18:13:14 +0100
Message-ID: <20040715171314.GJ32326@parcelfarce.linux.theplanet.co.uk>
References: <40BD9F870001BC0C@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40BD9F870001BC0C@ocpmta2.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 14, 2004 at 05:24:23PM +0000, Joel Soete wrote:
> I just noticed that that in during the "Found devices:" on the the N4k it's
> mentioned:

What kernel?

> [...]
> 18. DEW BC Runway Port at 0xfffffffffed24000 [36] { 7, 0x0, 0x584, 0x0000c
> }
> 19. Unknown machine at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x00000
> }

        {HPHW_NPROC,0x5D3,0x4,0x91,"Prelude W+ 540"},

We have this one ...

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
