Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from goliath.alaskatech.org (207-5-237-24-cable.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B8C7483A
	for <parisc-linux@parisc-linux.org>; Sat, 23 Mar 2002 22:41:44 -0700 (MST)
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.12.2/8.12.2) with ESMTP id g2O5VwbX018694
	for <parisc-linux@parisc-linux.org>; Sat, 23 Mar 2002 20:31:58 -0900
Date: Sat, 23 Mar 2002 20:31:58 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0203232012090.18420-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Something broken in dpkg/dselect/apt?
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

A couple days ago I apt-get update/upgraded my C180, since it had been off
for a few weeks while I was moving. Everything seemed to go fine, no
errors. Also cvs'd and updated to 2.4.18-pa05 at the same time, again
without errors. Shut it down, turned it on today, and now apt-get update
(or dselect update) fails. Updates download, then errors "Failed to fetch
-x-  rename failed, no such file or directory" and "couldn't stat -x- -
stat (2 no such file or directory". It then helpfully suggests that I
rerun the apt-get udpate... I cleared the package list in dpkg, I
recreated my sources.list file, and I checked to see if the permissions
were gone in /var/lib/apt, which they don't appear to be. The files it
fails to rename are there, there's rwx on them, and I'm in as root...

Has anyone noticed this, or heard of this? As a possibly related note,
rerunning cvs to check the kernel version gives me the same three files
updating, and it appears that cvs thinks the update is failing, so every
time I cvs-update it re-downloads them... It's run fine all day, no
instability or errors, rebooting showed no errors. Strange...

If anyone can suggest how to approach this I'm all ears...
