Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from montperdu.pyrene.net (jmharang.net1.nerim.net [62.212.119.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id B58EE483E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Nov 2003 12:30:43 -0700 (MST)
Received: from montperdu.pyrene.net (localhost [127.0.0.1])
	by montperdu.pyrene.net (Postfix) with SMTP id D173C2C95E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Nov 2003 20:30:39 +0100 (CET)
Date: Tue, 4 Nov 2003 20:30:39 +0100
From: Jean-marc Harang <jean-marc.harang@laposte.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP 9000 E55 (and family) status
Message-Id: <20031104203039.2a83a36d.jean-marc.harang@laposte.net>
In-Reply-To: <3FA689FB.5080704@gmx.at>
References: <3FA689FB.5080704@gmx.at>
Mime-Version: 1.0
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

Le Mon, 03 Nov 2003 18:01:47 +0100
Christoph Plattner <christoph.plattner@gmx.at> a =E9crit:

> By the way, as we discuss on the E55,
> what's the status ?
>=20
> Are there any news on MUX or SCSI driver ?
>=20
> Are there any news on the NDA, .... ?
>=20
> Christoph Plattner

Hello,

Sorry, I'm a little late.=20

The status is that, as you said before, we need the MDP panel to get access
to the serial console (port 0 of the panel). I'm looking for this panel and=
 i
think i found one ;)=20

After the blind boot, we can't access to the HP-UX. No login is avaible,
because this E55 is a decommissioned one, a "gift" to the local Linux (and =
other
free software) User Group of my town (Toulouse, France).=20

So we need to make a fresh install of HP-UX. That's why we need the serial
console (cdrom boot).=20

thanks for the informations :)

Jean-marc Harang
--
http://www.culte.org
