Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C5054836
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Dec 2001 23:02:47 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa24 crashes on c3k 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Tue, 25 Dec 2001 22:01:28 MST." <20011226050128.821554833@dsl2.external.hp.com>
References: <Pine.LNX.4.33.0112250945530.486-100000@goliath.alaskatech.org>  <20011226050128.821554833@dsl2.external.hp.com> 
Date: Tue, 25 Dec 2001 23:02:47 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011226060247.3C5054836@dsl2.external.hp.com>
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

Grant Grundler wrote:
> Must be something related to suckyio since I'm not using any graphics
> console and that's about when console switches over.

Good guess. Just committed 2.4.16-pa25 which fixes.
suckyio requires the first PCI HBA be numbered 0 (and not 1).
Was broken by -pa24 commit.
diff will be posted to parisc-linux-cvs as usual.

grant
