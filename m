From: "Max Grabert" <parisc@gmail.com>
Subject: Re: [parisc-linux] [BUG] SysRQ H kills the machine
Date: Thu, 27 Jul 2006 14:09:47 +0100
Message-ID: <e6eae0290607270609l21c9efc3qbf3418c01729c920@mail.gmail.com>
References: <J32BVJ$511EFF3589D7A38F32F3AACAAF57BFF4@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============2103738440=="
Cc: "James.Bottomley" <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 T-Bone <T-Bone@parisc-linux.org>
To: "Joel Soete" <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J32BVJ$511EFF3589D7A38F32F3AACAAF57BFF4@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============2103738440==
Content-Type: multipart/alternative;
	boundary="----=_Part_26642_7238327.1154005787697"

------=_Part_26642_7238327.1154005787697
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Joel,

The 'Magic System Request' key combo can be used
to print out some kernel debug info to the console,
or to do an emergency umount of all filesystems.

See /usr/src/linux/Documentation/sysrq.txt

Most people won't have activated this feature in the kernel,
except for kernel developers or other freaks ;)


On 27/07/06, Joel Soete <soete.joel@scarlet.be> wrote:
>
> > On Mon, 2006-07-24 at 00:01 -0400, Thibaut VARENE wrote:
> > > Hi pa-ckers
> > >
> > > quick brain dump before going to bed:
> > > 2.6.18-rc1-pa3
> > > boot init=/bin/sh -- machine is alive
> > > issue a sysrq h (help) -- machine is dead
> > >
> mmm is there a dpkg containing this 'sysrq' cmd?


There is none. It is a  key combo. Over the serial line it is usually
initiated by a <BRK> signal + a character (see the sysrq.txt mentioned
above).

> > happened to me on parisc and probably ia64 (have to double check the
> latter).
> >
> > This is a known and incredibly annoying bug:  serial console is broken
> > for sysrq.  Alan Cox is currently trying to fix it, I believe.
> >
> Is it this related:
> --- snip ---
> Author: Andrew Morton <akpm@osdl.org>
> Date:   Fri Jun 30 02:29:59 2006 -0700
>
>     [SERIAL] 8250: sysrq deadlock fix
>
>     Fix http://bugzilla.kernel.org/show_bug.cgi?id=6716
>
>     Doing a sysrq over a serial line into an SMP machine presently
> deadlocks.


Seems so.

    Signed-off-by: Andrew Morton <akpm@osdl.org>
>     Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> --- snip ---
>
> (ChangeLog-2.6.18-rc2)
>
> if yes I tested on my n4k but unfortunately doesn't help for the smp pb:
> after only 1 day and 22h of my stress test it still hanging in dump_stack
> (I was hoping it could be the place where things went wrong too ;-( )


I doubt it, I don't know too much about kernel internals, but looking at the
patch you can see it just adds a extra 'if' for the sysrq case, so it
shouldn't affect anything else ...


    Max

------=_Part_26642_7238327.1154005787697
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Joel,<br><br>The 'Magic System Request' key combo can be used<br>to print out some kernel debug info to the console,<br>or to do an emergency umount of all filesystems.<br><br>See /usr/src/linux/Documentation/sysrq.txt<br>
<br>Most people won't have activated this feature in the kernel,<br>except for kernel developers or other freaks ;)<br><br><br><div><span class="gmail_quote">On 27/07/06, <b class="gmail_sendername">Joel Soete</b> &lt;<a href="mailto:soete.joel@scarlet.be">
soete.joel@scarlet.be</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">&gt; On Mon, 2006-07-24 at 00:01 -0400, Thibaut VARENE wrote:
<br>&gt; &gt; Hi pa-ckers<br>&gt; &gt;<br>&gt; &gt; quick brain dump before going to bed:<br>&gt; &gt; 2.6.18-rc1-pa3<br>&gt; &gt; boot init=/bin/sh -- machine is alive<br>&gt; &gt; issue a sysrq h (help) -- machine is dead
<br>&gt; &gt;<br>mmm is there a dpkg containing this 'sysrq' cmd?</blockquote><div><br>There is none. It is a&nbsp; key combo. Over the serial line it is usually<br>initiated by a &lt;BRK&gt; signal + a character (see the sysrq.txt
 mentioned above).<br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">&gt; &gt; happened to me on parisc and probably ia64 (have to double check the latter).
<br>&gt;<br>&gt; This is a known and incredibly annoying bug:&nbsp;&nbsp;serial console is broken<br>&gt; for sysrq.&nbsp;&nbsp;Alan Cox is currently trying to fix it, I believe.<br>&gt;<br>Is it this related:<br>--- snip ---<br>Author: Andrew Morton &lt;
<a href="mailto:akpm@osdl.org">akpm@osdl.org</a>&gt;<br>Date:&nbsp;&nbsp; Fri Jun 30 02:29:59 2006 -0700<br><br>&nbsp;&nbsp;&nbsp;&nbsp;[SERIAL] 8250: sysrq deadlock fix<br><br>&nbsp;&nbsp;&nbsp;&nbsp;Fix <a href="http://bugzilla.kernel.org/show_bug.cgi?id=6716">http://bugzilla.kernel.org/show_bug.cgi?id=6716
</a><br><br>&nbsp;&nbsp;&nbsp;&nbsp;Doing a sysrq over a serial line into an SMP machine presently deadlocks.</blockquote><div><br>Seems so.<br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
&nbsp;&nbsp;&nbsp;&nbsp;Signed-off-by: Andrew Morton &lt;<a href="mailto:akpm@osdl.org">akpm@osdl.org</a>&gt;<br>&nbsp;&nbsp;&nbsp;&nbsp;Signed-off-by: Russell King &lt;<a href="mailto:rmk+kernel@arm.linux.org.uk">rmk+kernel@arm.linux.org.uk</a>&gt;<br>--- snip ---
<br><br>(ChangeLog-2.6.18-rc2)<br><br>if yes I tested on my n4k but unfortunately doesn't help for the smp pb:<br>after only 1 day and 22h of my stress test it still hanging in dump_stack<br>(I was hoping it could be the place where things went wrong too ;-( )
</blockquote><div><br>I doubt it, I don't know too much about kernel internals, but looking at the patch you can see it just adds a extra 'if' for the sysrq case, so it<br>shouldn't affect anything else ...<br><br><br>&nbsp;&nbsp;&nbsp; Max
<br></div></div>

------=_Part_26642_7238327.1154005787697--

--===============2103738440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============2103738440==--
