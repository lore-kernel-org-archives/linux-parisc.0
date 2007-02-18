From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: [PARISC] fix uninitialized spinlock in HIL
	keyboard driver
Date: Sun, 18 Feb 2007 16:15:13 +0100
Message-ID: <200702181615.14056.deller__43236.3533335321$1416624297$gmane$org@gmx.de>
References: <11717457251848-git-send-email-kyle@parisc-linux.org>
	<200702172321.37036.deller@gmx.de>
	<200702180224.48281.dtor@insightbb.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: Dmitry Torokhov <dtor@insightbb.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702180224.48281.dtor@insightbb.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 18 February 2007, Dmitry Torokhov wrote:
> Hi Helge,
> 
> On Saturday 17 February 2007 17:21, Helge Deller wrote:
> > 
> > Can you drop this ^^ piece of this patch ?
> > Cyrill V. Gorcunov's (<gorcunov@gmail.com>) HP300 patches from a few days ago
> > are more correct since they include the release_region() call. 
> > 
> 
> I have 2 patches from Cyrill applied to my tree:
>  - one from couple days ago dealing with release_region() (2nd version that was
>    acked by you)
>  - another came to me throughg Andrew and deals with handling errors from
>    input_register_device(), request_region(), request_irq() + whitespace cleanup.
> 
> 
> > Or, if you want, I can resend this whole patch against your input-tree ?
> > Just let me know...
> > 
> 
> If you could redo the patches against my tree that would be nice - I am having
> trouble applying "[PARISC] hp_sdc: fix request_irq()/free_irq() parameters"
> 
> Btw, is there any chance we coudl fix the code style in hil drivers. They are
> very different from the rest of the kernel. Something like patch below...

Sure, I'll do both and send you seperate patches soon.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
