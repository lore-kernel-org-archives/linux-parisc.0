Return-Path: <joel.soete@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 168914852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Dec 2003 06:45:40 -0700 (MST)
Message-ID: <3FDB1820.7040700@tiscali.be>
Date: Sat, 13 Dec 2003 13:46:08 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: ctbr@home.se
References: <200312130845.12254.ctbr@home.se>
In-Reply-To: <200312130845.12254.ctbr@home.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
Subject: [parisc-linux] Re: C180XP and B132L and X
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Tomas,

I have no clue about c180 model otc there is no pb to make XFree runing 
on the b132L model.
But there is only one way to implement it (I mean XFree don't supply a 
specific driver): sti-fb which is limited to 8b for the b132 builtin gfx 
(it is well documented on parisc-linux.org FAQ :) )

hth,
    Joel

Tomas Reinicke wrote:

>I have recently got hold of one C180XP and one B132L with the specifications 
>below.
>
>C180XP
>Model No.		A4523AR
>GRAPHICS		HP A4244A_V
>HDD				SEAGATE ST34572WD > 3.5 inch Ultra Wide SCSI (68 pin) HV Differential
>				4.55 GB 7200 RPM
>RAM			256Mb
>CD				TOSHIBA CD-ROM XM-5401TA
>The following article numbers are present on the graphics cards in the C180XP
>A4248A
>A4244A
>A4246-66002
>A3510-40 A4244-66003.
>
>B132L
>Model No.		A4190A
>GRAPHICS		HP A4071B_LZ
>HDD				IBM DORS-32160 > (2.1GB). 3 1/2" 5400 RPM Single Ended Fast/Wide SCSI
>RAM			128Mb
>
>My intention is to install Debian woody.
>From parisc-linux.org I understand the both the C180XP and B132L is supported.
>But my question is now is it possible to get X to work in these machines?
>I have searched the net regarding the graphic cards but not found anything the 
>is 100% matching the modelnumber that I have.
>I would appriciate if someone could clearify this and also give me some 
>genaral tips regarding the installation.
>
>
>
>Tomas Reinicke
>
>
>  
>
