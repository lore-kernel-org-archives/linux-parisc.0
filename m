From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] drop superfluous .align 16
Date: Mon, 25 Aug 2008 22:26:19 -0600
Message-ID: <20080826042619.GB30449@colo.lackof.org>
References: <200808242026.06295.deller@gmx.de> <200808242051.12202.deller@gmx.de> <1219604258.4550.3.camel@localhost.localdomain> <48B2A62C.2060001@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48B2A62C.2060001@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 25, 2008 at 02:31:40PM +0200, Helge Deller wrote:
> James Bottomley wrote:
>> On Sun, 2008-08-24 at 20:51 +0200, Helge Deller wrote:
>>> This .align 16 is misplaced and should be in front of the 
>>> ENTRY(lws_lock_start).
>>> Works because of pure luck since we have a .align PAGE_SIZE before it 
>>> instead.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
>>> index 69b6eeb..c6ff81f 100644
>>> --- a/arch/parisc/kernel/syscall.S
>>> +++ b/arch/parisc/kernel/syscall.S
>>> @@ -640,7 +640,6 @@ END(sys_call_table64)
>>>  	.align	PAGE_SIZE
>>>  ENTRY(lws_lock_start)
>>>  	/* lws locks */
>>> -	.align 16
>>>  	.rept 16
>>>  	/* Keep locks aligned at 16-bytes */
>>>  	.word 1
>> I think I'd really rather keep this.  It may be technically superfluous
>> because of the .align PAGE_SIZE above it, but that belongs to the
>> syscall table.  
>
>> If anyone ever moved this section in head.S, the align
>> 16 ensures nothing goes wrong.
>
> Hi James,
>
> If the block is moved, then that's exactly what this .align does not 
> ensure.
> We had this discussion already here on the list. Please read the full 
> thread: http://marc.info/?t=121554765000005&r=1&w=2

Helge,
Thanks for tracking and resubmitting this...Carlos already ACK'd and I think
it would be good if kyle added it to his patch queue.

But I liked two other things proposed in this thread.
1) jejb's preference to document the alignement requirement 
2) jda's proposal for ENTRY_ALIGN() (which accomplishes (1))

So I've hacked your patch to include those two things.

I've only build-tested this for 64-bit builds.

thanks,
grant

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Grant Grundler <grundler@parisc-linux.org>


diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 69b6eeb..faf8b37 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -638,11 +638,10 @@ END(sys_call_table64)
 	*/
 	.section .data
 	.align	PAGE_SIZE
-ENTRY(lws_lock_start)
+
+ENTRY_ALIGN(lws_lock_start,16)
 	/* lws locks */
-	.align 16
 	.rept 16
-	/* Keep locks aligned at 16-bytes */
 	.word 1
 	.word 0 
 	.word 0
diff --git a/include/asm-parisc/linkage.h b/include/asm-parisc/linkage.h
index 0b19a72..2c6cbe2 100644
--- a/include/asm-parisc/linkage.h
+++ b/include/asm-parisc/linkage.h
@@ -17,6 +17,11 @@
 	ALIGN !\
 name:
 
+#define ENTRY_ALIGN(name,alignval) \
+	.export name !\
+	.align alignval !\
+name:
+
 #ifdef CONFIG_64BIT
 #define ENDPROC(name) \
 	END(name)
