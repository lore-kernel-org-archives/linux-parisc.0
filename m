From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] compat_sys_ptrace conversions for parisc
Date: Tue, 26 Aug 2008 22:03:11 +0200
Message-ID: <20080826200311.GC3791@lst.de>
References: <200808242026.06295.deller@gmx.de> <200808242033.25481.deller@gmx.de> <20080825171103.GB28485@phobos.i.cabal.ca> <48B2F0AF.3020005@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48B2F0AF.3020005@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 25, 2008 at 07:49:35PM +0200, Helge Deller wrote:
> I agree that my comment suggests that splitting the patch into two parts 
> could make sense to track the changes easier, but if you look into the 
> original code you'll see, that I would need to duplicate all of the 
> arch_ptrace code and then make the copied part 64bit-ready. Then the 
> second patch would delete all of this again and replacing it with the 
> generic function calls.
> IMHO that's a lot of coding and changes without any need. You'll first 
> need to understand coding in my first patch which is then deleted 
> afterwards with the second patch again. And if you look at the final 
> ptrace.c file after applying my patch which I posted here, you'll see 
> that arch_ptrace is now really small and simple to understand.
> 
> That said, I'm not very motivated to split my patch.

Oh, parisc actually uses sys_ptrace as the 32bit entry point.  Yes, I
see your point and take back the suggestion.

