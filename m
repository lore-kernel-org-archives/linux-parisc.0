From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Sun, 1 Oct 2017 09:20:11 -0400
Message-ID: <F6CD5540-CC99-4D7B-8625-3757D8F05BC6@bell.net>
References: <20170930152506.GA10542@alpha.franken.de> <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net> <20171001114626.GA16118@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171001114626.GA16118@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-01, at 7:46 AM, Tom Bogendoerfer wrote:

> On Sat, Sep 30, 2017 at 01:34:35PM -0400, John David Anglin wrote:
>> Hi Thomas,
>> 
>> On 2017-09-30, at 11:25 AM, Tom Bogendoerfer wrote:
>> 
>>> Does anyone have a C8000 with a running HP-UX on it and can help
>>> getting a register dump of quicksilver ?
>> 
>> I have a c8000 with hpux although I haven't booted it in some time.
>> Let me know specifically what is needed and I'll give it a try.
> 
> does it have a working graphics card ? 

Yes (card used to work but I haven't used it in some time).

> 
> Does anybody know HP-UX ? Could I mmap the register of quicksilver
> and dump it from user space ?

Manpage for mmap says:

      The mmap() function is supported for regular files.  Support for any
      other type of file is unspecified.

If there is a device, possibly one can use dd.

Dave
--
John David Anglin	dave.anglin@bell.net



