Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 53BCB482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Feb 2002 00:19:10 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Yasholomew Yashinski <yashy@mail.yashy.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000
Date: Mon, 11 Feb 2002 08:16:13 +0100
References: <20020210213653.O48612-100000@mail.yashy.com>
In-Reply-To: <20020210213653.O48612-100000@mail.yashy.com>
MIME-Version: 1.0
Message-Id: <200202110816.13226.deller@gmx.de>
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

On Monday 11 February 2002 03:44, Yasholomew Yashinski wrote:
> > >  I recently purchased an HP 9000/785/B1000. I tried to use the
> > > pasrisc*.iso as I've been using on my 712/*'s, however there appears to
> > > be issues using 32-bit as default. Setting up a serial console for this
> > > machine will not be a trivial task, due to its location. Is there
> > > anyone
> >
> > Hmm.. this machine should work in both 32 and 64 bit mode.  I suspect
> > we don't currently support the graphics card in this machine (I assume
> > it has the same problems as the C3000... helge?)
>
>  It appears so. The framebuffer is A4977a Vis EG-PCI.
>
>  If it helps, the errors I receive on the front panel LCD are:
> FLT CBF4: SYS BD
> bad OS HPMC cksm
> FLT CBFC: SYS BD
> OS HPMC br err
> FLT 500B: SYS BD
> bus timeout

Yes, that's exactly the same error I get w/ c3000 and VisEG PCI.

Helge
