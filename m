From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Fwd: 2.6.9-pa1 broken GSC support
Date: Fri, 22 Oct 2004 12:12:21 +0100
Message-ID: <20041022111221.GI16153__23921.406400814$1416623582$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20041020124733.GB25064@roadwarrior.mcmartin.ca>
	<4161748000005800@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4161748000005800@mail-4-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 21, 2004 at 06:08:03PM +0200, Joel Soete wrote:
> I don't have any pb here to build it for my c110 so I presume that's another
> compiler pb.
> Here I use a debian unstable :) with
> # gcc -v
> Reading specs from /usr/lib/gcc-lib/hppa-linux/3.3.5/specs

I'm pretty sure Martin's using 3.4 which is noticably pickier about
inlining.  I had a quick look at the parport_gsc stuff and it looks like
a bit of a mess.  I'd start by moving everything from parport_gsc.h
into parport_gsc.c or at least moving asm-parisc/parport_gs.h to
drivers/parport/.

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
