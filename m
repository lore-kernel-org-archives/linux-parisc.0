From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] BUG 2.6.9-rc2-pa9 data page fault in free_block()
Date: Mon, 27 Sep 2004 12:34:15 +0100
Message-ID: <20040927113415.GP16153@parcelfarce.linux.theplanet.co.uk>
References: <20040927053355.GB12024@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040927053355.GB12024@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 26, 2004 at 11:33:55PM -0600, Grant Grundler wrote:
> Kernel Fault: Code=15 regs=000000001479c560 (Addr=00000001ffe3b618)
> ...
>  IAOQ[0]: free_block+0xa8/0x1a0
>  IAOQ[1]: free_block+0xac/0x1a0
>  RP(r2): drain_array_locked+0xe4/0x118
> 
> Full console output appended.
> 
> Oh...I just noticed that's right after/while fusion driver initialized.
> I couldn't get that work reliably on c3000 with 2.6.8.1 either.
> So that's my first suspect. :^(

It's worth turning on Debug memory allocations (DEBUG_SLAB).  That should
catch this problem earlier.

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
