Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 739A0483C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 14:39:39 -0700 (MST)
Date: Fri, 21 Feb 2003 22:39:00 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: adrian.criveanu@gmx.co.uk, parisc-linux@lists.parisc-linux.org
Message-Id: <20030221223900.32603772.varenet@esiee.fr>
In-Reply-To: <14464.1045418470@www16.gmx.net>
References: <14464.1045418470@www16.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: X on C240
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

On Sun, 16 Feb 2003 19:01:10 +0100 (MET)
adrian.criveanu@gmx.co.uk wrote:

> Dear Sir,
> 
> I apologise for writing you directly but I've seen your name a lot of times
> in the mail lists I looked for an answer ... You know how it happens... If
> you are nice and help people, they keep bothering you :)
Well, I know but you would probably have had a quicker answer by posting on the m-l directly, since I was on vacation till tonight.

For what it's worth, you should avoid (as anybody else) posting directly to people, please consider the mess if everybody does so... Usually I don't answer direct mails ;P

That's why I'm CCing the m-l anyway.
> 
> I tried to install 3.0r0 from the CDs. When I used the graphics card, it
> didn't go too far and gave me an HPMC (I saw a mail from somebody with a  B1000
> which had the same problem). I managed to install Debian only using the
> serial console. IN one of your messages you said thet Vis-EG is supported. My C240
> has a A4450A card (Vis-EG) and it seems it doesn't work with Debian. 
If I remember correctly, 3.0r0 doesn't support B1000. You should use one of our netinsts.
http://pateam.esiee.fr/download.html
> 
> Unfortunately I wasn't able to find a way to use it on my workstation. Is is
> supported or do I need a PCI version of it? Regardless of the answer, is
> there anywhere a good documentation on how to configure these cards for Debian?
The only thing you need is STIFB support and a proper X configuration (that is, one that respects your kernel framebuffer device setup (see the mailing-list archive for details and the PA/Linux Boot Howto:
http://pateam.esiee.fr/doc.html)
> 
> Thank you very much.
You're welcome.
> 
> Regards,
> 
> Adrian
> 


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
