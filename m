Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A44C483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 04:45:36 -0700 (MST)
Message-ID: <3FB0CBF4.6010306@tiscali.be>
Date: Tue, 11 Nov 2003 11:45:56 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F969FFE00009E0B@ocpmta2.freegates.net> <3F969FFE00009EA4@ocpmta2.freegates.net> <20031110173748.GD24664@colo.lackof.org> <Pine.LNX.4.58.0311110124220.2933@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0311110124220.2933@sal.ucc.ie>
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

Hi Max,

M. Grabert wrote:
> On Mon, 10 Nov 2003, Grant Grundler wrote:
> 
> 
>>On Mon, Nov 10, 2003 at 01:31:45PM +0100, Joel Soete wrote:
>>
>>>ie a Lasi_82596 (as Matthew mentioned in a previous mail).
>>
>>yeah - that's not going to perform as well as tulip.
>>And 10-Half is going to be substantially slower.
>>Sounds like it has a bug in the negotiation.
> 
> 
> Very likely!
> 
> My C200 is also very picky whether to enable 100MBit or not.
> I'm using a no-name 100MBit-Switch, and it works fine for all
> 5 other PCs in my house).
> 
> I was not able to force 100MBit by changing the settings in the
> PDC, but the following DID work:
> 
> 
>>mii-tool -A 100baseTx,10baseT eth0
> 
Ah interesting:
on my pc,
  # mii-tool
SIOCGMIIPHY on 'eth0' failed: Operation not supported
eth1: 10 Mbit, half duplex, no link

and eth1 is the nic I use to connect my c110 :) (don't see what no link 
means but that is the right setup that I need with c110)

otc on the c110:
# mii-tool
SIOCGMIIPHY on 'eth0' failed: Operation not supported
no MII interfaces found
:(

Thx a lot,
	Joel
