From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap
 (code 7)
Date: Tue, 6 Sep 2011 17:06:35 +0200
Message-ID: <ae3de0fe39e56a022785eab6b105e6c7.squirrel@webmail.sf-mail.de>
References: <201108191958.35802.eike-kernel@sf-tec.de>
    <a53708ae6c6247c7ce45d4e5b8131ea7.squirrel@webmail.sf-mail.de>
    <20110831154820.GH22818@bombadil.infradead.org>
    <20110831160419.GI22818@bombadil.infradead.org>
    <65eae6bb26716d64e7f5959302b26fa9.squirrel@webmail.sf-mail.de>
    <74797e028a4c070f42df834f9b0b0079.squirrel@webmail.sf-mail.de>
    <20110906134611.GA25825@bombadil.infradead.org>
    <20110906140029.GB25825@bombadil.infradead.org>
    <1315318507.6567.2.camel@dabdike.int.hansenpartnership.com>
    <20110906142025.GC25825@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110906142025.GC25825@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, Sep 06, 2011 at 09:15:07AM -0500, James Bottomley wrote:
>> It's possible that one of the flushing patches is to blame; I just can't
>> see how.  Most likely is
>>
>> commit d7dd2ff11b7fcd425aca5a875983c862d19a67ae
>> Author: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Date:   Thu Apr 14 18:25:21 2011 -0500
>>
>>     [PARISC] only make executable areas executable
>>
>
> This looks promising, the second commit doesn't touch the flush_*_local,
> so I think it's probably not a candidate.
>
> Rolf, can you revert d7dd2ff11b7fcd425aca5a875983c862d19a67ae and see
> what happens?

Yes, testing.

Eike
