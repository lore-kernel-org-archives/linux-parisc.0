Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 968184829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 21 Sep 2002 10:51:57 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep15-int.chello.at
          (InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP
          id <20020921165154.LUIQ9517.viefep15-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 21 Sep 2002 18:51:54 +0200
Message-ID: <3D8CA3A9.E3803D8F@gmx.at>
Date: Sat, 21 Sep 2002 18:51:53 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] emacs: Unresolved inheritance operation
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

Hello PA-RISC experts !

I already have a problem with `emacs'.

When I start `emacs' on a HP machine (independen, if
it is a Apollo 9000/720/50 or the E55 server (9000/856)),
I get the error message:

Error: Unresolved inheritance operation

If I start `emacs' with an empty DISPLAY variable
(use without X mode), emacs work !!!
What is the problem here ?

Emacs version output:

GNU Emacs 20.7.2
Copyright (C) 1999 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.


I use the debian SID distribution for months now, which
is always updated. I think the current setup is only
some weeks old !!

GLIBC is libc-2.2.5 

Whats the reason here.

Bye
Christoph P.


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
