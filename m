Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 037C24A19
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 14:44:53 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] small STI patch
Date: Tue, 13 Feb 2001 22:46:50 +0100
References: <01021322170500.01835@P100.helgenet.de> <20010213213239.E7969@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010213213239.E7969@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01021322465001.01835@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Tuesday 13 February 2001 22:32, Matthew Wilcox wrote:
> On Tue, Feb 13, 2001 at 10:17:05PM +0100, Helge Deller wrote:
> > I've just committed a small patch, which saves us to copy a whole struct
> > from the STI ROM just to get one value (the ROM size) out of it.
>
> But we leak a kmalloc'd buffer.  you need to remove the prior kmalloc
> assigned to raw.

Yes, you're right.
I've just committed the following patch.

Helge

diff -u -r1.4 sticon-wmode.c
--- sticon-wmode.c      2001/02/13 20:56:54     1.4
+++ sticon-wmode.c      2001/02/13 21:38:18
@@ -110,13 +110,11 @@
 wmode_sti_read_rom(struct sti_struct *sti, unsigned long address, unsigned 
long hpa)
 {
        struct sti_cooked_rom *cooked;
-       struct sti_rom *raw;
+       struct sti_rom *raw = NULL;
        unsigned long size;
 
-
        cooked = kmalloc(sizeof *cooked, GFP_KERNEL);
-       raw = kmalloc(sizeof *raw, GFP_KERNEL);
-       if (!(raw && cooked))
+       if (!cooked)
                goto out_err;
 
        /* read the ROM size directly from the struct in ROM */
