Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server01 (s217-115-138-231.colo.hosteurope.de [217.115.138.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31FE74829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 06:50:32 -0600 (MDT)
From: "J.Steindlberger" <j@steindlberger.de>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] ide controller
Date: Thu, 19 Sep 2002 14:50:45 +0200
References: <20020916043004.B27754829@dsl2.external.hp.com> <28859.1032424874@www2.gmx.net> <1032430004.26669.1.camel@irongate.swansea.linux.org.uk>
In-Reply-To: <1032430004.26669.1.camel@irongate.swansea.linux.org.uk>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	moritz@freesources.org, parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020919125032.31FE74829@dsl2.external.hp.com>
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

On Thursday 19 September 2002 12:06, you wrote:
> Our IDE code has been run on non x86 platforms. It does require that the
> defaults are set right for the platform so that it doesnt do stuff like
> blindly probe I/O 0x170.
>
> I don't know if the Promise card needs its BIOS to have run, I would
> suspect not but can't be sure.

Hi Alan,

we tried a different controller with originally an eprom bios. We simply put 
that eeprom away. (The Promise has a chip-integrated flash bios - putting 
that away seems not to be possible.) The kernel crashed alike. Do You have 
any ideas to get more debug output? I could set up my second C-Class with 
parisc-linux and test it there. (The first one is now running some essential 
services - continued crashing would not be good.)

Then I will have a deep look into the linux-code (oh, I'll have to learn C) 
and search for that stupid (sorry) 0x170 probe.

Thanks a lot! You will read more...
Joerg
