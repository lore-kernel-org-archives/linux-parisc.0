Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tassadar.physics.auth.gr (tassadar.physics.auth.gr [155.207.123.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id C51F94829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Nov 2002 01:04:14 -0700 (MST)
Date: Mon, 4 Nov 2002 10:03:57 +0200 (EET)
From: Dimitris Zilaskos <dzila@tassadar.physics.auth.gr>
To: Jochen Friedrich <jochen@scram.de>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	"BUCH-PEDERSEN,LEIF (HP-France,ex1)" <leif_buch-pedersen@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] ip6tables problem 
In-Reply-To: <Pine.LNX.4.44.0211032348580.24848-100000@gfrw1044.bocc.de>
Message-ID: <Pine.LNX.4.44.0211040957290.30489-100000@tassadar.physics.auth.gr>
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

On Sun, 3 Nov 2002, Jochen Friedrich wrote:
>
> However, i'm not using the ip6tables on that boxes as all three of them
> are behind dedicated packet filters...

 I have built and use 2.4.19-pa22 kernels with the latest stable usagi
patch applied, with only one reject on some network driver I do not
possess . I had to disable many netfilter for ipv6 options in order for
the kernel to compile . And those that I had enabled dont seem to work :)
 Currently using ipv6 on two 715/33 and one 715/50 ...and it works
perfectly:)

 Regards ,

--
=============================================================================

Dimitris Zilaskos

Department of Physics @ Aristotle Univercity of Thessaloniki , Greece
PGP key : http://tassadar.physics.auth.gr/~dzila/pgp_public_key.asc
          http://egnatia.ee.auth.gr/~dzila/pgp_public_key.asc
MD5sum  : 4f84f3f53cb046008b4abcb2a092d28d  pgp_public_key.asc
=============================================================================
