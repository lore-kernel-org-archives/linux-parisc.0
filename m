Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.yashy.com (cpu2119.adsl.bellglobal.com [207.236.3.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1DAF4864
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 23:50:20 -0700 (MST)
Received: from yashy (helo=localhost)
	by mail.yashy.com with local-esmtp (Exim 3.33 #1)
	id 16eW0f-00013j-00
	for parisc-linux@lists.parisc-linux.org; Sat, 23 Feb 2002 01:50:17 -0500
Date: Sat, 23 Feb 2002 01:50:17 -0500 (EST)
From: Yasholomew Yashinski <yashy@mail.yashy.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000 
In-Reply-To: <20020223063435.7F9964861@dsl2.external.hp.com>
Message-ID: <20020223013935.D3685-100000@mail.yashy.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> >  Going through the install now, via serial console. Everything was working
> > fine until I tried to install a kernel from the cdrom:
>
> Is this with 0.9.3 CD image?
> Read the errata...CD-ROM isn't support by the kernel on the CD.
> More recent kernels have fixed the CD-ROM (tnx Fleedwood!)
> support for suckyio systems.

 I installed it for a third time creating a smaller /boot partition in
order for palo to work, and a net kernel (2.4.17 IIRC) installed
successfully. I have since upgraded to pa28 in order for my framebuffer to
work. I apt-get'd cvs and tried to run:

~$ cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs/ login
Logging in to :pserver:anonymous@cvs.parisc-linux.org:2401/var/cvs/
CVS password:  # no password, just CR
cvs [login aborted]: recv() from server cvs.parisc-linux.org: Connection
reset by peer

 Do I need any extra configuration, this has been happening since
yesterday? How do I switch from stifb to sticon (I just apt-get'd
xfree86)?

 I'd just like to confirm:
eth0: Setting half-duplex based on MII#1 link partner capability of 0021.
 is correct?

 Everything else appears to be working great.

 Thanks in Advance,

--
Yashy
