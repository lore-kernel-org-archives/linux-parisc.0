From: "Andrew Gaylard" <ag@computer.org>
Subject: Re: [parisc-linux] almost booted a K420...
Date: Thu, 12 Apr 2007 08:41:10 +0200
Message-ID: <9df6f3ea0704112341y55866aebk73373b75e90686d1__30040.0764368989$1416624330$gmane$org@mail.gmail.com>
References: <461DA527.8FF91FC1@bom.gov.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1130272594=="
Cc: parisc-linux@lists.parisc-linux.org
To: "Paul (NCC/CS)." <pts@bom.gov.au>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <461DA527.8FF91FC1@bom.gov.au>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1130272594==
Content-Type: multipart/alternative;
	boundary="----=_Part_22270_10809497.1176360070915"

------=_Part_22270_10809497.1176360070915
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/12/07, Paul (NCC/CS). <pts@bom.gov.au> wrote:
>
>
> thought i'd have another go at my HP sitting in the corner,
> with the new CD debian-40r0-hppa-netinst.iso .
>
> It seemed to boot the kernel but eventually I got:
> >>>
> Freeing unused kernel memory: 328k freed
>
> FLT  0000Kernel panic - not syncing: Kernel Fault
> >>>
>
> It's a HP9000/869 K420 with PA7200 cpu's.
>
> The debian info seems to suggest this should boot
> with a serial console.
>
> Can anyone offer me a direction in which to go to
> from here?
>

Hi Paul,

I'm using a K370 with great success. I'm not sure whether
the Debian install CD will work on a multi-CPU box.  You can
try unplugging all but the first CPU and see if that makes a
difference.  Also, you may have to add "console=ttyB0" or
somesuch to PALO's boot line -- the K classes (and perhaps
a few other boxes) have very different serial hardware.  Oh
wait, I see you have it already.

Sorry this  is a bit vague; I run Gentoo and it was very simple
to boot the install CD.  So if you hit a dead-end, you might
give it a try.

Good luck,
Andrew

------=_Part_22270_10809497.1176360070915
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/12/07, <b class="gmail_sendername">Paul (NCC/CS).</b> &lt;<a href="mailto:pts@bom.gov.au">pts@bom.gov.au</a>&gt; wrote:<div><span class="gmail_quote"></span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<br>thought i&#39;d have another go at my HP sitting in the corner,<br>with the new CD debian-40r0-hppa-netinst.iso .<br><br>It seemed to boot the kernel but eventually I got:<br>&gt;&gt;&gt;<br>Freeing unused kernel memory: 328k freed
<br><br>FLT&nbsp;&nbsp;0000Kernel panic - not syncing: Kernel Fault<br>&gt;&gt;&gt;<br><br>It&#39;s a HP9000/869 K420 with PA7200 cpu&#39;s.<br><br>The debian info seems to suggest this should boot<br>with a serial console.<br><br>
Can anyone offer me a direction in which to go to<br>from here?<br></blockquote></div><br>Hi Paul,<br><br>I&#39;m using a K370 with great success. I&#39;m not sure whether<br>the Debian install CD will work on a multi-CPU box.&nbsp; You can
<br>try unplugging all but the first CPU and see if that makes a<br>difference.&nbsp; Also, you may have to add &quot;console=ttyB0&quot; or<br>somesuch to PALO&#39;s boot line -- the K classes (and perhaps<br>a few other boxes) have very different serial hardware.&nbsp; Oh
<br>wait, I see you have it already.<br><br>Sorry this&nbsp; is a bit vague; I run Gentoo and it was very simple<br>to boot the install CD.&nbsp; So if you hit a dead-end, you might<br>give it a try.<br><br>Good luck,<br>Andrew

------=_Part_22270_10809497.1176360070915--

--===============1130272594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1130272594==--
