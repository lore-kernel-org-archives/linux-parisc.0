From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6.9-bk6-pa4:Tuip driver broken on n4k
Date: Wed, 27 Oct 2004 12:27:20 +0100
Message-ID: <20041027112720.GG3450@parcelfarce.linux.theplanet.co.uk>
References: <41617480000075DF@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41617480000075DF@mail-4-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 27, 2004 at 12:26:25PM +0200, Joel Soete wrote:
> Hello pa,
> 
> Unfortunately, the tulip driver seems to be broken on this n4k:
> the boot sequence start fine until message:
> Linux Tulip driver version 1.1.13 (May 11, 2002)
> 
> then system panic
> (unfortunately I don't have any way to grab pimfo on this system)
> 
> Any idea?

Not really, I have both a built-in tulip and a quad-port tulip card in
my c3600 and it works just fine.

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
