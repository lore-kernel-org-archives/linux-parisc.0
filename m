From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Help: i386-linux -> hppa-hpux cross-compiler
Date: Sun, 25 Jul 2004 21:02:11 +0100
Message-ID: <20040725200211.GA12070@parcelfarce.linux.theplanet.co.uk>
References: <20040725133338.A20781@tuphaan.engr.wichita.edu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Ivan Petrovich <laveer@tuphaan.engr.wichita.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040725133338.A20781@tuphaan.engr.wichita.edu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 25, 2004 at 01:33:38PM -0500, Ivan Petrovich wrote:
> This is not a parisc-linux question, though it is somewhat related.
> I am trying to build a i386-linux to hppa-hpux (not hppa-linux)
> cross-compiler. I have read the parisc-linux FAQ, but found it to not
> be useful for my application.

For the linker, you'll need the hpux linker which was ported in the early
days of the port.  Try http://cvs.parisc-linux.org/obsolete/linker/ but
be warned nobody's touched it for a number of years.  You may also wish
to review old postings to this list (say, 1999/2000) before we ported
the kernel to be ELF.

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
