Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71E36483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 12:23:05 -0700 (MST)
Message-ID: <3FAFE5AC.60900@tiscali.be>
Date: Mon, 10 Nov 2003 19:23:24 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F969FFE00009E0B@ocpmta2.freegates.net> <3F969FFE00009EA4@ocpmta2.freegates.net> <20031110173748.GD24664@colo.lackof.org>
In-Reply-To: <20031110173748.GD24664@colo.lackof.org>
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


Grant Grundler wrote:
> On Mon, Nov 10, 2003 at 01:31:45PM +0100, Joel Soete wrote:
> 
>>ie a Lasi_82596 (as Matthew mentioned in a previous mail).
> 
> 
> yeah - that's not going to perform as well as tulip.
> And 10-Half is going to be substantially slower.
> Sounds like it has a bug in the negotiation.
Hmm I could verify, i would have to had ethtool support.
btw is somebody knows a driver which support it (i test without succes 
3com an hp100 driver).

Thx,
	Joel
