Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kura.mail.jippii.net (kura.mail.jippii.net [195.197.172.113])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45E39482B
	for <parisc-linux@parisc-linux.org>; Fri,  2 Nov 2001 07:14:15 -0700 (MST)
Message-ID: <003101c163a9$48570590$56dc10c3@amos>
From: "Kaj-Michael Lang" <milang@tal.org>
To: "kenneth westelinck" <kennywest1@hotmail.com>,
	<parisc-linux@parisc-linux.org>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com>
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
Date: Fri, 2 Nov 2001 16:18:44 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> "./configure --build=hppa-hpux --host=hppa-hpux". Again I passed the test
so

Try:

./configure --build=hppa-linux --host=hppa-linux

Works with a bunch of software that won't recogonice "parisc"

--
Kaj-Michael Lang , milang@tal.org
