Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA22553
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jan 2000 16:47:56 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id RAA29010
	for parisc-linux@thepuffingroup.com; Fri, 14 Jan 2000 17:48:31 -0500
Date: Fri, 14 Jan 2000 17:48:31 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000114174831.W11300@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] initcall and setup
List-ID: <linux-parisc.vger.kernel.org>


One of the things which has changed during 2.3 development is
initialisation.  We used to have files full of:

#ifdef CONFIG_FOO
	init_foo();
#endif

#ifdef CONFIG_BAR
	init_bar();
#endif

#ifdef CONFIG_QUUX
	init_quux();
#endif

which was pretty ugly stuff.

Instead, we have declarations like:

__setup("video=", video_setup);
__setup("wd33c93", wd33c93_setup);
__setup("es1370=", es1370_setup);

in each driver and then a loop in init/main.c which goes through and
calls all the __setup functions.  Much prettier, more modular, less
dependent on CONFIG_, etc.

Unfortunately, we can't take advantage of this, because we don't yet have
ELF tools.  This is implemented through an ELF section called __initcall
which contains the address of the function to call.  We could try to hack
something together with SOM, but I'd really rather not put the work in
that will just be dumped later.


This explains why we get some of the warnings on compilation;' eg:

init/main.c:170: warning: `__setup_profile_setup' defined but not used

and why if you diff our kernel against Linus', you will find that we have
reinserted some of the explicit calls to the setup routines that have
been eliminated from the mainline tree.  It also explains why sometimes
a driver may not be called even though you compiled it in.
