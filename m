Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2124E4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Dec 2003 06:39:30 -0700 (MST)
Date: Sat, 13 Dec 2003 13:39:23 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Tomas Reinicke <ctbr@home.se>
Subject: Re: [parisc-linux] C180XP and B132L and X
In-Reply-To: <200312130845.12254.ctbr@home.se>
Message-ID: <Pine.LNX.4.58.0312131316100.7132@sal.ucc.ie>
References: <200312130845.12254.ctbr@home.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 13 Dec 2003, Tomas Reinicke wrote:

> I have recently got hold of one C180XP and one B132L with the specifications
> below.
>
> C180XP
> GRAPHICS		HP A4244A_V

[...]

> The following article numbers are present on the graphics cards in the C180XP
> A4248A
> A4244A
> A4246-66002
> A3510-40 A4244-66003.

[...]

> B132L
> Model No.		A4190A
> GRAPHICS		HP A4071B_LZ

[...]

> My intention is to install Debian woody.
> From parisc-linux.org I understand the both the C180XP and B132L is supported.
> But my question is now is it possible to get X to work in these machines?
> I have searched the net regarding the graphic cards but not found anything the
> is 100% matching the modelnumber that I have.

Obviously you didn't look close enough:
http://www.google.ie/search?q=visualize-48+site%3Alists.parisc-linux.org
http://www.google.ie/search?q=a4071b+site%3Alists.parisc-linux.org

The settings for the B132:
http://lists.debian.org/debian-hppa/2002/debian-hppa-200212/msg00011.html

Your graphics card in the C180 is a Visualize-48, I doubt it is supported:

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-April/019824.html


> I would appriciate if someone could clearify this and also give me some
> genaral tips regarding the installation.

Use the netinstall CDs from here:

http://www.pateam.org/cd-images/testing/

the official woody CDs use quite an old kernel that has some problems,
the ones found on the ESIEE website use newer kernels.


 Max
