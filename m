Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA09197
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 10:54:55 -0600
Received: from muzak.iinet.net.au (muzak.iinet.net.au [203.59.24.237])
	by urban.iinet.net.au (8.8.7/8.8.7) with ESMTP id AAA24737
	for <parisc-linux@thepuffingroup.com>; Tue, 30 May 2000 00:55:12 +0800
Received: from guinness.neep.com.au (reggae-20-224.nv.iinet.net.au [203.59.85.224])
	by muzak.iinet.net.au (8.8.5/8.8.5) with ESMTP id AAA06055
	for <parisc-linux@thepuffingroup.com>; Tue, 30 May 2000 00:55:10 +0800
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id AAA28235
	for parisc-linux@thepuffingroup.com; Tue, 30 May 2000 00:55:07 +0800
Date: Tue, 30 May 2000 00:55:03 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX random number generator?
Message-ID: <20000530005500.A28121@neep.com.au>
References: <20000529024931.B11779@flynn.zork.net> <39324625.977B5A74@storm.ca> <20000529103328.C11779@flynn.zork.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000529103328.C11779@flynn.zork.net>; from pedro@flynn.zork.net on Mon, May 29, 2000 at 10:33:28AM -0500
List-ID: <linux-parisc.vger.kernel.org>

Peter A. Peterson II said:
> This is quite true... but for now, I'd settle on making ssh work,
> since there is nothing of great value on the HP box, I'm just looking
> for a way to kludge ssh into working.

I know that on Solaris a /dev/urandom device is provided by the SKI packages.
There may be an equivalent under the HPUX environment but I am not sure, I am
not very far up the HPUX guru ladder.

You might like to consider using OpenSSH if you don't have any joy with ssh.

OpenSSH can be compiled[1] without a /dev/*random device by using egd[2], the
Entropy Gathering Daemon.  OpenSSH also requires installation of zlib and
openssl though (which is just a bit more effort, but oh well).  I've not used
egd so can't comment on it, but it's probably worth a go.

Or you could just fall back on rsh.  =)

Andrew.

[1] http://www.openssh.com/portable.html
[2] http://www.lothar.com/tech/crypto/

--
Andrew Shugg <andrew@neep.com.au>                http://www.neep.com.au/

  "Just remember Basil, there's always someone worse off than yourself."
  "Oh, really?  I'd like to meet him ... I could do with a good laugh."
                 [ Sybil and Basil Fawlty, "Fawlty Towers" ]
