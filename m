Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sccrmhc03.attbi.com (sccrmhc03.attbi.com [204.127.202.63])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DB3F4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 May 2003 13:59:17 -0600 (MDT)
From: "Jaime Ash" <ja@lachivaquemada.com>
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 16 May 2003 12:59:17 -0700
Message-ID: <NEBBJAILOLAHGDBEOCIOEENIDGAA.ja@lachivaquemada.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030516172555.GA10530@dsl2.external.hp.com>
Subject: [parisc-linux] RE: Help configuring an HIL mouse on an HP 715. - (Major disaster! - Am I back at ground level 0?)
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

>> Is there an easy way to disable the blue screen after booting to the old
>> kernel?

> Yes
> 1) figure out which script is presenting that menu.
>   (eg "fgrep -i new_network /etc/init.d/*")
I assume that by "new_network" you really mean one of the strings that are
displayed in the Debian GNU Linux blue screen with the gray menu (such as
"Choose your current network-environment !", "Set_up_new_environment" or
"Installation_default") and that you are trying to find a file in the init.d
directory that contains that string.  Am I correct?
I tried all three, as follows (but no file was found with any of these
commands):
fgrep -i Set_up_new_environment /etc/init.d/*
fgrep -i Installation_default /etc/init.d/*
fgrep -i 'Choose your current network-environment !' /etc/init.d/*
So, here are my next questions:
1. Is init.d the only directory to search?
2. Can initialization scripts be stored elsewhere?
Best regards,
Jaime
