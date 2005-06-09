From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Remove __ldcw_align for PA-RISC 2.0 processors
Date: Thu, 9 Jun 2005 15:46:15 +0100
Message-ID: <20050609144615.GA24611@parcelfarce.linux.theplanet.co.uk>
References: <20050609054700.GA9450@colo.lackof.org>
	<200506091429.j59ETPwv008987@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: kyle@fattire.cabal.ca,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506091429.j59ETPwv008987@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 09, 2005 at 10:29:24AM -0400, John David Anglin wrote:
> Yes, you need ",co" to get rid of the 16-byte alignment requirement.
> This causes the operation to be done in cache which is a performance
> win.  I think this is safe for SMP.  While the ",co" completer was
> added in PA 1.1, it wasn't required that it be supported.  Thus,
> I think we are stuck with 16-byte alignment on PA 1.1.

Agreed.  Fortunately, the only machines we care about that are both PA1.1
and SMP are the PA7200 based servers and workstations -- J200, J210, J210XC,
D250, D260, D350, D360, K100, K200, K210, K400 and K410.  Technically, the
early T-class servers and some G, H, I class servers were also SMP PA1.1,
but we don't really care about them.  Anyway, it seems pointless to penalise
the 64-bit machines for something that doesn't affect them.

For userspace, it's obviously different.  There, we have to cope with
any PA processor, and thus have to use a "self aligning" lock, but the
kernel can be fine tuned.

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
