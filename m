Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 154A8482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 03:01:17 -0600 (MDT)
Message-ID: <3D1199DB.3050702@esiee.fr>
Date: Thu, 20 Jun 2002 11:01:15 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mail-man
References: <03273D4BC7F4D511AC440008C7E6F881542340@nlntmail2b.ats.nld.alcatel.nl>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi,

There is a binary from debian:
alysee:~$ apt-cache search mailman
lists-archives - Web archive for mailing lists
mailman - Powerful, web-based mailing list manager
So if you still want to build your own, download the tarball and the 
patch applied by the maintainer from:
http://packages.debian.org/testing/mail/mailman.html
and have a look on the options used.

Regards,
Matthieu

Witvliet, Hans wrote:

>Hi,
>
>Short question,
>
>Did anybody already succeed in compiling mailman?
>Here (712/100) it failed.
>
>Hans
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
