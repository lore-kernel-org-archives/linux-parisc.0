Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD311483F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Mar 2003 05:49:09 -0700 (MST)
Date: Fri, 14 Mar 2003 13:48:59 +0100
Message-ID: <3E6C78E100001649@ocpmta2.freegates.net>
In-Reply-To: <3E68A24B00000CC9@ocpmta6.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: "Randolph Chung" <tausq@debian.org>
Cc: "Matthias Klose" <doko@cs.tu-berlin.de>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>>
>Ok I am gonna try to rebuild it with gcc-3.0.
>

Wel I just do it (in 32bits naturaly) and already encounter a problem :_)
:
`gcc -print-libgcc-file-name` /usr/src/work/linux-2.4.20-pa28/arch/parisc/lib/lib.a
/usr/src/work/linux-2.4.20-pa28/lib/lib.a  \
        --end-group \
        -o vmlinux
net/network.o(.text.rtnetlink_rcv+0x84): In function `rtnetlink_rcv':
: undefined reference to `rtnetlink_rcv_skb'
make: *** [vmlinux] Error 1

(with gcc-3.2 with same src && same .config there was no pb)

Thanks in advance for advise,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
