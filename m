From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] compat_sys_ptrace conversions for parisc
Date: Mon, 25 Aug 2008 19:49:35 +0200
Message-ID: <48B2F0AF.3020005@gmx.de>
References: <200808242026.06295.deller@gmx.de> <200808242033.25481.deller@gmx.de> <20080825171103.GB28485@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080825171103.GB28485@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Kyle, Hi Christoph,

Kyle McMartin wrote:
> On Sun, Aug 24, 2008 at 08:33:25PM +0200, Helge Deller wrote:
>> This patch does the compat_sys_ptrace conversion for parisc.
>> In addition it does convert the parisc ptrace code to use the
>> architecture-independent ptrace infrastructure instead of own coding.

Both of you said someting like this:

> This sounds like it should be two seperate patches, for at least the
> reason of making bisecting easier should there be a problem.

I agree that my comment suggests that splitting the patch into two parts 
could make sense to track the changes easier, but if you look into the 
original code you'll see, that I would need to duplicate all of the 
arch_ptrace code and then make the copied part 64bit-ready. Then the 
second patch would delete all of this again and replacing it with the 
generic function calls.
IMHO that's a lot of coding and changes without any need. You'll first 
need to understand coding in my first patch which is then deleted 
afterwards with the second patch again. And if you look at the final 
ptrace.c file after applying my patch which I posted here, you'll see 
that arch_ptrace is now really small and simple to understand.

That said, I'm not very motivated to split my patch.

Helge
