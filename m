Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DE42482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Oct 2002 07:42:26 -0700 (MST)
Subject: Re: [parisc-linux] HP 9000 K200
From: Ryan Bradetich <rbradetich@uswest.net>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: Emilio =?ISO-8859-1?Q?Adrianz=E9n?= Acosta <eadrianzen@tsd.com.pe>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DBF8946.6030208@itp.bg>
References: <013b01c27f5f$48a4dd60$13dca8c0@tsd.com.pe>
	<3DBF8946.6030208@itp.bg>
Content-Type: text/plain; charset=ISO-8859-1
Date: 30 Oct 2002 07:42:22 -0700
Message-Id: <1035988942.11865.2.camel@beavis>
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

Emilio,

Debian 3.0 out of the box will not support the K class systems because
of the serial mux/pdc console.

Use the ESIEE installers, (search the mail list for details) then
everything should work as expected.

Thanks,

- Ryan

On Wed, 2002-10-30 at 00:24, Stephan Trajkoff wrote:
> Emilio Adrianz=E9n Acosta wrote:
>=20
> > Hi there:
> > =20
> > I have the oportunity to buy an hp 9000 k200 server, but I need run=20
> > linux on it. I had read the mailing list history but the last email=20
> > about is from March. I would to know if someone has installed it=20
> > succesfuly with the new Debian 3.0 from July.
> > =20
> > Thanks.
> > =20
> > Emilio.
>=20
>=20
> Hello Emilio,
> I have K210 and I have been installed 0.9.3 parisc linux, after I made=20
> dist-upgrade all is working, and I am thinking
> that you shouldn't have problems with debian 3.0
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>=20
