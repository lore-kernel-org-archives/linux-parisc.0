Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J3515 10/100 NIC 
In-Reply-To: Message from Herb Radford <herbr@magma.ca>
   of "Thu, 07 Mar 2002 12:52:46 EST." <5.1.0.14.0.20020307125054.026b3d40@mail.magma.ca>
References: <Message from Herb Radford <herbr@magma.ca> <5.1.0.14.0.20020307110937.026af020@mail.magma.ca> <5.1.0.14.0.20020307110937.026af020@mail.magma.ca>  <5.1.0.14.0.20020307125054.026b3d40@mail.magma.ca> 
Date: Thu, 07 Mar 2002 14:03:05 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020307210305.C14254871@dsl2.external.hp.com>
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

Herb Radford wrote:
> Well, Grant, that doesn't show much. But here it is:

...
> Dino version 3.x (card mode) found at 0xf1008000
> Dino: Failed to allocate memory region

No - but it showed the problem.
ccio/dino don't seem to be ready to work on
K or D-class.

...
> Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
> PCI: Unable to reserve I/O region #1:80@f364d800 for device 00:01.0
> Trying to free nonexistent resource <f364d800-f364d87f>
> Trying to free nonexistent resource <43695000-4369507f>
...

Looks like we discover the PCI device anyway and the
resources get left in a garbage state.

grant
