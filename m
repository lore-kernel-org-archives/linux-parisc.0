Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF9C94830
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Sep 2003 13:26:14 -0600 (MDT)
Message-ID: <3F58E355.30009@tiscali.be>
Date: Fri, 05 Sep 2003 19:26:13 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] a fast fls also for 2.6?
References: <3F58838A.9010203@tiscali.be> <3F5888F3.5060609@tiscali.be> <20030905182621.GC10216@dsl2.external.hp.com>
In-Reply-To: <20030905182621.GC10216@dsl2.external.hp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Grant Grundler wrote:

>On Fri, Sep 05, 2003 at 01:00:35PM +0000, Joel Soete wrote:
>  
>
>>remember me that I also suggest a __fls() in: 
>><http://lists.parisc-linux.org/pipermail/parisc-linux/2003-August/020628.html>
>>    
>>
>
>sorry - I missed that.
> 
>  
>
>>Without any remark, I don't know if you could also be interested to 
>>include it in 2.6.
>>    
>>
>
>no - becuase fls() and ffs() return the same values for given input.
>(I see comments in include/asm-ppc/bitops.h to that effect).
>
>parisc __ffs costs the same number of cycles regardless of input.
>(2 cycles per 3 instructions about on PA 2.0 machines).
>ie there is no advantage to "searching from the top" vs "searching
>from the bottom" which is what I think the intent of fls() vs ffs().
>For generic implementations, this intent is important.
>
>What we could do is redefine fls() to also use ffs() and add
>my comment above. Patch appended. Please test/review and tell me
>if that should be committed. I haven't tested it yet and the comments
>in PPC bitops.h could be wrong.
>
>thanks,
>grant
>
>
>Index: include/asm-parisc/bitops.h
>===================================================================
>RCS file: /var/cvs/linux-2.6/include/asm-parisc/bitops.h,v
>retrieving revision 1.2
>diff -u -p -r1.2 bitops.h
>--- include/asm-parisc/bitops.h	1 Sep 2003 00:30:42 -0000	1.2
>+++ include/asm-parisc/bitops.h	5 Sep 2003 18:11:21 -0000
>@@ -281,9 +281,14 @@ static __inline__ int ffs(int x)
> 
> /*
>  * fls: find last bit set.
>+ *
>+ * parisc __ffs costs the same number of cycles regardless of input.
>+ * A similar implementation for __fls() would have no advantage.
>+ * ie there is no advantage to "searching from the top" vs "searching 
>+ * from the bottom" which is the intent of fls() vs ffs().
>  */
> 
>-#define fls(x) generic_fls(x)
>+#define fls(x) ffs(x)
> 
> /*
>  * hweightN: returns the hamming weight (i.e. the number
>
>  
>
My bad, I undurstand that ffs return the index of the first bit set otc 
fls returning the the index of the last bit set
(ie for 1010: ffs would return 2 and fls would return 4)?

Sorry for confusion. It was never the less a good exercice ;)

Thanks,
    Joel
