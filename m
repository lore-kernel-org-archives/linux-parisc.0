Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 111B148A4
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 07:00:50 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1AlqFM-0001OV-00
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 15:00:48 +0100
Date: Wed, 28 Jan 2004 15:00:48 +0100
Message-ID: <400CB8A1000067CB@ocpmta3.freegates.net>
In-Reply-To: <20040128060516.492DE4941AA@palinux.hppa>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

This boot fine on the b180 (32bit kernel), the b2k (32bit kernel only even
with CONFIG_PA20 is Ok but failed with 64bit kernel?) and N4000-55 (same
64bit kernel  build with my own kgcc-3.3.3 :)).

Any way this last test set aside any pb with _my_ gcc compiler :).

Congratulation to all,
    Joel

>-- Original Message --
>To: parisc-linux-cvs@lists.parisc-linux.org
>Date: Tue, 27 Jan 2004 23:05:16 -0700 (MST)
>From: carlos@parisc-linux.org (Carlos O'Donell)
>Reply-To: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux-cvs] linux-2.6 carlos
>
>
>CVSROOT:	/var/cvs
Module name:	linux-2.6
Changes by:	carlos	04/01/27 23:05:15

Modified files:
	.              : Makefile 

Log message:
Builds and boots on my A500 (64-bit), builds in 32-bit mode aswell (e.g.
no CONFIG_COMPAT)

_____________
>_________________________________
parisc-linux-cvs mailing list
parisc-linux-cvs@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux-cvs



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
