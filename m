Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem find devices on the E55 I/O interfaces 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Wed, 26 Jun 2002 23:51:54 +0200." <3D1A377A.E0CFABBD@gmx.at>
References: <3D1A377A.E0CFABBD@gmx.at> 
Date: Wed, 26 Jun 2002 16:09:41 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020626220941.23903482C@dsl2.external.hp.com>
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

Christoph Plattner wrote:
> Do we use the wrong search address here, taken from io_io_low of
> the `struct bc_module'. Do we access it in a wrong way ?
> Is THIS structure documented in any of the PARISC documents, other-
> wise, where does this structure come from ?

Ryan Bradetich has a pretty good handle on how to walk bus converters.
I expect the bus converter register layout to be documented in
the PA IO ACD (Arch Control Document). Sorry - I don't have a URL
handy for the IO ACD.

grant
