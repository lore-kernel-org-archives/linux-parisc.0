Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5EF05483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 18:31:41 -0700 (MST)
Date: Tue, 11 Nov 2003 01:31:38 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Joel Soete <soete.joel@tiscali.be>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
In-Reply-To: <20031110173748.GD24664@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0311110124220.2933@sal.ucc.ie>
References: <3F969FFE00009E0B@ocpmta2.freegates.net> <3F969FFE00009EA4@ocpmta2.freegates.net>
 <20031110173748.GD24664@colo.lackof.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 10 Nov 2003, Grant Grundler wrote:

> On Mon, Nov 10, 2003 at 01:31:45PM +0100, Joel Soete wrote:
> > ie a Lasi_82596 (as Matthew mentioned in a previous mail).
>
> yeah - that's not going to perform as well as tulip.
> And 10-Half is going to be substantially slower.
> Sounds like it has a bug in the negotiation.

Very likely!

My C200 is also very picky whether to enable 100MBit or not.
I'm using a no-name 100MBit-Switch, and it works fine for all
5 other PCs in my house).

I was not able to force 100MBit by changing the settings in the
PDC, but the following DID work:

> mii-tool -A 100baseTx,10baseT eth0


On my C3000 I don't have these problems.

Take a look in the mailing-list archive (about a year ago I guess and
later I found it also here: http://www.unixnerd.demon.co.uk/hp_unix.html).

Note that this is a problem with the C2x0, but I guess it might be
also true for the entire Cxxx series.


Max
