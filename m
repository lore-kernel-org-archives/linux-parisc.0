Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 50AD5482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Nov 2001 18:03:55 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 14 Nov 2001 02:03:07 +0100
References: <200111121634.JAA24960@puffin.external.hp.com>
In-Reply-To: <200111121634.JAA24960@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <20011114010355.50AD5482C@dsl2.external.hp.com>
Subject: [parisc-linux] Update: Current kernel from CVS does not build
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

This is just an update on this issue....

32bit kernels from CVS head (>= 2.4.14-pa1) should now compile and
boot again. There still may be hidden issues (as always :-)),
but basically it will work.

Helge

On Monday 12 November 2001 17:34, Grant Grundler wrote:
> Rafael Herrera wrote:
> > I tried to update the sources with the latest CVS version, but the
> > compilation failed. The file */arch/parisc/kernel/pdc_cons.c and
> > */kernel/printk.c have a conflict. The variable log_size used in
> > pdc_cons.c is not defined in printk.c. The kernel does not build.
>
> The merge to 2.4.14 isn't finished yet.
> Despite working around the log_size issue, it still doesn't boot.
>
> Watch the parisc-linux-cvs mailing list for progress on this.
> We'll probably post an "It works" msg here too.
>
> grant
