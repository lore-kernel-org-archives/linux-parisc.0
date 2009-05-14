From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] parisc: ccio-dma: fix build failure without procfs
Date: Thu, 14 May 2009 14:30:51 +0400
Message-ID: <a4423d670905140330k492d38fcjbd101143f0b64d8e@mail.gmail.com>
References: <20090403120854.GA29187@orion>
	 <20090403175902.GK14159@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090403175902.GK14159@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/4/3 Kyle McMartin <kyle@mcmartin.ca>:
> On Fri, Apr 03, 2009 at 04:08:54PM +0400, Alexander Beregalov wrote:
>> Fix this build error when CONFIG_PROC_FS is not set:
>> drivers/parisc/ccio-dma.c:1574: error: 'ccio_proc_info_fops' undeclared
>>
>> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
>
> Applied to the fixes branch.

Hi Kyle.

It still fails with linux-next.

Could you please send it to Linus or ask Stephen to pull different
branch (with all latest changes) of your tree?

Thanks.
