From: rubisher <rubisher@scarlet.be>
Subject: [Patch] ccio-dma.c [Was: Yet another ccio fix idea?]
Date: Sat, 15 Mar 2008 19:21:15 +0000
Message-ID: <47DC21AB.9090005@scarlet.be>
References: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be> <20080314060251.GJ24794@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave <dave@hiauly1.hia.nrc.ca>,
	"James.Bottomley" <James.Bottomley@HansenPartnership.com>,
	"soete.joel" <soete.joel@scarlet.be>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	kyle <kyle@parisc-linux.org>, matthew <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080314060251.GJ24794@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Wed, Mar 12, 2008 at 10:16:29AM +0100, rubisher wrote:
> ...
>> mmm follwing stuff shouldn't so be enough:
>> Index: b/drivers/parisc/ccio-dma.c
>> ===================================================================
>> --- a/drivers/parisc/ccio-dma.c 2008-03-12 08:49:20.000000000 +0000
>> +++ b/drivers/parisc/ccio-dma.c 2008-03-12 08:50:54.000000000 +0000
>> @@ -624,7 +624,8 @@
>>         ** the real mode coherence index generation of U2, the PDIR entry
>>         ** must be flushed to memory to retain coherence."
>>         */
>> -       asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
>> +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[1]));
>> +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[0]));
> 
> NACK
> 
>>         asm volatile("sync");
>>  }
>>
>> @@ -695,7 +696,7 @@
>>                 ** Hopefully someone figures out how to patch (NOP) the
>>                 ** FDC/SYNC out at boot time.
>>                 */
>> -               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
>> +               asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]));
> 
> NACK - keep it simple with the original proposed patch.
> 
Ok here it is:
Signed-off-by: Joel Soete <soete dot joel at scarlet dot be>
---
  drivers/parisc/ccio-dma.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/parisc/ccio-dma.c
===================================================================
--- a/drivers/parisc/ccio-dma.c 2008-03-12 08:49:20.000000000 +0000
+++ b/drivers/parisc/ccio-dma.c 2008-03-15 19:19:52.000000000 +0000
@@ -695,7 +695,7 @@
                 ** Hopefully someone figures out how to patch (NOP) the
                 ** FDC/SYNC out at boot time.
                 */
-               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
+               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));

                 iovp     += IOVP_SIZE;
                 byte_cnt -= IOVP_SIZE;
=== <> ===

[snip]

Hth,
	r.
