From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 6a4be75aa84b0bea7939bca1af112fb3c2dfd86e make my gcc (still
	4.2) unhappy ;<(
Date: Thu, 29 May 2008 14:48:08 -0400
Message-ID: <20080529184808.GH30501@phobos.i.cabal.ca>
References: <483EE6B4.2080600@scarlet.be> <20080529180040.GG30501@phobos.i.cabal.ca> <483EF31C.30805@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <483EF31C.30805@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 29, 2008 at 06:17:00PM +0000, rubisher wrote:
> Kyle McMartin wrote:
>> On Thu, May 29, 2008 at 05:24:04PM +0000, rubisher wrote:
>>> Hello Kyle,
>>>
>>> This hunk:
>>> +
>>> +/* from pacache.S -- needed for copy_page */
>>> +extern void copy_user_page_asm(void);
>>> +EXPORT_SYMBOL(copy_user_page_asm);
>>>
>>
>> yeah, i know,
> Oops, sorry.
>
>> i've been too busy trying to figure out why gcc 4.3 is
>> fucked to push a new commit.
>>
> I would so like to be helpfull but haven't anymore enough time for this investigation, sorry.
>

it's ok, i appreciate all the effort you've put in so far :)

cheers, kyle
