Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18103489F
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 12:58:55 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6HK9Cu6007372;
	Wed, 17 Jul 2002 21:09:13 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6HK99LH007370;
	Wed, 17 Jul 2002 21:09:09 +0100
Subject: Re: [parisc-linux] Merge -rc1 -rc2 (was 2.4.19-rc1-ac6 Merge pa55:
	#error ...?)
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: joel.soete@freebel.net
Cc: Randolph Chung <randolph@tausq.org>,
	HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <1026927440.3d35ab5042756@webmail.tiscalinet.be>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
	<1026913104.3d357350a4057@webmail.tiscalinet.be>
	<20020717144543.A13352@parcelfarce.linux.theplanet.co.uk>
	<1026914852.3d357a24c4a4a@webmail.tiscalinet.be>
	<20020717142915.GG641@tausq.org>
	<1026922060.5709.148.camel@irongate.swansea.linux.org.uk>
	<20020717150349.GN8724@tausq.org>
	<1026925311.5709.153.camel@irongate.swansea.linux.org.uk>
	<1026927440.3d35ab5042756@webmail.tiscalinet.be>
Content-Type: text/plain
Date: 17 Jul 2002 21:09:09 +0100
Message-Id: <1026936549.1688.157.camel@irongate.swansea.linux.org.uk>
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

On Wed, 2002-07-17 at 18:37, joel.soete@freebel.net wrote:
> Hi,
> 
> I merge my 19-rc1 stuff with 19-rc2 and just enounter a conflict in
> include/linux/personality.h:
> 
> enum{
> ...
> +        PER_OSF4= 0x000f,
> 
> unfortunaltely the same as our:
>          PER_HPUX= 0x000f,
> 
> What should I do?

I've asked Marcelo to use 0x0010 for OSF4 (its just added and not an
established constant)
