Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem find devices on the E55 I/O interfaces 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Tue, 02 Jul 2002 22:42:05 +0200." <3D22101D.74982658@gmx.at>
References: <3D1A377A.E0CFABBD@gmx.at> <1025579851.956.469.camel@beavis>  <3D22101D.74982658@gmx.at> 
Date: Tue, 02 Jul 2002 15:25:01 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020702212501.84BD14861@dsl2.external.hp.com>
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
> Here is one question: Although I a have hardware knowledge, I am
> not fix HP terminology here.
> Can you give me some hints here with the kewords "main bus", 
> "lower bus", etc...

"central bus" = bus which connects all CPUs with all Memory.
On N-class this would be the Merced Bus.
On C3000 it's the runway bus.
On 712 is the GSC bus.

> Is the lower bus a bus on the interface card behind the bridge to 
> the backpanel bus, or ... ?

"lower bus" is usually the secondary bus below a bus adapter or bus converter.

Bus adapter and Bus converter differ in that one is transperent
to SW and the other is not. Eg. PCI Host Bus Adapter.
Both are forms of bridges.

hth,
grant
