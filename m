Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 761394852
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Dec 2003 07:21:39 -0700 (MST)
Date: Tue, 23 Dec 2003 15:21:37 +0100
Message-ID: <3FB2652500018625@ocpmta2.freegates.net>
In-Reply-To: <20031222020743.GD26083@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] audit for copyright/license
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/3FB2652500018625/mail.tiscali.be"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/3FB2652500018625/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi Grant,

May I propose the following generic template:
/*
 *    Linux/PA-RISC Project (http://www.parisc-linux.org/)
 *    Copyright (C) <year>  <name of author>
 *
 *    This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; either version 2 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program; if not, write to the Free Software
 *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
 USA
 */

(replacing year and author's references if available)

Btw, I notice that 'FSF' address should also be updated into asm/parisc/math-emu
files?

hth,
    Joel

>-- Original Message --
>Date: Sun, 21 Dec 2003 19:07:43 -0700
>From: Grant Grundler <grundler@parisc-linux.org>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] audit for copyright/license
>
>
>On Sun, Dec 21, 2003 at 06:22:30PM +0000, Joel Soete wrote:
> in COPYING (i.e. GNU GPL version 2) under section "How to Apply These Terms

> to Your New Programs"
> stand what I would trust being the standard formula you are loocking for:

Thanks 
>or digging that up - that's in fact what I was looking for.

We need to determine which files have:
a) no copyright
b) a non standard copyright
c) no license
d) a non standard license

You have time to prepare a patch for (b) and (d)?
Preferab
>y seperate patches.

If someone prepared a precise list of (a) and (c) I could start determining
who owns (a) for each file and add the appropriate copyright.
I or willy could ask for (c) get formal permission to use GPL if it's not
part of the cu
>rent team.

thanks,
grant



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr



--========/3FB2652500018625/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="template-GPL"

LyoKICogICAgTGludXgvUEEtUklTQyBQcm9qZWN0IChodHRwOi8vd3d3LnBhcmlzYy1saW51eC5v
cmcvKQogKiAgICBDb3B5cmlnaHQgKEMpIDx5ZWFyPiAgPG5hbWUgb2YgYXV0aG9yPgogKgogKiAg
ICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQg
YW5kL29yIG1vZGlmeQogKiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogKiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgogKiAgICAoYXQg
eW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgogKgogKiAgICBUaGlzIHByb2dyYW0gaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKICogICAgYnV0
IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkg
b2YKICogICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFLiAgU2VlIHRoZQogKiAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBk
ZXRhaWxzLgogKgogKiAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQogKiAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsg
aWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQogKiAgICBGb3VuZGF0aW9uLCBJbmMu
LCA1OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9zdG9uLCBNQSAgMDIxMTEtMTMwNyAgVVNB
CiAqLwo=

--========/3FB2652500018625/mail.tiscali.be--
