Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.4.17-32-smp problem 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Sun, 24 Mar 2002 19:01:58 PST." <Pine.LNX.4.33L2.0203241900450.13376-100000@eiger.apptechsys.com>
References: <Pine.LNX.4.33L2.0203241900450.13376-100000@eiger.apptechsys.com> 
Date: Sun, 24 Mar 2002 21:10:22 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020325041022.9E3644859@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> This controller is damaged -- it will not work.  I'm looking for an
> alternative.  Thanks for your help....

Bummer. I think you better start getting used to serial for booting.
PDC typically only knows how to talk to a few select devices needed
for booting. And some of them it knows are built-in and where to
find them.

If you setup the machine to auto-boot and add a regular PCI USB
controller card that linux likes, you should be able to have
X11 just find the USB Keyboard/Mouse from the add-on card as well.

grant
