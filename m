Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA09932
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 09:49:36 -0600
Message-Id: <199910261550.JAA13603@debian.fc.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hack to use HPUX boot loader 
In-reply-to: Your message of "Sun, 24 Oct 1999 19:08:42 EDT."
             <Pine.LNX.4.10.9910241908180.21739-100000@vodka.thepuffingroup.com>
Date: Tue, 26 Oct 1999 09:50:37 -0500
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= Actually, this is pretty helpful.  Paul, would you consider licensing this
= under the GPL?
= 
= - Alex

Done.  Sources and HP-UX binary in the tarball at:

ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/som_relocate.tar.gz

Has anyone confirmed that the kernel which is started is getting good
data (stack, etc...) or are my kernels booting purely by accident?

	-Paul Bame
