Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 9F1EE482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 00:29:50 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Bob Corner <bcorner@telusplanet.net>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] X on my machine?
Date: Tue, 21 May 2002 08:25:46 +0200
References: <1021948605.2030.15.camel@taz.ab.hsia.telus.net>
In-Reply-To: <1021948605.2030.15.camel@taz.ab.hsia.telus.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200205210825.47013.deller@gmx.de>
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

On Tuesday 21 May 2002 04:36, Bob Corner wrote:
STI byte mode ROM at f8000000, hpa=f8000000
STI byte mode ROM, id 26d1482a-40a00499, conforms to spec rev. 8.02
STI device: HPA1659A
pty: 256 Unix98 ptys configured

You need to have stifb activated (e.g. when Linux boots up you should see
a penguin in the left top corner). Update to a newer kernel.

Greetings,
Helge
