Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF0DB48DA
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 11:37:39 -0600 (MDT)
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Message-ID: <1026927440.3d35ab5042756@webmail.tiscalinet.be>
Date: Wed, 17 Jul 2002 19:37:20 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Randolph Chung <randolph@tausq.org>,
	HPPA List <parisc-linux@parisc-linux.org>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk> <1026913104.3d357350a4057@webmail.tiscalinet.be> <20020717144543.A13352@parcelfarce.linux.theplanet.co.uk> <1026914852.3d357a24c4a4a@webmail.tiscalinet.be> <20020717142915.GG641@tausq.org> <1026922060.5709.148.camel@irongate.swansea.linux.org.uk>  <20020717150349.GN8724@tausq.org> <1026925311.5709.153.camel@irongate.swansea.linux.org.uk>
In-Reply-To: <1026925311.5709.153.camel@irongate.swansea.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Merge -rc1 -rc2 (was 2.4.19-rc1-ac6 Merge pa55: #error ...?)
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

Hi,

I merge my 19-rc1 stuff with 19-rc2 and just enounter a conflict in
include/linux/personality.h:

enum{
...
+        PER_OSF4= 0x000f,

unfortunaltely the same as our:
         PER_HPUX= 0x000f,

What should I do?

Joel



-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
