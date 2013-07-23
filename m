From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH]  parisc: Fix cache routines to ignore vma's with an invalid pfn
Date: Tue, 23 Jul 2013 19:44:32 -0400
Message-ID: <BLU0-SMTP673C7B36CA7DEFADDE7F9B976F0@phx.gbl>
References: <BLU0-SMTP618F2A575D86195DC418DD976F0@phx.gbl> <51EEFB3B.3010107@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51EEFB3B.3010107@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 23-Jul-13, at 5:52 PM, Helge Deller wrote:

> I've restructured the functions with cleaner return/continue code  
> and submitted it into my "for-next" git tree at
> https://patchwork.kernel.org/patch/2825923/mbox/

Looks fine to me.  I'll test soon.

Dave
--
John David Anglin	dave.anglin@bell.net



