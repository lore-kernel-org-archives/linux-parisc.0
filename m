Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE950482B
	for <parisc-linux@parisc-linux.org>; Wed, 24 Oct 2001 16:45:40 -0600 (MDT)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA01851
	for <parisc-linux@parisc-linux.org>; Wed, 24 Oct 2001 16:45:39 -0600
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15wWmJ-000OzWC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Wed, 24 Oct 2001 16:45:39 -0600 (MDT)
Message-Id: <m15wWmJ-000OzWC@bame.riverrock.org>
From: bame@fc.hp.com
Reply-To: bame@fc.hp.com
Errors-To: bame@fc.hp.com
To: parisc-linux@parisc-linux.org
Date: Wed, 24 Oct 2001 16:45:39 -0600
Sender: bame@riverrock.org
Subject: [parisc-linux] IMPORTANT CVS CHANGES
List-ID: <linux-parisc.vger.kernel.org>

It's time to move CVS from puffin.external.hp.com to cvs.parisc-linux.org

WHEN: Friday, 26-October, noon local time (US-MDT aka GMT-6)

At noon puffin.external's CVS will go down and shortly thereafter
CVS will come up on cvs.parisc-linux.org along with an e-mail
announcement.  Send questions to the list, or if that's too embarassing
to me or taggart@fc.hp.com

		WHAT YOU MUST DO

1) You will not need to commit outstanding changes or do anything else
   unusual prior to the switchover.

2) You're probably setting CVSROOT somewhere, perhaps in your
   .profile.  Change puffin.external.hp.com to cvs.parisc-linux.org and
   /home/cvs/parisc to /var/cvs

3) Every file named CVS/Root will need the same changes as #2.
   Use the script 'move-cvs' to do this for you -- simply run it
   in your top-level CVS directories, or the one above that perhaps.
   'move-cvs' is attached to the end of this message and is available
   from CVS on puffin.external as build-tools/move-cvs.

4) Wherever you used puffin.external in a CVS-related way, start using
   cvs.parisc-linux.org instead, for example you might have web bookmarks
   for browsing the CVS archive.

5) Don't count on LXR being available any time soon...

   	-Paul Bame


---------- move-cvs script starts next line
#!/bin/sh

find . -type d -name CVS -print |
    while read dir
    do
	[ -s $dir/Root ] || continue
	root=$(<$dir/Root)
	case $root in
	    :pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc)
	    	newroot=:pserver:anonymous@cvs.parisc-linux.org:/var/cvs;;
	    :ext:*@puffin.external.hp.com:/home/cvs/parisc)
		user=${root#:ext:}
		user=${user%@puffin.external.hp.com:/home/cvs/parisc}
		newroot=:ext:$user@cvs.parisc-linux.org:/var/cvs;;
	    puffin.external.hp.com:/home/cvs/parisc)
	        newroot=cvs.parisc-linux.org:/var/cvs;;
	    /home/parisc/cvs)
	    	newroot=cvs.parisc-linux.org:/var/cvs;;
	    :pserver:anonymous@pehc:/home/cvs/parisc)
	    	newroot=:pserver:anonymous@cvs.parisc-linux.org:/var/cvs;;
	    :ext:*@pehc:/home/cvs/parisc)
	        newroot=cvs.parisc-linux.org:/var/cvs
		user=${root#:ext:}
		user=${user%@pehc:/home/cvs/parisc}
		newroot=:ext:$user@cvs.parisc-linux.org:/var/cvs;;
	    pehc:/home/cvs/parisc)
	        newroot=cvs.parisc-linux.org:/var/cvs;;
	    /home/parisc/cvs)
	    	newroot=cvs.parisc-linux.org:/var/cvs;;
	    *) echo -e "\nCannot fix $dir/Root ($root)" >&2
	    	continue;;
	esac

	cp $dir/Root $dir/Root.pehc
	echo $newroot > $dir/Root
	echo -e ".\c"
    done
echo
