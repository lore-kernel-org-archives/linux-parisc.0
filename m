Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6E834829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 12:50:01 -0700 (MST)
Message-ID: <3E455F67.8090700@gmx.at>
Date: Sat, 08 Feb 2003 20:49:59 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Status SCSI/MUX on E55 (and family)
References: <3E44577F.5060509@gmx.at> <20030208021001.26d02b16.varenet@esiee.fr>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello,

oh that's new for me. I thought, the SPIFI is partially on my list.
I do not know, who told me, but I think it was Grant Grundler.
Of course, I cannot do it allone, but a good "hacking team" ...

I started debugging (by printk) a hlaf year ago. I also started to
study the NetBsd sources. And I already wait for the NDA to have
a "source look" in HP-UX and access to other documents.

As I have the E55, and I want to use it, a also offer my help.
So this is the reason, why I wrote the PDC console driver to
primary boot those class of machines.

The status on SCSI was: every read access to any I/O port (sorry:
memory location) a 0xffffffff was returned - open bus ?

Christoph



Thibaut VARENE wrote:
> On Sat, 08 Feb 2003 02:03:59 +0100
> "Christoph Plattner" <christoph.plattner@gmx.at> wrote:
> 
> 
>>Hallo PARISC Hackers !
>>
>>Is there any new status on MUX or SCSI on E55 or similar ?
> 
> Not yet concerning SCSI.
> This is still on rbrad and my todo list, at (alas) a low priority level for both of us I think.
> Don't worry, this hasn't been forgotten ;)
> 
> 
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://pateam.esiee.fr/
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
