Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E1E0482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 Jan 2003 01:56:02 -0700 (MST)
Date: Tue, 21 Jan 2003 08:02:38 +0100
Message-ID: <3E2C21FE00000116@ocpmta1.freegates.net>
In-Reply-To: <Pine.LNX.4.50.0301200433230.5018-300000@lion.ece.utexas.edu>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] X on C3000
Reply-To: "Joel Soete" <joel.soete@tiscali.be>
To: "Bala" <balak@ieee.org>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Bala,
>
>I have not been able to setup X on my C3000. It says "screen not
>found". I tried using using your XF86Config-4 file but it still doesn't
>help. I am posting the dmesg and the X logs. Can anyone figure out what
>could be the reason?
>
In your dmesg:
...
STI device: HPA4553A
stifb: Unsupported gfx card id 0x2fc1066b
...

AFAIK you can refer to: <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018795.html>

Regards,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
