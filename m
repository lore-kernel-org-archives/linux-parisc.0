Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FCAF482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Dec 2001 11:53:35 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GOWXT800.S9N for
          <parisc-linux@lists.parisc-linux.org>; Tue, 25 Dec 2001 09:53:32 -0900
Date: Tue, 25 Dec 2001 09:50:54 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 2.4.16-pa24 crashes on c3k
In-Reply-To: <20011225090742.8E013482B@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.33.0112250945530.486-100000@goliath.alaskatech.org>
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

On Tue, 25 Dec 2001, Grant Grundler wrote:
> Hi all,
> I can't boot 2.4.16-pa24 on my c3k.
> 2.4.16-pa20 was working fine.
> I'll put the defective .config, vmlinux, System.map on
> ftp://gsyprf10.external.hp.com/pub/c3000/2.4.16-pa24-crash.tgz

I just reloaded my C180 with the 0.93 ISO and updated to -pa24 and it's
working fine. (Note to all - the 0.93 ISO will cheerfully allow you to
partition a drive as 35MB type F0, 250MB swap and 4GB root, load all the
software, and boot with the stock kernel and map. Then, when you compile
your new -pa24 kernel, it barfs because you forgot that /boot must end in
the first 2GB... Fortunately I rebooted off the CD, deleted the swap
partition, created a new swap and /boot in that same 250MB area and all is
well.)

My only kernel changes were to the SCSI stuff, I believe, and to remove
all the NICs except the onboard.
