From: rubisher <rubisher@scarlet.be>
Subject: Re: 6a4be75aa84b0bea7939bca1af112fb3c2dfd86e make my gcc (still	4.2)
 unhappy ;<(
Date: Thu, 29 May 2008 18:17:00 +0000
Message-ID: <483EF31C.30805@scarlet.be>
References: <483EE6B4.2080600@scarlet.be> <20080529180040.GG30501@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080529180040.GG30501@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> On Thu, May 29, 2008 at 05:24:04PM +0000, rubisher wrote:
>> Hello Kyle,
>>
>> This hunk:
>> +
>> +/* from pacache.S -- needed for copy_page */
>> +extern void copy_user_page_asm(void);
>> +EXPORT_SYMBOL(copy_user_page_asm);
>>
> 
> yeah, i know,
Oops, sorry.

> i've been too busy trying to figure out why gcc 4.3 is
> fucked to push a new commit.
>
I would so like to be helpfull but haven't anymore enough time for this investigation, sorry.

> i'll do that later today though.
> 
No pb.

Tx,
	r.

> r, kyle
> 
> 

