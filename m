Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "robert klough" <bobklough@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] graphics console only displays the penguin 
In-Reply-To: Message from "robert klough" <bobklough@hotmail.com>
   of "Fri, 26 Jul 2002 14:44:36 -0000." <F7044EomUPAmj10OcX80000c0e0@hotmail.com>
References: <F7044EomUPAmj10OcX80000c0e0@hotmail.com> 
Date: Fri, 26 Jul 2002 14:46:28 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020726204628.3FDC0482B@dsl2.external.hp.com>
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

"robert klough" wrote:
> I've been advised to uncomment the line containing ttyS0 in the 
> /etc/inittab, but this line is already uncommented (without the #).

As already noted, use /dev/tty0. ttyS0 is serial port login.

> How can I have both serial and graphics consoles?

No. I define console as where the *firmware* sends output
when booting. Linux attempts to respect the firmware settings.

You can have a serial console and a gfx login prompt.
And vice versa. It's a matter of setting CONSOLE paths
at the PDC prompt and setting up gettys' in /etc/inittab.

grant
