Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B2D44840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Feb 2002 01:46:03 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "James S" <smith-james@home.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Setting up X
Date: Wed, 13 Feb 2002 09:45:35 +0100
References: <002401c1b465$dc2fc7e0$02c1a8c0@james.co.uk>
In-Reply-To: <002401c1b465$dc2fc7e0$02c1a8c0@james.co.uk>
MIME-Version: 1.0
Message-Id: <E16av3A-0002Tb-00@linuxlab.wdf.sap-ag.de>
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

On Wednesday 13 February 2002 09:10, James S wrote:
> This might be a silly question, but here goes.......
>
> where do i get the stiFB driver ?
>
> i've got a 712/60
>
> help !
>
>
> James S

Hi James,

the stiFB driver should already be compiled into the kernel. 
If you see the Tux Penguin at bootup the stiFB driver is
active - if  you don't see it install a newer kernel.

Then apt-get the necessary XFree86 packages and
read the FAQ at http://www.parisc-linux.org/faq/index.html
FAQ entries #12 and #13 should be most interesting for you.
The Link in FAQ entry #12 will also point you to a XF86Config-4 
file which you might use to start with.

Best regards,
Helge
