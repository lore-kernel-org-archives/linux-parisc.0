Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: marc@centraltx.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Bus Speed 
In-Reply-To: Message from "marc " <marc@centraltx.com>
   of "Sat, 07 Sep 2002 15:49:50 CDT." <200209071549.AA99484160@mail.centraltx.com>
References: <200209071549.AA99484160@mail.centraltx.com> 
Date: Sat, 07 Sep 2002 15:53:19 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020907215319.8FC46482A@dsl2.external.hp.com>
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

"marc " wrote:
> ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
> I have a C180 and the bus speed at startup says:
> Central Bus Speed (in MHz) :        120

There is no IDE on C180 unless you've added a PCI card that has it.
Only systems with SuckyIO have built-in IDE where HPUX officially
only supports CD-ROM. Of course, under linux we can do what we want.

"Central Bus" in this case is the "Runway" bus.
Only CPU, Memory Controller and IO Controller (U2) are on Runway bus. 

grant
