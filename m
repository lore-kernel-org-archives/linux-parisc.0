Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id B71AB4834
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 01:02:09 -0700 (MST)
Date: Mon, 25 Feb 2002 09:02:05 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: debian-hppa@lists.debian.org
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20020225080205.GC32703@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ext3 patch
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

The recent ext3 patch on
http://www.zip.com.au/~akpm/linux/ext3/

( http://www.zip.com.au/~akpm/ext3-2.4-0.9.17-2418p3.gz )
applies cleanly to 2.4.17-pa30 -- I recommend committing it to the
kernel CVS tree, since

a) It will be in 2.4.18 anyway
b) it fixes some problems:

0.9.17  12 Jan 2002  (Included in 2.4.18-pre5)
-------------------

- Cleanup from Manfred Spraul which provides better randomisation of
  inode generation numbers.

- A locking fix which prevents possible panics when an application is
  using ioctl(FIBMAP) against a loaded filesystem.

- Buffer locking fix for journal descriptor buffers - fixes the
  "end_request: buffer-list destroyed" crash which can occur under
  heavy VM load.

- Buffer locking fix which could cause corruption if a process is
  reading rom the underlying block device while journal recovery is in
  progress.
  

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
If Bill Gates had a dime for every time a Windows box crashed...
                ...Oh, wait a minute, he already does.
