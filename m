Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from iut-lannion.fr (alba.iut-lannion.fr [192.70.33.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 207CE482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Apr 2002 03:14:22 -0600 (MDT)
Received: from pcp91 ([129.20.233.91])
          by iut-lannion.fr (8.11.0/jtpda-5.3.1) with SMTP id g3M9E8S07303
          for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Apr 2002 11:14:13 +0200
Message-Id: <200204220914.g3M9E8S07303@iut-lannion.fr>
Date: Mon, 22 Apr 2002 11:13:02 +0200
To: parisc-linux@lists.parisc-linux.org
From: Bruno =?iso-8859-1?Q?L=E9on?= <nonolemono@yahoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] How to install emacs 21.2 on a B180L
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

I'm trying to install emacs 21.2 on a B180L,  but I can't compile the sources.
The system tells me that "emacs hasn't been ported on
hppa-unknown-linux-system".

I think that the script "configure" is checking the system type.
Is there any way to avoid that by telling to "configure" that my computer
is not a hppa but an emacs21.2-supported architecture?

Thanks.
