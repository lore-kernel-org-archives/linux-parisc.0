Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA03427
	for <parisc-linux@puffin.external.hp.com>; Sat, 29 May 1999 15:21:56 -0600
Date: Sat, 29 May 1999 23:21:52 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Hugo van der Kooij <Hugo.van.der.Kooij@caiw.nl>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Ready to go!
Message-ID: <19990529232152.I1410@mencheca.ch.genedata.com>
References: <001c01beaa14$d4002640$5b0e070a@monorailpc> <Pine.LNX.4.10.9905292311070.25944-100000@bastion.nl3155vj16.vanderkooij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9905292311070.25944-100000@bastion.nl3155vj16.vanderkooij.org>; from Hugo van der Kooij on Sat, May 29, 1999 at 11:12:19PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 29, 1999 at 11:12:19PM +0200, Hugo van der Kooij wrote:
> On Sat, 29 May 1999, Ross Sponholtz wrote:
> 
> > Alright!  I finally got my HP 715.  Now I need to get started with the project.  I was planning on getting MkLinux going, but apparently, the opengroup site with the software has been taken down.  Does anyone have the disk image that I could ftp?  Also, is everyone booting off the network (for development purposes)?
> 
> The 715/33 won't run mklinux at all. Basically one of the reasons I have
> set my hopes on the real PARISC port. (Which I will patiently await.)

Don't just wait, get involved!  :-)  There are several models of 715,
btw, he doesn't necessarily have the one model of 715 which mkLinux
won't work with.  I do though!

binfmt_som is coming on quite well, I'll hopefully have a first cut
released by tomorrow.  I'm not quite sure how it will tie in with
the rest of the code yet.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
