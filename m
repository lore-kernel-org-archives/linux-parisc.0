Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34C3048B4
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Oct 2003 01:39:52 -0700 (MST)
Date: Tue, 28 Oct 2003 09:39:48 +0100
Message-ID: <3F98D67D00001BC1@ocpmta3.freegates.net>
In-Reply-To: <20031027193911.GA16012@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] C110 builtin nic slow?
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Matthew Wilcox" <willy@debian.org>
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Grant, Matthew,

>>
>>On Sun, Oct 26, 2003 at 09:10:44PM +0000, Joel Soete wrote:
>> How may I find and reset the speed setup of a nic (I mean which 10 or

>> 100 Mb, half or full duplex)?
>
>ethtool?
>
I will check on my own pc (hp cards but don't remember the model)

hmm I test here with a 3C905B (on an hp vectra) but:
# ethtool eth0
Settings for eth0:
No data available

???

(same results on a b180 with eth0: Digital DS21143 Tulip rev 65 [last kernel
2.4.21])

>> In a second though I just remember that the pc boot first (i need 
>> minicom console to boot c110) then latter the c110. So it could be that

>> the first one is set in 100 half as default (no connection at boot time)

>> and the second 10 half?
>
>shouldn't matter unless auto-negotiation is broken for one driver or 
>the other. If they are point-to-point,

It is a cross-cable

> I expect the negotiation to take place when the link is brought up with

>the second NIC.

I am curious to see if ethtool works for my pc's nic to check the behaviour
on this side.

Thanks for all info,
    Joel



-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
