From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Thu, 17 Dec 2009 09:24:05 -0500
Message-ID: <119aab440912170624p58d6f19fk9e6feaab11f6f1a3@mail.gmail.com>
References: <4B294F8B.1070700@gmx.de>
	 <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	James.Bottomley@hansenpartnership.com,
	dann frazier <dannf@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 16, 2009 at 4:35 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> On 12/15/2009 11:21 PM, John David Anglin wrote:
>> >> I have constructed a vfork test case which shows some of the problems
>> >> I have using vfork reliably. This fails every time on my PA8700 system
>> >> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
>> >> being corrupted.
>> >
>> > The test doesn't fail on two of my builds:
>> > Linux mx3210 2.6.31.7 #5 Wed Dec 9 22:49:53 EST 2009 parisc64
>> > Linux hiauly6 2.6.31.7 #18 Wed Dec 9 21:34:36 EST 2009 parisc
>>
>> I did tested your testcase on my c3000 too but it didn't failed for me either.
>> This was on some 2.6.32-rc candidate.
>
> I think it must be because Carlos is building SMP kernels.

Yes, I'm trying to shake out some SMP bugs.

Dan, you said that the emacs32 failure went away when you upgraded to
2.6.32 stable on the buildds. Are they running SMP kernels? Could you
try the vfork test case there?

Test case is here:
http://article.gmane.org/gmane.linux.ports.parisc/2403

Cheers,
Carlos.
