From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Tue, 26 Jul 2005 15:18:37 +0100
Message-ID: <20050726141837.GB6663@parcelfarce.linux.theplanet.co.uk>
References: <1122036994.10454.131.camel@thor.tres.org>
	<20050725000919.GA18659@colo.lackof.org>
	<1122272788.10644.71.camel@thor.tres.org>
	<20050726132402.GA32722@colo.lackof.org>
	<1122385036.10644.146.camel@thor.tres.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Tres Melton <tres@mindspring.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1122385036.10644.146.camel@thor.tres.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 26, 2005 at 07:37:16AM -0600, Tres Melton wrote:
> I'm advocating a way for user space to *know* what the kernel is
> running.  It is this thinking crap that is messing things up.

User space should not "know" what HZ the kernel is using.  Instead, all
interfaces should be properly reported in terms of whatever HZ userspace
used to assume (100 on i386, other values on other platforms).  I don't
know what interface gprof is using, but it needs to be fixed.

Otherwise we stand no chance of going to a dynamic HZ in the future.

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
