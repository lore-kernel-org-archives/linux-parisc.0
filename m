From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] parisc: delete __cpuinit usage from all users
Date: Tue, 18 Jun 2013 14:36:08 -0400
Message-ID: <51C0A898.4020909@windriver.com>
References: <1371501264-12546-1-git-send-email-paul.gortmaker@windriver.com> <1371509247.8130.34.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Helge Deller <deller@gmx.de>, <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1371509247.8130.34.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 13-06-17 06:47 PM, James Bottomley wrote:
> On Mon, 2013-06-17 at 16:34 -0400, Paul Gortmaker wrote:
>> The __cpuinit type of throwaway sections might have made sense
>> some time ago when RAM was more constrained, but now the savings
>> do not offset the cost and complications.  For example, the fix in
>> commit 5e427ec2d0 ("x86: Fix bit corruption at CPU resume time")
>> is a good example of the nasty type of bugs that can be created
>> with improper use of the various __init prefixes.
>>
>> After a discussion on LKML[1] it was decided that cpuinit should go
>> the way of devinit and be phased out.  Once all the users are gone,
>> we can then finally remove the macros themselves from linux/init.h.
> 
> Fine by us ... I'd recommend just rolling this into one patch for all
> the cpuinit tags and sending it via the trivial tree (which goes to
> linux-next) that way we'll know if we do anything to compromise it.

Thanks James,

I'll add an ack'd by for you and keep it with the arch agnostic
chunks.  I do want it to go by the arch maintainers 1st though,
and give them 1st right of refusal on carrying the change; e.g.
for MIPS, Ralf wanted to carry the patch due to the level of
tree activity still pending there.  And for sparc, it touches
some trampoline code, so I want to be sure I don't inflict a
silent boot death on the SPARC folks.  It will get in linux-next
though -- I'll be asking Stephen for that shortly.

P.
--

> 
> James
> 
> 
