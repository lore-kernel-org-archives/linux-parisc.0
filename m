Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3007F486E
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 08:11:51 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6HFM7u6006697;
	Wed, 17 Jul 2002 16:22:08 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6HFM6xR006695;
	Wed, 17 Jul 2002 16:22:06 +0100
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: joel.soete@freebel.net
Cc: HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <1026913104.3d357350a4057@webmail.tiscalinet.be>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
	<1026913104.3d357350a4057@webmail.tiscalinet.be>
Content-Type: text/plain
Date: 17 Jul 2002 16:22:06 +0100
Message-Id: <1026919326.1688.142.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Wed, 2002-07-17 at 14:38, joel.soete@freebel.net wrote:
> Hi Alan,
> 
> I try to build your 2.4.19-rc1-ac6 on my parisc-linux box but I got early
> following error messages:
> 
> /usr/src/kernel-source-2.4.19-rc1-ac6-20020717/include/asm/system.h:55:2: #error
> andre hedrick screwed this up please help unscrew in order to clean up

Deleted that chunk. It shouldnt be needed any more. Thats one I missed
