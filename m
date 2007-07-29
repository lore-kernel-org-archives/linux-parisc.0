From: kurtm22@netscape.net
Subject: Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 10:42:15 -0400
Message-ID: <8C9A005CA9EA817-9F4-ADB9__49243.4579799466$1416624421$gmane$org@FWM-D07.sysops.aol.com>
References: <8C996C28EAB2003-444-120B@WEBMAIL-MA12.sysops.aol.com> <200707172303.06515.deller@gmx.de> <8C99D001206F8C3-1154-788@webmail-dd01.sysops.aol.com> <200707291508.14810.deller@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
  boundary="--------MB_8C9A005CA9EA817_9F4_15E98_FWM-D07.sysops.aol.com"
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de
Return-Path: <kurtm22@netscape.net>
In-Reply-To: <200707291508.14810.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>


----------MB_8C9A005CA9EA817_9F4_15E98_FWM-D07.sysops.aol.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"


 
Hi Helge,

I commented out the fb_memset call 
in stifb.c and your suspicions were correct!? 
Not only did the kernel boot but I got the full
GUI login screen.?? When I upgraded from
Woody to Sarge, I also had no GUI so perhaps
this problem was in Sarge too.

Do you have any tests you would like me
to perform on this machine - it's just a hobby
machine for me. 

Thanks for the pointer to the kernel bug page.

Regards,
Kurt


 


 

-----Original Message-----
From: Helge Deller <deller@gmx.de>
To: kurtm22@netscape.net
Cc: parisc-linux@lists.parisc-linux.org
Sent: Sun, 29 Jul 2007 9:08 am
Subject: Re: Boot problem with HPPA 735/125 w/ A1439A CRX










Hi Kurt,

On Wednesday 25 July 2007, kurtm22@netscape.net wrote:
> I did what you suggested and built a new kernel from scratch using the 2.6.22
> source tar.? I did not comment out the fb_memset() call in stifb.c
> prior to the build so I could post the crash results - perhaps
> it will provide more insight to what is going on:
> 
> sticon: Initializing sti text console
> Console: switching to colour STI console 160x64
> Backtrace:
> ??? [<1044e1b0>] stifb_init_fb+0x67c/0x928
> ??? [<1044e4c4>] stifb_init+0x68/0xf8
> ??? ? [<1043d4187>] kernel_init+0xfc/0x2c8
> ??? [<10109c5c>] ret_from_kernel_thread+0x1c/0x24
> 
> kernel fault:? code=15? regs=10984200? (addr=f9000000)
> 
> I can post more of the dump if you need it.? I left the machine 
> sitting there as i am writing down what I see on the screen.

code 15 means "Data TLB miss fault/Data page fault", so in fact it writes to 
memory it shouldn't, or in a way it shouldn't.
I still suspect the fb_memset() call.
Nevertheless, without more info, esp. where in the C-file/stifb_init_fb() 
function is 0x67c I can't do more.
Please read http://parisc-linux.org/faq/kernelbug-howto.html, esp. the section 
"More advanced bug reports".
It describes how to find the problematic code lines.
Alternatively, just comment out the fb_memset() call and try again.

Helge



 


________________________________________________________________________
Check Out the new free AIM(R) Mail -- Unlimited storage and industry-leading spam and email virus protection.

----------MB_8C9A005CA9EA817_9F4_15E98_FWM-D07.sysops.aol.com
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="us-ascii"


<div> <br>
Hi Helge,<br>
<br>
I commented out the fb_memset call <br>
in stifb.c and your suspicions were correct!&nbsp; <br>
Not only did the kernel boot but I got the full<br>
GUI login screen.&nbsp;&nbsp; When I upgraded from<br>
Woody to Sarge, I also had no GUI so perhaps<br>
this problem was in Sarge too.<br>
<br>
Do you have any tests you would like me<br>
to perform on this machine - it's just a hobby<br>
machine for me. <br>
<br>
Thanks for the pointer to the kernel bug page.<br>
<br>
Regards,<br>
Kurt<br>
</div>

<div> <br>
</div>

<div> <br>
</div>
-----Original Message-----<br>
From: Helge Deller &lt;deller@gmx.de&gt;<br>
To: kurtm22@netscape.net<br>
Cc: parisc-linux@lists.parisc-linux.org<br>
Sent: Sun, 29 Jul 2007 9:08 am<br>
Subject: Re: Boot problem with HPPA 735/125 w/ A1439A CRX<br>
<br>






<div id="AOLMsgPart_0_fa16f12a-4251-4a40-b0da-e1334e3e9d9b" style="margin: 0px; font-family: Tahoma,Verdana,Arial,Sans-Serif; font-size: 12px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">

<pre style="font-size: 9pt;"><tt>Hi Kurt,<br>
<br>
On Wednesday 25 July 2007, <a href="mailto:kurtm22@netscape.net">kurtm22@netscape.net</a> wrote:<br>
&gt; I did what you suggested and built a new kernel from scratch using the 2.6.22<br>
&gt; source tar.? I did not comment out the fb_memset() call in stifb.c<br>
&gt; prior to the build so I could post the crash results - perhaps<br>
&gt; it will provide more insight to what is going on:<br>
&gt; <br>
&gt; sticon: Initializing sti text console<br>
&gt; Console: switching to colour STI console 160x64<br>
&gt; Backtrace:<br>
&gt; ??? [&lt;1044e1b0&gt;] stifb_init_fb+0x67c/0x928<br>
&gt; ??? [&lt;1044e4c4&gt;] stifb_init+0x68/0xf8<br>
&gt; ??? ? [&lt;1043d4187&gt;] kernel_init+0xfc/0x2c8<br>
&gt; ??? [&lt;10109c5c&gt;] ret_from_kernel_thread+0x1c/0x24<br>
&gt; <br>
&gt; kernel fault:? code=15? regs=10984200? (addr=f9000000)<br>
&gt; <br>
&gt; I can post more of the dump if you need it.? I left the machine <br>
&gt; sitting there as i am writing down what I see on the screen.<br>
<br>
code 15 means "Data TLB miss fault/Data page fault", so in fact it writes to <br>
memory it shouldn't, or in a way it shouldn't.<br>
I still suspect the fb_memset() call.<br>
Nevertheless, without more info, esp. where in the C-file/stifb_init_fb() <br>
function is 0x67c I can't do more.<br>
Please read <a href="http://parisc-linux.org/faq/kernelbug-howto.html" target="_blank">http://parisc-linux.org/faq/kernelbug-howto.html</a>, esp. the section <br>
"More advanced bug reports".<br>
It describes how to find the problematic code lines.<br>
Alternatively, just comment out the fb_memset() call and try again.<br>
<br>
Helge<br>
</tt></pre>
</div>
 <!-- end of AOLMsgPart_0_fa16f12a-4251-4a40-b0da-e1334e3e9d9b -->

<div class="AOLPromoFooter">
<hr style="margin-top:10px;" />
<a href="http://pr.atwola.com/promoclk/100122638x1081283466x1074645346/aol?redir=http%3A%2F%2Fwww%2Eaim%2Ecom%2Ffun%2Fmail%2F" target="_blank"><b>Check Out the new free AIM(R) Mail</b></a> -- Unlimited storage and industry-leading spam and email virus protection.<br />
</div>

----------MB_8C9A005CA9EA817_9F4_15E98_FWM-D07.sysops.aol.com--
