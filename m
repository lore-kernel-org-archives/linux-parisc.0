Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id 27C8A4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 May 2003 06:37:30 -0600 (MDT)
Message-ID: <3ED8A0A2.8000808@bluehash.de>
Date: Sat, 31 May 2003 14:31:30 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rg_Benndorf?= <joerg.benndorf@t-online.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] missing tasksel option 'x-window system' on parisc
 box
References: <000c01c3267b$11f81610$1200a8c0@JOERGSPRINTER> <BAY1-DAV22xS43Tv8hm00006867@hotmail.com> <001d01c32690$60547640$1200a8c0@JOERGSPRINTER>
In-Reply-To: <001d01c32690$60547640$1200a8c0@JOERGSPRINTER>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hello Jörg,

Jörg Benndorf schrieb:

>Thank you for your hint but this doesn't seem to work - always prompts
>"unmet dependencies" / "is not going to be installed" / "is not
>installable".
>
The problem is that the package "fvwm" is in "x-window-system". But 
"fvwm" depend on the package "menu" which (i think) is not avaible for 
debian/stable. Either you are struggling with "apt" to force the 
installation with unmet dependencies or you use debian/testing. There is 
a "menu"-package.
I hope it helps,
    Rüdiger
