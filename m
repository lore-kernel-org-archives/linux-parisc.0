Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32E43491B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Aug 2003 04:55:38 -0600 (MDT)
Date: Sat, 23 Aug 2003 12:55:35 +0300
Subject: Re: [parisc-linux] Help: Need instruction sequence for gdb breakpoint
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20030823062139.GA20379@dsl2.external.hp.com>
From: Thibaut VARENE <varenet@esiee.fr>
Content-Type: text/plain; charset=us-ascii
Cc: Lev Assinovsky <LAssinovsky@algorithm.aelita.com>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <20030823105536.125F849C32@mail.esiee.fr>
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

-------------------
> On Fri, Aug 22, 2003 at 09:13:37PM +0400, Lev Assinovsky wrote:
> > Hi!
> > 1. I meant just a hardcoded breakpoint (not hardware)
> > Partially works just BREAK 4, 8. Though I need to do "jump" to=20
next line=20
> > to continue in gdb.
>=20
> ah ok=20
> > 2. gdb doesn't work with shared libraries explicitly loaded by=20
program.
> > Could you please point to anybody from HP team?
>=20
> HP Team? Sorry but officially there is no HP parisc-linux team.
> Most of us are interested in kernel hacking and less in
> making gdb work.
>=20
> > 3. What about ddd?
>=20
> sorry - haven't looked at ddd.
>=20

ddd is a GUI frontend to gdb...


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
On vacation until Aug 25th
