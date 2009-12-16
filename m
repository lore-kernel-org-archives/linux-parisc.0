From: Helge Deller <deller@gmx.de>
Subject: Re: vfork test case.
Date: Wed, 16 Dec 2009 22:22:19 +0100
Message-ID: <4B294F8B.1070700@gmx.de>
References: <20091215222119.E6CD84ED7@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091215222119.E6CD84ED7@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/15/2009 11:21 PM, John David Anglin wrote:
>> I have constructed a vfork test case which shows some of the problems
>> I have using vfork reliably. This fails every time on my PA8700 system
>> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
>> being corrupted.
>
> The test doesn't fail on two of my builds:
> Linux mx3210 2.6.31.7 #5 Wed Dec 9 22:49:53 EST 2009 parisc64
> Linux hiauly6 2.6.31.7 #18 Wed Dec 9 21:34:36 EST 2009 parisc

I did tested your testcase on my c3000 too but it didn't failed for me either.
This was on some 2.6.32-rc candidate.

Helge
