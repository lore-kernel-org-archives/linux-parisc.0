From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 17:50:21 +0000
Message-ID: <20041111175021.GA26623@parcelfarce.linux.theplanet.co.uk>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org>
	<20041111173901.GX2639@baldric.uwo.ca>
	<20041111174258.GT15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111174258.GT15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 11, 2004 at 09:42:58AM -0800, Randolph Chung wrote:
> eh? nononono. we should *always* be able to only preserve callee-saved
> registers. From the application point of view, when they call e.g.
> read(), it is a function call. The app should not expect any
> caller-saved registers to be preserved across the function/system call.

As I'm sure you already know, we do have to be careful to avoid leaking
kernel-internal or another task's information in the registers that
are call-clobbered.  I know some architectures do this by having a
kernel exit path that deliberately clobbers as many registers as possible.

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
