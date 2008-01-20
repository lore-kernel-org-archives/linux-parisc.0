From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: ccio_clear_io_tlb() and __raw_write() more question?
Date: Sun, 20 Jan 2008 12:06:40 -0700
Message-ID: <20080120190640.GA10928@colo.lackof.org>
References: <JUQMH1$0E837D5F7A1526B30DCF5BF1A8BE2816@scarlet.be> <20080119170705.GC11553@colo.lackof.org> <47931D26.50204@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47931D26.50204@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 20, 2008 at 10:06:30AM +0000, rubisher wrote:
...
>> Willy is correct - writes to this IO space (0xf0000000) address is 
>> uncached.
> mmm, is it the reason why you (I mean hp engineers) call it "f-space": IO 
> space addresses starting by 0xf?

Yes.

grant
