Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-02.iinet.net.au [203.59.3.34])
	by dsl2.external.hp.com (Postfix) with SMTP id 38D4D482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 20:19:48 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id LAA20343
	for parisc-linux@lists.parisc-linux.org; Wed, 12 Dec 2001 11:19:38 +0800
Date: Wed, 12 Dec 2001 11:19:35 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] telnetd on hppa: strange behaviour?
Message-ID: <20011212111932.K22137@neep.com.au>
References: <1008007312.3c14f890e4d33@webmail.tiscalinet.be> <3C15005D.4884E0C5@umr.edu> <1008010546.3c150532c596f@webmail.tiscalinet.be> <3C1508B2.3CCCDCF2@umr.edu> <1008086487.3c162dd79749d@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1008086487.3c162dd79749d@webmail.tiscalinet.be>; from joel.soete@freebel.net on Tue, Dec 11, 2001 at 05:01:27PM +0100
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

[...]
> 
> But I always forget to log stdout and sdterr of this command.
> Do you know if it exist somewhere a log of dpkg actions (like
> /var/adm/sw/sw....log of HPUX SD)?
> 
>         Joel

No, but running your 'apt-get upgrade' or 'apt-get dist-upgrade' under
the 'script' program is a good way to record a complete log.

(Logging actions are being added to apt/dpkg e.g. for auditing but it's
got a fair way to go I think.)

For more info, see your friendly apt documentation.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
