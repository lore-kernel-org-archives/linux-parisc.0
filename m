Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CE93482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Apr 2002 05:59:22 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC support for dwarf2
Message-ID: <1018526304.3cb57a60c2731@webmail.tiscalinet.be>
Date: Thu, 11 Apr 2002 13:58:24 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200204081608.g38G8FB4020947@hiauly1.hia.nrc.ca>
In-Reply-To: <200204081608.g38G8FB4020947@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Dave,

Well I finished to co gcc-3.2 and gcc3.1 cvs (that is long with small 33800 baud
modem but that all I can get for cvs)

And I am already back with a problem:

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> You would need to install the cvs binutils and cvs gcc versions in some
> convenient location for the testing. 

Well I just figure out that there is no configure file in cvs of binutils.
So, in the sources directory (/GNU-Dev/parisc-linux/src/binutils) I try autoconf
but it just creates an empty configure?
What do I wrong?


Thanks in advance for additional help,
    Joel


PS: Humm I do not find any glibc CVS so I will test toolchain with glibc 2.2.5.


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
