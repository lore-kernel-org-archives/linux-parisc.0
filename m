Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA24904
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 11:22:16 -0600
From: Barrie Spence <baz@calvin.demon.co.uk>
Message-Id: <200005301722.SAA07304@calvin.demon.co.uk>
Date: Tue, 30 May 2000 17:22:21 +0000 (GMT)
To: pedro@flynn.zork.net
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX random number generator?
In-Reply-To: <20000529132352.D11779@flynn.zork.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

"Peter A. Peterson II" <pedro@flynn.zork.net> wrote:
> Quoting Andrew Shugg:
> > You might like to consider using OpenSSH if you don't have any joy with ssh.
> > 
> > OpenSSH can be compiled[1] without a /dev/*random device by using egd[2], the
> > Entropy Gathering Daemon.  OpenSSH also requires installation of zlib and
> > openssl though (which is just a bit more effort, but oh well).  I've not used
> > egd so can't comment on it, but it's probably worth a go.
> 
> I was incorrectly specific. I installed openssh, zlib, and ssleay
> already, and in the configure process for openssh it crapped out 
> looking for /dev/urandom and/or egd. I think i'll look into egd. 

AFIAK, the more recent versions of openssh aren't supposed to need
/dev/urandom (or egd) when used with openssl-0.9.5.

Barrie


--
Barrie Spence			Sanity Clause? There is no Sanity Clause
Home: b.spence@ieee.org		Telephone +44 1506 442304
Play: barrie_spence@agilent.com
