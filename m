Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EEFA4976
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 14:47:30 -0600 (MDT)
Message-ID: <40770BDF.10209@tiscali.be>
Date: Fri, 09 Apr 2004 20:47:27 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
	<20040323045151.GA6190@colo.lackof.org>
In-Reply-To: <20040323045151.GA6190@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi James,

I come back to you with your ccio-dma patch because I don't undertand this part:
[snip]
#ifdef CONFIG_PROC_FS
/*
  * CCIO_SEARCH_TIME can help measure how fast the bitmap search is.
  * impacts performance though - ditch it if you don't use it.
  */
#define CCIO_SEARCH_TIME
#undef CCIO_MAP_STATS
#else
#undef CCIO_SEARCH_TIME
#undef CCIO_MAP_STATS
#endif

CCIO_MAP_STATS is always undef?

Could it be the panic reason of my c110 (_apparently_ since this patch)?

Thanks in advance for your attention,
	Joel


Grant Grundler wrote:
> On Sun, Mar 21, 2004 at 12:57:16PM -0700, Grant Grundler wrote:
> 
>>>Kernel Fault: Code=26 regs=10594380 (Addr=00000000)
>>
>>null ptr deref.
>>
>>...
>>
>>> IAOQ[0]: lasi700_probe+0x18c/0x1cc
>>> IAOQ[1]: lasi700_probe+0x190/0x1cc
>>> RP(r2): lasi700_probe+0x58/0x1cc
>>
>>IOAQ[0] is the offending instruction.
> 
> 
> James Bottomley observed a problem with hppa_dma_ops
> not being set properly for his U2/Uturn box.
> This is likely the same problem.
> See ccio driver isn't claiming the chip when it should.
> 
> grant
> 
