Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 15 Jan 2003 18:06:20 -0700
To: jsoe0708@tiscali.be
Cc: Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030116010620.GB8543@dsl2.external.hp.com>
References: <3DED9A6600005A12@ocpmta3.freegates.net> <3E1AA52C0000167E@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E1AA52C0000167E@ocpmta1.freegates.net>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Wed, Jan 15, 2003 at 05:14:47PM +0100, jsoe0708@tiscali.be wrote:
> >There are a lot of differences (do you want it I do not think it will be
> >usefull)
> >
> >> or a default .config if that's closer?
> >
> >It will have to wait tommorrow (sorry)

np. I also want you to look at something that is known
to work before going too far.

> I now add CONFIG_TULIP_MMIO=yes

yes. that's what I meant.

> (Randolph: Do you want I send you those new material: kernel, system.map,
> ...?)

Or make them available via http or ftp.
Otherwise, posting what symbols the IAOQ/GR02 values point at
is even better.

> I also forget to recall: this only occurs for incoming ethernet trafic(ie
> ssh, telnet, ftp, coming from an external server). The outgoing traffic
> works fine (I just do a telnet and a ftp from this server to an external
> one without crash)

Interesting. "outgoing" has both inbound and outbound data.
That doesn't sound like a tulip driver bug though it's certainly
possible.

Have you tried sending UDP (not TCP) traffic?
(Not sure how to do that...suggestions?)

You have any iptables (firewall) filtering enabled?

Maybe an issue with opening a new connection in the interrupt context?
My weak understanding of the network stack is that a TCP packet comes
in with SYN (on the interrupt stack) and gets queued for the bottom
half. The bottom half is invoked with interrupts re-enabled but
on the kernel stack in the "interrupt context". Did I get that right?

hth,
grant
