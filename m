Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3BD0483D
	for <parisc-linux@parisc-linux.org>; Tue,  4 Jun 2002 10:52:47 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc-cvs problem
Message-ID: <1023209564.3cfcf05ce80e8@webmail.tiscalinet.be>
Date: Tue, 04 Jun 2002 18:52:44 +0200 (CEST)
From: joel.soete@freebel.net
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	INVALID_ADDRESS@.SYNTAX-ERROR
References: <200206031738.g53HcNjL011765@hiauly1.hia.nrc.ca> <1023172365.3cfc5f0d1b7f7@webmail.tiscalinet.be>
In-Reply-To: <1023172365.3cfc5f0d1b7f7@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

I not yet quiet sure that is not an hardware problem but I reboot on the kernel
2.4.18-pa29 and an hpmc occurs after an some minutes without doing anything else
then let it run for itself?

Then I reboot on hpux (10.20), unfortunately no problem occurs during the 4
hours it runs.

So now I reboot in su mode to move back ext3 to ext2 my all fs.
Then reboot in mu. It works and it is on going to recompile toolchain but it is
now so slow (even badly then a 712/80).

Is there other thing to do than backup, re-mkfs, restore to recover some
performance?

Thanks in advance for advice,
    Joel

Quoting joel.soete@freebel.net:

> Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:
> 
> > > I really have no chance with this b2000:
> > > I broken first my install and now it makes a HPMC in the middle of
> > binutils
> > > build and the pim info are not clear :((
> > 
> > I'd try a new kernel first.
> 
> Very strange behaviour: 
> with some difficulties I reach to restart a kernel then I launch  my
> toolchain
> script (which failled because of __therad problem), I change the faulty
> header
> and finaly relaunch script which failled in a tar xjf (some time during
> the
> first extract of binutils, some time during the second extract of gcc32)
> what
> ever the kernel I used 2.4.18-pa24 2.4.18-pa24+lvm1.0.4
> 2.4.19-pre8-pa29?.
> 
> But thanks to the console logs grab with minicom I reach to notice the
> "BUG":
> 
> Debian GNU/Linux 3.0 palx2000 ttyS0
> 
> palx2000 login:
> 
> kernel BUG at superio.c:109!
> WARNING! Stack pointer and cr30 do not correspond!
> Dumping virtual address stack instead
> 
> Dumping Stack from 0x2ee00000 to 0x2ee00bc0:
> ...
> 
> What could the reason why the tar xjf is successfull a first time and
> when it is
> relaunched, it fails? Ext3 fs (I am not sure how can I change back to
> ext2) bash
> (which other sh may I try) ?
> 
> 
> Joel
> 
> PS: after a cleanpim it seems to be easiest to reboot?
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
