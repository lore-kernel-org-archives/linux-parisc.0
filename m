From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] gcc (3.3.5) causing problems in our latest kernel.
Date: Mon, 4 Apr 2005 01:07:23 +0100
Message-ID: <20050404000723.GD18349@parcelfarce.linux.theplanet.co.uk>
References: <1112564457.5858.7.camel@mulgrave>
	<20050403221332.GC18349@parcelfarce.linux.theplanet.co.uk>
	<1112572589.5860.3.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1112572589.5860.3.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 03, 2005 at 06:56:28PM -0500, James Bottomley wrote:
> On Sun, 2005-04-03 at 23:13 +0100, Matthew Wilcox wrote:
> > Perhaps there's a difference between an inline function and a macro
> > in terms of constant propagation?  If you turn __test_width() into
> > a macro, it should work (see the implementation of __get_user() in
> > asm-parisc/uaccess.h)
> 
> Yes, if I change it to a pure #define, everything works OK.
> 
> However, unless we can get the inline function to work, I still have to
> go back to davem ... Do I just tell him we can't fix our toolchain, so
> how about this?

Even if we can fix the toolchain, there's going to be a lot of people
out there who'd have to upgrade.  I'd prefer it if we didn't have to
force an upgrade ...

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
