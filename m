Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76C694829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 12:16:59 -0700 (MST)
Message-ID: <3E89E5A7.9030204@gmx.at>
Date: Tue, 01 Apr 2003 21:16:55 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: knaresh@india.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PDC console problem.
References: <3E89DBF4.102AC68A@india.hp.com> <1049181423.24319.17.camel@beavis.ybsoft.com>
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

Hello !

The PDC driver supports both directions, IN and OUT. The PDC console 
driver was ported from the full serial driver interface, some services
not needed for poor console support are dummy routines.

So the serial console cannot be used for MODEM and other full-blown
serial devices, but is a fully functional console device including
all UNIX like features (login is working like on all other serial
devices).

He Ryan, by the way:
Why is my driver (PDC console) NOT in the mainstream kernel 2.5 ?
Even your driver covers a couple of machines, I do not see in the
MUX driver the replacement !
I agree, that the MUX driver should be used on machines with that
MUX interface. But the idea of my PDC driver was to support a fallback
driver using the ROM console usable on all machines, independent of
special setups.

I many architectures such a fallback driver is present. I remeber the
case, there was an failure in the HW-detection on my SUN Sparc-2, and
the kernel used a ROM console driver instead of the frame buffer driver
for screen/keyboard. This driver was awfully slow, and I do not
recommand it, but such a fallback driver should part of a kernel
delivery !!

So we should think about adding this driver also, independent of
al the other drivers included for console (and although the other
drivers should alwaysb be preferred).

Christoph



Ryan Bradetich wrote:
>>I was going through some of the FAQ and the mailing list archive and
>>understand that the PDC console is not a full blown console and can only
>>display output. Is is true that the PDC console cannot accept keyboard
>>input? Or am I missing something?
> 
> 
> Hmm.. The pdc_console has both read and write capabilities.  We used the
> PDC console for K/E class systems before the SerialMux driver was
> written.  I am not familiar with the PDC simulator, but I would be
> willing to test the pdc console again on K-Class.
> 
> Which kernel are you using?
> 
> Thanks,
> 
> - Ryan
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
