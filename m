Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 919224837
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Dec 2002 07:23:19 -0700 (MST)
Message-ID: <3E0F1556.3030402@freebel.net>
Date: Sun, 29 Dec 2002 15:31:34 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: "Arne H. Poulsen" <arne.h.poulsen@post.tele.dk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian 3.0r0 Hppa on an B132L
References: <00b401c2ae8d$a36719e0$0101a8c0@basse>
In-Reply-To: <00b401c2ae8d$a36719e0$0101a8c0@basse>
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


Arne H. Poulsen wrote:
> Hellow!!!.
> 
> Gentlemen
> I am new to this, but I have managed to install the system with the linux
> 2.4.18-pa32 kernel and it seems to be working; nevertheless It is impossible
> to get the graphical
> system to work.
> Do I have to install the HIL keyboard and mouse??.

No (there are kbd and mouse of ps2 model)

> It is working with the PS/2 keyboard.
> According to the xserverlog the system is unable to find the screen and the
> graphical
> interfase card and therefore It is not configured.
> I have done which were specified in the HOWTO regarding the XF86Config-4
> file,
> but still I get the same answer.

Which HOWTO?

> The graphical interfase seems to be a part of the motherboard and I think It
> is EG_something??
> Are there any who has a good explanation???.

If you already installed a XF86Config-4 which you can find on 
ftp.parisc-linux.org, check first if your graphic card is the buildin 
one. Then check if the default "Display Mode" match well the setup of 
your console (you can check at bootprompt> console) [on hppa the FB 
driver doesn't allow switching]

Good luck,
	Joel
