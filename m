Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id DFE48482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 11:52:44 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16QCDq-0008Eo-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 19:52:42 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1011034362.3c4328fae83be@webmail.tiscalinet.be>
Date: Mon, 14 Jan 2002 19:52:42 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Xfree86 error
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

Hi all,

Since I upgrade XFree86 to release 4.1.0-11, I got following error message:

(**) Option "CorePointer"
(**) Configured Mouse: Core Pointer
(**) Option "Device" "/dev/psaux"
(==) Configured Mouse: Buttons: 3
(**) Option "Emulate3Buttons" "true"
(**) Configured Mouse: Emulate3Buttons, Emulate3Timeout: 50
(**) Option "ZAxisMapping" "4 5"
(**) Configured Mouse: ZAxisMapping: buttons 4 and 5
(II) XINPUT: Adding extended input device "Configured Mouse" (type: MOUSE)
Could not init font path element unix/:7100, removing from list!

even thought ps -ef | grep xfs answer
root  219  1 0 Jan11 ?  00:00:00  /usr/bin/X11/xfs -daemon

Any idea?

Thanks in advance for help,
        Joel

PS: xfs was not used before (that is why I do not notice it before)


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
