Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08F53482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Dec 2002 04:18:02 -0700 (MST)
Message-ID: <3DFC74CB.2060208@freebel.net>
Date: Sun, 15 Dec 2002 12:25:47 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-snapshot (3.3) and linux-2.4.20-pa13
References: <Pine.LNX.4.44.0212132231260.18468-100000@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.44.0212132231260.18468-100000@sal.ucc.ie>
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

Max,

Sorry, I would have to mentionned that:
those stuff can be saffely removed (as far as can test we gcc-3.0 and 
later as 3.1 3.2 and 3.3 (aka snapshot))

Cheers,
	Joel

M. Grabert wrote:
> Debian's gcc snapshot won't compile the kernel, (probably) due to the
> same reason as here:
> 
> ====
> Changes since 1.46: +1 -1 lines
> Diff to previous 1.46
> 
> 2.5.47-pa8: remove reference to $$mulU millicode function for gcc 3.3
> =====
> 
> at least it's the same error message ('undefined reference ...').
> 
> greetings max
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
