Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85B5A487A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Nov 2003 16:35:31 -0700 (MST)
Message-ID: <3FBFF2C3.4050008@tiscali.be>
Date: Sat, 22 Nov 2003 23:35:31 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
References: <20031121005003.GB13007@colo.lackof.org> <3FB265250000556F@ocpmta2.freegates.net> <20031122052915.GB29917@colo.lackof.org> <3FBF4F65.70502@tiscali.be> <20031122220919.GA6732@colo.lackof.org>
In-Reply-To: <20031122220919.GA6732@colo.lackof.org>
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
> On Sat, Nov 22, 2003 at 11:58:29AM +0000, Joel Soete wrote:
> 
>>I don't know but seems to hang like boot hang when I include the pdc 
>>support into the kernel: green led stay lightning. (and toc seems to 
>>failed because of a time out IO; i don't remember but I think i do have 
>>to read it on lcd)
> 
> 
> What do you mean by "PDC support"?
> You mean CONFIG_PDC_CHASSIS?

Sorry that was in an old mail 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2002-December/018689.html>
and much concern CONFIG_PDC_CONSOLE (via CONFIG_SERIAL_NONSTANDARD=y)


thanks for your attention,
	Joel
