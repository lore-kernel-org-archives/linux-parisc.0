Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA07615
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 06:58:17 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 14:01:58 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BBA81B005; Mon, 22 Jan 2001 13:52:20 +0000 (GMT)
Date: Mon, 22 Jan 2001 13:52:20 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jim Buttafuoco <jim@tylerdrive.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting a 710 (bushmaster)
Message-ID: <20010122135220.M3571@linuxcare.com>
References: <200101181517.f0IFHOs08538@openbsd1.buttafuoco.net> <20010118205206.B28638@linuxcare.com> <20010122111040.K3571@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010122111040.K3571@linuxcare.com>; from rhirst@linuxcare.com on Mon, Jan 22, 2001 at 11:10:40AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 22, 2001 at 11:10:40AM +0000, Richard Hirst wrote:
> You'll be pleased to hear that the latest kernel has similar problems
> on my 715/75.  I'm investigating.

New versions of pgalloc.h and sim700.c committed.  Please build a new
kernel and try again.

Richard
