From: Helge Deller <deller@gmx.de>
Subject: Re: [git patches] parisc for 2.6.32
Date: Tue, 06 Oct 2009 22:53:29 +0200
Message-ID: <4ACBAE49.9020903@gmx.de>
References: <20091006172602.GA1924@hera.kernel.org> <alpine.LFD.2.01.0910061035050.3432@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: kyle@mcmartin.ca, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.01.0910061035050.3432@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

On 10/06/2009 07:40 PM, Linus Torvalds wrote:
> On Tue, 6 Oct 2009, Kyle McMartin wrote:
>> Mostly fixes, except for the tracehook stuff...
>
> I don't see how this can be fixes, since I can't recall any parisc pulls
> during the merge window.

Yes, sadly it was not in time.
And of course it's no excuse, that you didn't received a real pull-request,
even after Kyle asked for feedback for his tree with his mail on LKML and
parisc-list on 2009-09-28:
http://www.pubbs.net/kernel/200909/123965/

> So now you come in after the merge window has been closed for over a week,
> and want to do a parisc merge?
>
> Tell me why I should take this. Tell me why I shouldn't just wait until
> the next merge window (or rather "_you_ should have waited").

This patch really only touches parisc-specific files and it includes
important fixes without which the parisc kernel won't even compile and link.
So, it would help us parisc-porters a lot if you could do an exception and
still pull from Kyle's tree, even after this merge window has been closed.
At least, it would make me personally very happy...

Helge
