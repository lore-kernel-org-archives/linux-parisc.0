Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 7409B482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Nov 2001 19:48:42 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Jurij Smakov <jurijus@theophys.kth.se>,
	"Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Date: Fri, 30 Nov 2001 03:47:15 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.21.0111221534400.22553-100000@uranus.theophys.kth.se>
In-Reply-To: <Pine.LNX.4.21.0111221534400.22553-100000@uranus.theophys.kth.se>
MIME-Version: 1.0
Message-Id: <20011130024842.7409B482C@dsl2.external.hp.com>
Subject: [parisc-linux] Power button support in kernel 2.4.16-pa4
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

I've just committed some changes to the parisc cvs kernel (>= 2.4.16-pa4)
which adds support for the power-button.
Those changes include, that after you pressed the power button the kernel
will initiate a clean system shutdown followed by a complete power-off.
The patches were sucessfully tested on a c300 and 715/64 - and hopefully
they will also work for other machines - if not, please let me know.

Greetings,
Helge
