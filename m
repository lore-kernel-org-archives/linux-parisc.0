Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E48F482A
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 07:39:19 -0600 (MDT)
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
Message-ID: <1026913104.3d357350a4057@webmail.tiscalinet.be>
Date: Wed, 17 Jul 2002 15:38:24 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@parisc-linux.org
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
In-Reply-To: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
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

Hi Alan,

I try to build your 2.4.19-rc1-ac6 on my parisc-linux box but I got early
following error messages:

/usr/src/kernel-source-2.4.19-rc1-ac6-20020717/include/asm/system.h:55:2: #error
andre hedrick screwed this up please help unscrew in order to clean up

in the code there is this comment:

/*
 * __save_and_sti(x) == __save_flags(x); ide__sti();
 *                      __save_flags(x); __sti();
 *
 */

What does it mean? (I do not find any where else some ide__sti?)
May I try to define this function (__save_and_sti) as for other arch (but alpha)?

Thanks in advance for advice,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
