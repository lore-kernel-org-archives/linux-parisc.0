Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id D40F8487D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Mar 2002 23:40:14 -0700 (MST)
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] evms-0.9.2 build utilities problem
Message-ID: <1016088011.3c9045cb06909@webmail.tiscali.be>
Date: Thu, 14 Mar 2002 07:40:11 +0100 (CET)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1016030200.3c8f63f89a0ff@webmail.tiscali.be> <20020313182335.GD6580@tausq.org>
In-Reply-To: <20020313182335.GD6580@tausq.org>
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

Randolph,

Sorry (I would have to mentioned)

Quoting Randolph Chung <randolph@tausq.org>:

> > Well launch it made an immidiate Segmentation fault.
> > 
> > Now I recompile without "-fPIC" and it works fine.
> > 
> > Any idea on what is wrong?
> 
> what versions of gcc-3.0 and binutils are you running?
> 
> dpkg -s gcc-3.0 |grep Version

Version: 1:3.0.4-3

> dpkg -s binutils |grep Version

Version: 2.11.93.0.2-3


Joel

PS: This can be reproduce with a simple "Hello World" (just to avoid to sempt
time to find back the the sources of evms)

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
