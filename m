Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2170482E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Dec 2001 09:08:16 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3B0E8B00C; Wed,  5 Dec 2001 16:08:31 +0000 (GMT)
Date: Wed, 5 Dec 2001 16:08:31 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa15 still POWERFAIL(was 2.4.16-pa12 Power failled)
Message-ID: <20011205160831.F7051@linuxcare.com>
References: <Pine.LNX.4.33.0112032239490.1252-100000@bob.ncssm.edu> <1007449260.3c0c74ac2b330@webmail.tiscalinet.be> <1007473422.3c0cd30eac487@webmail.tiscalinet.be> <1007547737.3c0df5599e8c9@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1007547737.3c0df5599e8c9@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Dec 05, 2001 at 11:22:17AM +0100
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

On Wed, Dec 05, 2001 at 11:22:17AM +0100, joel.soete@freebel.net wrote:
> Hi all,
> 
> Just to report that the problem persit on my B180 (even thought that changes was
> made on sym53c8xx but I do know if its regarding this problem).

This is a bit of debug from my a500, 2.4.16-pa13

request_irq(66, 000000001037fd90, 0x0, IO-SAPIC00-L1, 000000001009bc58)
request_irq(66, 000000001037c590, 0x0, powerfail, 0000000000000000)
request_irq(129, 0000000010374ed0, 0x4000000, sym53c8xx, 000000001fe98000)
iosapic_interrupt(): irq 66 line 1 eoi fffffffffed30840, irq_num 129
POWERFAIL INTERRUPTION !

Don't claim to understand this, but it looks like "powerfail" has
requested the wrong irq?

Richard
