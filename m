Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA17778
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 Nov 1999 17:14:40 -0700
Date: Wed, 10 Nov 1999 01:17:25 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status
Message-ID: <19991110011725.L516@mencheca.ch.genedata.com>
References: <19991110004745.T25252@mencheca.ch.genedata.com> <199911092357.SAA12804@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911092357.SAA12804@hiauly1.hia.nrc.ca>; from John David Anglin on Tue, Nov 09, 1999 at 06:57:47PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 09, 1999 at 06:57:47PM -0500, John David Anglin wrote:
> > I've taken the hp300 HIL driver written by Phil Blundell and it `works'
> > on my 715/33.  It's producing the wrong keycodes, it's doing work that an
> > ASP driver ought to be doing and it's producing a fair bit of extraneous
> > crap on the screen.  But I'm getting interrupts and keycodes so I'm
> > happy for tonight :-)
> 
> Maybe this is due to the difference between keycodes for HP (e.g., C1429A)
> and PS/2 keyboards?

Sorry, I was rather unclear there.  The HIL driver has its own built-in
keymaps.  What I'm seeing (for example, when I press the `g' key):

)
)
g
)
)

or sometimes

)
)
)
)
g

or some other permutation.  I would prefer to not worry about this for
the moment; there's lots of other things to tidy up and it'll probably
sort itself out once something else is done properly.

I've now committed most of my changes.  I'm _not_ committing this one
as it'll definitely screw up every other type of machine:

ndex: irq.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/irq.c,v
retrieving revision 1.36
diff -u -r1.36 irq.c
--- irq.c       1999/10/31 06:26:35     1.36
+++ irq.c       1999/11/10 00:05:28
@@ -225,12 +225,17 @@
                if(!(bit&mask))
                        continue;
 
+#if 1
+               if (irq == 3) {
+                       gsc_readl(0xf0800000);
+               }
+#else
                if(irq) {
-#if 0
                        printk("Interrupt %2d(%2d+%2d)\n", irq+region->data.irqbase, irq, region->data.irqbase);
+                       printk("ASP mask = %x", gsc_readl(0xf0800000));
 
-#endif
                }
+#endif
                mask_irq(irq);
                do_irq(&region->action[irq], region->data.irqbase + irq, regs);
                unmask_irq(irq);

(please excuse the copy & paste)

If you have a 715/33, you may wish to apply the patch and watch in
amazement as your keyboard produces characters.  Hopefully we'll thrash
out how to get it working properly soon.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
