Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA10741
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 08:44:01 -0600
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] FW: hpux 11.00 near success 
In-Reply-To: Your message of "Fri, 01 Sep 2000 09:50:45 +0200."
             <A4A5E4C468B5D11190220001FA6835DD04DD86BA@epixch003>
References: <A4A5E4C468B5D11190220001FA6835DD04DD86BA@epixch003> 
Date: Fri, 01 Sep 2000 08:44:03 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13Us32-0000vt-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= I also try to rebuild tool chain with host=hppa-hpux as recommended in the
= recipe html page but it failed:
= not supported platform ... ? But as I just read recipe.hpux (and
= recipe.linux) I just note that host is not anymore specified. Is it perhaps
= the mistake? I will advise asap.

You probably want target=hppa-linux and host=hppa1.1-hpux10 or something
like that.

= > I recommend using a new tool chain.  Unfortunately we don't have
= 
= The tool chain which I just reach to rebuild successfully was date 20000829
= as well as palo?

Ok, that probably means you need a full tool chain not just
the one described in the recipes.  x86 users should probably grab the tarball
ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20000829.tgz
because building the full tool chain is often difficult.

For hpux, start with the recipe in buildutils/palinux-autobuilder.
Be sure to change this line: '$host="i386-linux";' in the script.

	-P
