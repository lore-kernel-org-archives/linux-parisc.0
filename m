From: rubisher <rubisher@scarlet.be>
Subject: Re: iommu-helpers.h patch
Date: Fri, 28 Dec 2007 15:27:26 +0000
Message-ID: <477515DE.7090403@scarlet.be>
References: <476D1509.1070601@scarlet.be> <20071228075610.GD17782@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071228075610.GD17782@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Sat, Dec 22, 2007 at 01:45:45PM +0000, rubisher wrote:
>> Hello *,
>>
>> This seems to be missed a while ago ;-)
>>
>> --- drivers-parisc-iommu-helpers.h-git20071218	2007-12-21 
>> 19:02:38.000000000 +0000
>> +++ drivers-parisc-iommu-helpers.h-git20071218.new	2007-12-22 
>> 13:39:04.000000000 +0000
>> @@ -29,7 +29,7 @@
>>  		long size;
>>
>>  		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
>> -			   (unsigned long)sg_dma_address(startsg), cnt,
>> +			   (unsigned long)sg_dma_address(startsg), size,
> 
> Sorry - but this is wrong. "size" isn't initialized until later.
Agree with you: size is initialized later.

Anyway cnt variable was gone:
# grep cnt drivers/parisc/iommu-helpers.h
                            (unsigned long)sg_dma_address(startsg), cnt,

and imo it was with this patch:
<http://cvs.parisc-linux.org/linux-2.6/drivers/parisc/ccio-dma.c?r1=1.11&r2=1.12&makepatch=1&diff_format=u>

the interesting hunk's part was:
-		int cnt = sg_dma_len(startsg);
-		sg_dma_len(startsg) = 0;
+		unsigned long vaddr;
+		long size;

  		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
  			   (unsigned long)sg_dma_address(startsg), cnt,
  			   sg_virt_addr(startsg), startsg->length
  		);

+

(and make a kernel with DEBUG_CCIO_RUN_SG failed with an error at this place, so we need to patch ;-)

> "cnt" was the thing I needed/wanted dumped.
> 
So may be something like:

                 DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
-                          (unsigned long)sg_dma_address(startsg), cnt,
+                          (unsigned long)sg_dma_address(startsg), sg_dma_len(startsg),
                            sg_virt_addr(startsg), startsg->length
                 );

Tx,
	r.

> cheers,
> grant
> 
>>  			   sg_virt_addr(startsg), startsg->length
>>  		);
>> === <> ===
>>
>> Cheers,
>> 	r.
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

