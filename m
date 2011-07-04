From: John David Anglin <dave.anglin@bell.net>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Mon, 4 Jul 2011 14:50:16 -0400
Message-ID: <BLU0-SMTP5FDE70B357D278016D47B975C0@phx.gbl>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>	<BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>	<CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>	<CADZpyiwDx-6oHNaCXoVC_XWpeUuZ3_n5RLzdmZK0Aoeh0ra3tw@mail.gmail.com>	<BLU0-SMTP765C4C4388C64F0F8BF8F8975C0@phx.gbl> <CADZpyiyWCa0o2Rpj_PoJLoT28G_SuV4P896Y-+Y3rWQXqmQWTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiyWCa0o2Rpj_PoJLoT28G_SuV4P896Y-+Y3rWQXqmQWTQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/4/2011 1:49 PM, Carlos O'Donell wrote:
> On Mon, Jul 4, 2011 at 12:58 PM, John David Anglin<dave.anglin@bell.net>  wrote:
>>> Why would this mprotect fail with -EINVAL? It's not page aligned?
>>>
>>> You can see the earlier mmap/mprotect from thread one's stack looks
>>> page aligned.
>> I believe that the stack value needs to be aligned.  See comment in
>> arch_get_unmapped_area.  Not sure if this will fix mprotect.
> What needs to be aligned, the stack value or the addr in a call to mprotect?

Actually, it's not the stack address but the address used in the malloc 
call to allocate the
thread's stack that needs alignment.  I believe 64 bytes are used by the 
parent.  In current
thread setup.  So, it looks like child_stack value is ok.

The Linux man page says the mprotect addr must be a valid pointer or a 
multiple of PAGESIZE.
It's not clear what the mprotect call is trying to protect but it is 
definitely not page aligned.
>> I submitted a patch to return an error if  but there was no comment.
> Reference?
>
http://www.spinics.net/lists/linux-parisc/msg03352.html

Dave
